
class RMVVideo {
  constructor(replay_str) {
    this.replay_str = replay_str;
    this.read_pos = 0;
    this.error = null;

    this.init_consts();

    try {
      this.parse();
      return true;
    }
    catch (err) {
      this.error = err;
      return false;
    }
  }

  parse() {
    // make sure this is the right file type
    let extension = this.consume_str(4);
    if (extension != "*rmv") throw "wrong_extension";

    // make sure this is a version of the format we understand
    let ftype = this.consume_int(2);
    if (ftype != 1) throw "unknown_format_version";

    // lengths of various fields that we will need later
    let filesize = this.consume_int(4);
    let result_str_size = this.consume_int(2);
    let version_info_size = this.consume_int(2);
    let player_info_size = this.consume_int(2);
    let board_size = this.consume_int(2);
    let preflagged_size = this.consume_int(2);
    let properties_size = this.consume_int(2);
    let vid_size = this.consume_int(4);
    let checksum_size = this.consume_int(2);

    // result string that contains metainfo in text format
    let result_str = this.consume_str(result_str_size);

    // version info in text format
    this.version_info = this.consume_str(version_info_size);

    // player fields - name, nickname, country [, token]
    let num_player_fields = this.consume_int(2);
    let player_fields = [];
    for (let ii=0; ii<num_player_fields; ii++) {
      let field_size = this.consume_int(1);
      player_fields.push(this.consume_str(field_size));
    }

    // board
    this.timestamp_boardgen = this.consume_int(4);
    this.cols = this.consume_int(1);
    this.rows = this.consume_int(1);
    this.num_mines = this.consume_int(2);
    this.mines = [];
    for (let ii=0; ii<this.num_mines; ii++) {
      let col = this.consume_int(1);
      let row = this.consume_int(1);
      this.mines.push([row, col]);
    }

    // preflags
    this.preflags = [];
    if (preflagged_size) {
      let num_preflags = this.consume_int(2);
      for (let ii=0; ii<num_preflags; ii++) {
        col = this.consume_int(1);
        row = this.consume_int(1);
        this.preflags.push([row, col]);
      }
    }

    // properties
    let properties = [];
    for (let ii=0; ii<properties_size; ii++) {
      properties.push(this.consume_int(1));
    }

    // we've now read all metainfo - time to convert it
    // properties
    this.properties = {
      questionmarks: !!properties[0],
      nonflagging: !!properties[1],
      mode: this.MODES[properties[2]],
      level: this.LEVELS[properties[3]]
    };
    // upcoming vsweep release will use utf8 and use this field to indicate
    // that
    if (properties.length > 4) {
      this.is_utf8 = !!properties[4];
    }
    else {
      this.is_utf8 = false;
    }

    // player data
    this.player_data = {};
    for (let ii=0; ii<player_fields.length; ii++) {
      this.player_data[this.PLAYER_FIELDS[ii]] = player_fields[ii];
    }

    // result_str
    this.result_str_data = {};
    for (let attr of result_str.split("#")) {
      let delim_index = attr.indexOf(":")

      let key = attr.slice(0, delim_index);
      let value = attr.slice(delim_index + 1);

      this.result_str_data[key.trim()] = value.trim();
    }
    this.bbbv = parseInt(this.result_str_data["3BV"]);

    // let's parse the events!
    this.events = [];
    while (true) {
      let event_code = this.consume_int(1);
      if (event_code == 0) {
        // timestampchange, deprecated but implementing just in case
        this.events.push({
          type: "timestamp_change",
          new_timestamp: this.consume_int(4)
        });
      }
      else if (1 <= event_code && event_code <= 7) {
        // mouse event
        let gametime = this.consume_int(3);
        let numflags = this.consume_int(1);
        // offsets - vsweep weirdness
        let xpos = this.consume_int(2) - 12;
        let ypos = this.consume_int(2) - 56;
        this.events.push({
          type: "mouse",
          subtype: this.MOUSE_EVENT_TYPES[event_code],
          gametime: gametime,
          numflags: numflags,
          xpos: xpos,
          ypos: ypos,
        });
      }
      else if (15 <= event_code && event_code <= 17) {
        // game over
        this.events.push({
          type: "terminate",
          how: this.TERMINATION_EVENT_TYPES[event_code],
        });
        break;
      }
      else if (9 <= event_code && event_code <= 27) {
        // board event - vsweep doesn't reconstruct what happened from the
        // replay. Instead, it saves what happens on the board in board events.
        let col = this.consume_int(1);
        let row = this.consume_int(1);
        this.events.push({
          type: "board",
          subtype: this.BOARD_EVENT_TYPES[event_code],
          row: row,
          col: col,
        });
      }
    }

    // time in thousandths of a second
    this.timeth = this.consume_int(3);
    // checksum
    this.checksum = this.consume_str(checksum_size);
  }

  consume(num_bytes) {
    this.read_pos += num_bytes;
  }

  consume_str(num_bytes) {
    let result = this.replay_str.slice(
      this.read_pos,
      this.read_pos + num_bytes
    );
    if (!result) throw "eof";
    this.read_pos += num_bytes;
    return result;
  }

  consume_int(num_bytes) {
    let result = 0;
    for (let ii=0; ii<num_bytes; ii++) {
      result = result << 8;
      let chr = this.replay_str[this.read_pos].charCodeAt();
      if (chr === undefined) throw "eof";
      result += chr;
      this.read_pos++;
    }
    return result;
  }

  init_consts() {
    // no class members in ES6
    this.MODES = {
        0: "normal",
        1: "UPK",
        2: "cheat",
        3: "density",
    };

    this.LEVELS = {
        0: "beginner",
        1: "intermediate",
        2: "expert",
        3: "custom",
    };

    this.MOUSE_EVENT_TYPES = {
        1: "move",
        2: "lmb_down",
        3: "lmb_up",
        4: "rmb_down",
        5: "rmb_up",
        6: "mmb_down",
        7: "mmb_up",
    };

    this.BOARD_EVENT_TYPES = {
        9: "pressed",
        10: "pressed_qm",
        11: "closed",
        12: "qm",
        13: "flag",
        14: "open",
        18: "open_0",
        19: "open_1",
        20: "open_2",
        21: "open_3",
        22: "open_4",
        23: "open_5",
        24: "open_6",
        25: "open_7",
        26: "open_8",
        27: "open_blast"
    };

    this.TERMINATION_EVENT_TYPES = {
        15: "blast",
        16: "win",
        17: "other"
    };

    this.PLAYER_FIELDS = [
        "name",
        "nickname",
        "country",
        "token"
    ];
  }
}

window.RMVVideo = RMVVideo;
