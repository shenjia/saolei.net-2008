"use strict";

//点击导入按钮,使files触发点击事件,然后完成读取文件的操作
$("#fileImport").click(function () {
    $("#files").click();
})


var video=new Array();//全部鼠标事件
var number=0;//字符读取进度
var file=new Array();
var fade=500;//淡入淡出时间
var xmlhttp=null;

function loadVideo(name){

	if (window.XMLHttpRequest){
		//  IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
		xmlhttp=new XMLHttpRequest();
	}else{
		// IE6, IE5 浏览器执行代码
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
    //需要将responseType设为Blob才可以作为filereader参数传入
    xmlhttp.responseType = "blob";

	xmlhttp.onreadystatechange=function(){
        if(xmlhttp.readyState==4){
            if(xmlhttp.status==200||xmlhttp.status==0){
                console.log('----- 播放录像 -----');
                console.log("服务器响应: "+xmlhttp.status);
                //xmlhttp.response为Blob对象，还需通过Filereader转为BinaryString编码格式
                analyze_video(name,xmlhttp.response);

                $('#Window_Frame', parent.document).fadeOut(fade);
                $('#Window_Video', parent.document).fadeIn(fade,function(){
                    pause_avf();pause_avf();//走遍两个分支
                });
            }else{
                //录像读取错误，弹出提示信息
                alert("录像获取："+xmlhttp.status+" 错误");
                closeVideo();
            }
        }
	}
    xmlhttp.open("GET",name,true);
    xmlhttp.send();
}

//录像播放错误
function videoError(message){
    //以遮罩是否显示作为是否执行操作的判断依据,忘了有啥用了，先放着吧（应该是前进后退？）
    if($('#divPageMask', parent.document).width()>0){
        alert(message);
        $('#Window_Frame', parent.document).fadeIn(0);
        $('#Window_Video', parent.document).fadeOut(0);
    }
}

//隐藏当前窗口并结束录像播放
function closeVideo(){
    // container.init(0);
    if($('#divPageMask', parent.document).width()>0){//以遮罩是否显示作为是否执行操作的判断依据
        $('#Window_Frame', parent.document).fadeIn(fade);
        $('#Window_Video', parent.document).fadeOut(fade);//callback不带括号为淡出后执行，加括号为立即执行
    }else{
        $('#Window_Video', parent.document).fadeOut(0);
    }
}

//结束录像播放并退出录像查看
function exitVideo(){
    container.init(0);
    window.parent.End_Mask();
    window.parent.document.getElementById('Window_Box').style.display='none';
    window.parent.document.getElementById('Window_Video').style.display='none';
    window.parent.document.getElementById('Window_Frame').style.display='block';
}

function charCodeAt(char){
    //当出现在文件意外结尾会有undefined对象
    //对undefined对象进行charCodeAt操作时
    //先向用户报错再停止程序运行(charCodeAt操作报错即停止运行)
    if(char==undefined){
        videoError('录像文件意外结尾，请检查录像文件！');
    }
    return char.charCodeAt();
}

function playAvfVideo(result){
	reset();
    //当读取完成后回调这个函数,然后此时文件的内容存储到了result中,直接操作即可
    // console.log(this.result);
    var board=new Array();//雷的分布
    number=5;//字符读取进度，不要放在level定义下面
    var level=charCodeAt(result[number])-2;//级别

    var timestamp="";//时间戳
    var events=new Array();//鼠标事件
    video=new Array();
    path=0;
    var size=0;//鼠标事件长度
    var realtime="";
    var skin="";
    var player="";//玩家标志

    if(level==1||level==2||level==3){
    	container.init(level);
    	for(var i=0;i<container.rows*container.columns;i++){
    		board[i]=0;
    	}
        for(var i=++number;i<number+2*container.bombNumber;i+=2)
        {
        	board[container.columns*(charCodeAt(result[i])-1)+(charCodeAt(result[i+1])-1)]=1;
        	// console.log(charCodeAt(result[i])+' '+charCodeAt(result[i+1]));
        }

        while(number<result.length&&(result[number-2]!='['||result[number]!='|')){//时间戳开始标志
        	number++;
        	// console.log(number+':'+charCodeAt(result[number]));
        }

        // console.log(charCodeAt(result[number-4])+'..............................');
        if(charCodeAt(result[number-4])==17){//question marks
        	document.getElementById("question").innerHTML='取消问号';
			question=true;
        }
        else{
        	document.getElementById("question").innerHTML='标记问号';
			question=false;
        }

        number++;
        while(number<result.length&&result[number]!=']'){//时间戳结束标志
        	timestamp+=result[number];
        	// console.log(number+':'+result[number]);
        	number++;
        }//时间戳读取完成
        let array=timestamp.split("|");
        let last=array[array.length-1];
        timestamp=array[0];

        for(var i=0;i<7;i++){
        	events[i]=0;
        }
        while(events[2]!=1||events[1]>1){
        	events[0]=events[1];
        	events[1]=events[2];
        	events[2]=charCodeAt(result[number++]);
        }
        for(var i=3;i<8;i++){
        	events[i]=charCodeAt(result[number++]);
        }
        while(true){	
        	video[size]=new Mouse_event();
        	video[size].mouse=events[0];

            //当鼠标有左键和移动外的事件时判断style为FL，否则为undefined(NF)
            if(events[0]!=1&&events[0]!=3&&events[0]!=5&&events[0]!=21)video[0].style="FL";

        	video[size].rows=parseInt((events[1]*256+events[3])/16+1);
        	video[size].columns=parseInt((events[5]*256+events[7])/16+1);
        	video[size].x=events[1]*256+events[3];
        	video[size].y=events[5]*256+events[7];
        	video[size].sec=events[6]*256+events[2]-1;
        	video[size].hun=events[4];

        	if(size>0){//计算path
        		video[size].path=video[size-1].path+Math.pow((Math.pow(video[size].x-video[size-1].x,2)+Math.pow(video[size].y-video[size-1].y,2)),0.5);
        	}
        	else{
        		video[size].path=0;
        	}

        	if(video[size].sec<0)break;//出错处理
        	for(var i=0;i<8;++i){
        		events[i]=charCodeAt(result[number++]);
        	}
        	size++;
        }//events时间读取完成

        //以iframe的src属性判断当前界面是否为录像上传界面
        if($('#Window_Frame', parent.document).attr('src')==="/Video/Upload.asp"){
            let inputBv=$('#Window_Frame', parent.document).contents().find("input[name='Video_3BV']")[0];
            let inputTime=$('#Window_Frame', parent.document).contents().find("input[name='Video_Score']")[0];
            let inputStyle=$('#Window_Frame', parent.document).contents().find("input[name='Video_IsNoFrag']")[0];
            inputBv.value=parseInt(last.substring(1,last.lastIndexOf("T")));
            inputTime.value=Math.round((parseFloat(last.substring(last.lastIndexOf("T")+1))-1)*100)/100;
            if(video[0].style==="FL"){//默认undefined为NF
                inputStyle.checked=false;
            }else{
                inputStyle.checked=true;
            }
            $('#Window_Video', parent.document).fadeOut(0);//防止显示录像播放界面
            return;
        }

        container.set_viedo_mine(board);//按录像布雷`
        
    	while(number<result.length){
            if(result.substring(++number,number+10)=="RealTime: "){
                number+=10;
                break;
            }
    	}

        while(number<result.length&&result.substring(number,number+6)!="Skin: "){
            realtime+=result[number];
            number++;
        }
        console.log('Realtime: '+realtime);

        if(result.substring(number,number+6)=="Skin: "){
            while(number<result.length&&charCodeAt(result[number])!=13){
                skin+=result[number];
                number++;
            }
            console.log(skin);

        	// number++;//使当前读取进度number位于间隔符后一位
        	while(++number<result.length&&charCodeAt(result[number])!=13){
	        	player+=result[number];
	        }//标志读取完成
            console.log('Player: '+player);

            for(let index=0;index<player.length;index++){
                if(charCodeAt(player[index])>128&&xmlhttp!=null){
                    //扫雷网不需要考虑上传本地录像导致avf数据来源不同，即selectedFile与xmlhttp
                    let blob=new Blob([xmlhttp.response.slice(number-player.length,number)]);
                    xmlhttp=null;//为了下一次Avf录像判断用户标识是否含有中文符号并截取Blob
                    var reader = new FileReader();//这是核心,读取操作就是由它完成.
                    reader.readAsText(blob,"gb2312");//读取文件的内容,也可以读取文件的URL
                    reader.onabort = function () {
                        console.log("读取中断....");
                    }
                    reader.onerror = function () {
                        console.log("读取异常....");
                    }
                    reader.onload = function () {
                        player=this.result;
                        console.log('Player(GB2312): '+player);

                        video[0].size=size;
                        video[0].realtime=realtime;
                        video[0].player=player;
                        video[0].level=level;
                        video[0].board=board;
                        start_avf(video);
                        video_invalid=false;          
                    }
                    break;
                }else if(index==player.length-1){//全部不包含中文字符
                    video[0].size=size;
                    video[0].realtime=realtime;
                    video[0].player=player;
                    video[0].level=level;
                    video[0].board=board;
                    start_avf(video);
                    video_invalid=false;
                }
            }
        }
    }else{
        videoError("游戏级别读取出错");
    }
}

function playMvfVideo(result){
	reset();
    //当读取完成后回调这个函数,然后此时文件的内容存储到了result中,直接操作即可
    // console.log(this.result);
    number=0;//字符读取进度
    video=new Array();

    if(charCodeAt(result[0])==0x11&&charCodeAt(result[1])==0x4D){
    	// console.log(result[27]);
    	if(result[27]==5){//此处判断不能进行charCodeAt()操作
    		number=74;
    		console.log("软件版本: Clone 0.97");
    		read_097(result);//读取事件
    		container.set_viedo_mine(video[0].board);//按录像布雷
    		start_avf(video);//播放录像
    		video_invalid=false;
    	}else if(result[27]==6 || result[27]==7){
    		number=71;
    		console.log("软件版本: Clone 2007");
    		read_2007(result);//读取事件
    		container.set_viedo_mine(video[0].board);//按录像布雷
    		start_avf(video);//播放录像
    		video_invalid=false;
    	}else if(result[27]==8){
    		number=74;
    		console.log("软件版本: Clone 0.97 funny mode");
    		read_097(result);//读取事件
    		container.set_viedo_mine(video[0].board);//按录像布雷
    		start_avf(video);//播放录像
    		video_invalid=false;
    	}
    }else if(charCodeAt(result[0])==0x00&&charCodeAt(result[1])==0x00){
    	console.log("软件版本: 0.97 hacked(headless)");
    	number=7;//丢失部分信息的mvf文件
		read_097(result);//读取事件
		container.set_viedo_mine(video[0].board);//按录像布雷
		start_avf(video);//播放录像
		video_invalid=false;
    }else{
    	number=-1;
        if(read_pre(result)){//读取事件
    		container.set_viedo_mine(video[0].board);//按录像布雷
    		start_avf(video);//播放录像
    		video_invalid=false;
        }
    }
}

//选择本地文件进行录像播放
function fileImport() {
    //获取读取文件的File对象
    var selectedFile = document.getElementById('files').files[0];
    // console.log(selectedFile);
    if(selectedFile){//如果有选择文件，避免undefined报错
	    var name = selectedFile.name;//读取选中文件的文件名
	    var size = selectedFile.size;//读取选中文件的大小
	    console.log("文件名:"+name);
	    console.log("文件大小:"+(size/1024).toFixed(2)+"kb");
	    if((size/1024).toFixed(2)>5120){//限制文件大小5M
	    	console.log("录像文件过大，请重新选择");
	    	return false;
	    }
	    analyze_video(name,selectedFile);
	}else{
		console.log("请选择一个录像文件");
	}
}

function analyze_video(name,selectedFile){
    let type=name.substring(name.lastIndexOf('.'),name.length);//检验文件类型
    if('.avf'==type){
        var reader = new FileReader();//这是核心,读取操作就是由它完成.
        reader.readAsBinaryString(selectedFile);//读取文件的内容,也可以读取文件的URL
        reader.onabort = function () {  
            console.log("中断读取....");  
        }
        reader.onerror = function () {  
            console.log("读取异常....");  
        }
        reader.onload = function () {
            playAvfVideo(this.result);
        }
    }else if('.mvf'==type){
        xmlhttp=null;//为了下一次判断用户标识是否含有中文符号并截取Blob
        var reader = new FileReader();//这是核心,读取操作就是由它完成.
        reader.readAsBinaryString(selectedFile);//读取文件的内容,也可以读取文件的URL
        reader.onabort = function () {  
            console.log("读取中断....");  
        }  
        reader.onerror = function () {  
            console.log("读取异常....");  
        }  
        reader.onload = function () {
            playMvfVideo(this.result);
        }
    }else{
        console.log("录像格式错误，请重新选择");
        alert("录像格式错误！");
        closeVideo();
    }
}

function read_board(result,add){
	var w=0;//宽
	var h=0;//高
	var m=0;//雷数
	var pos=0;//雷的位置
	video[0].board=new Array();
	w=charCodeAt(result[++number]);
	h=charCodeAt(result[++number]);
	for(var i=0;i<w*h;i++){
		video[0].board[i]=0;
	}
	var m=(charCodeAt(result[++number]))*256+charCodeAt(result[++number]);
	// console.log('Width: '+w+'  Height: '+h+'  Mines: '+m);
	for(var i=0;i<m;i++){
		pos=charCodeAt(result[++number])+add+(charCodeAt(result[++number])+add)*w;
		if(pos>=w*h||pos<0){
			console.log("录像读取错误");
            videoError("录像读取错误");
			return false;
		}
		video[0].board[pos]=1;
	}
	// log(video[0].board);
}

// var direction = "onorientationchange" in window ? "orientationchange" : "resize";
// 代码中监测旋转是用了onorientationchange 函数
// 但是在一些APP或游戏内嵌页面会有该函数不会执行
// orientation获取不到的情况
// 所以如果是内嵌页建议使用resize事件
// 检查宽高变化来检测屏幕是否旋转
// 暂不使用resize,避免调整窗口大小时重复background_reload()
window.addEventListener("orientationchange",function() {
    console.log('屏幕：'+window.orientation+'度');
    // background_reload();
    if(window.orientation == 90 || window.orientation == -90){
    	document.getElementsByTagName("meta")[1]["content"]=('width=device-width, initial-scale=1, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0');
    }
    else if(container.level==3){
    	document.getElementsByTagName("meta")[1]["content"]=('width=device-width, initial-scale=1, user-scalable=no, minimum-scale='+window.screen.width/640+', maximum-scale='+window.screen.width/640+'');
    }
},false);

function read_pre(result){//0.97clone
	video[0]=new Array();

	var w=0;//宽
	var h=0;//高
	var m=0;//雷数
	var pos=0;//雷的位置
	var has_name=false;
	video[0].board=new Array();
	w=charCodeAt(result[++number]);
	h=charCodeAt(result[++number]);
	for(var i=0;i<w*h;i++){
		video[0].board[i]=0;
	}
	var m=(charCodeAt(result[++number]))*256+charCodeAt(result[++number]);
	// console.log('Width: '+w+'  Height: '+h+'  Mines: '+m);
	for(var i=0;i<m;i++){
		pos=charCodeAt(result[++number])+(charCodeAt(result[++number]))*w;
		if(pos>=w*h||pos<0){
			console.log("录像读取错误");
            videoError("录像读取错误");
            undefined.charCodeAt();//通过调用不可用函数进行函数中断，可能不太好？
			return false;
		}
		video[0].board[pos]=1;
	}
	// log(video[0].board);

	if(charCodeAt(result[++number])){//question marks
		console.log("问号模式: on");
		document.getElementById("question").innerHTML='取消问号';
		question=true;
	}else{
    	document.getElementById("question").innerHTML='标记问号';
		question=false;
    }
	var c=charCodeAt(result[++number]);
	var now=++number;
	var filesize=result.length;
	var after_events;
	var last=result[result.length-1];
	if(charCodeAt(last)){
		if(result[result.length-13==' ']&&result[result.length-12==' ']&&result[result.length-11==' ']){
			after_events=filesize-113;
			has_name=true;
			console.log("软件版本: Clone 0.76");
		}else{
			after_events=filesize-13;
			has_name=false;
			console.log("软件版本: Clone <=0.75");
		}
	}else{
		after_events=filesize-125;
		has_name=true;
		console.log("软件版本: Clone <=0.96");
	}
	if(w==8 && h==8) video[0].level=1;
	else if(w==16 && h==16) video[0].level=2;
	else if(w==30 && h==16) video[0].level=3;
	else {
		video=new Array();
        videoError("录像级别读取错误");
		return false;
	}
	container.init(video[0].level);

	// console.log('now:'+now);
	// console.log('filesize:'+filesize);
	// console.log('after_events:'+after_events);

	number=after_events-1;
	var score_sec=(charCodeAt(result[++number]))*256+charCodeAt(result[++number]);
	var score_ths=charCodeAt(result[++number])*10;
	console.log('Time: '+score_sec+'.'+score_ths);

	video[0].player=new Array();

	if(has_name)
	{
		number=after_events+2;
		for(var i=0;i<100;i++)
		{
			video[0].player+=result[++number];
		}
	}
	console.log('用户标识: '+video[0].player);
	number=now-1;
	var e=new Array();
	var size=0;
	while(now<after_events){
		if(size>0)video[size]=new Array();
		for(var k=0;k<8;k++){
			e[k]=charCodeAt(result[++number]);
		}
						
		video[size].sec=e[0];
		video[size].ths=e[1]*10;

		if(size>0 && 
		(video[size].sec<video[size-1].sec || 
		(video[size].sec==video[size-1].sec && video[size].ths<video[size-1].ths))) 
		{
			break;
		}
		if(video[size].sec>score_sec ||
		(video[size].sec==score_sec && video[size].ths>score_ths))
		{
			break;
		}
		
		video[size].lb=e[2]&0x01;
		video[size].mb=e[2]&0x02;
		video[size].rb=e[2]&0x04;
		video[size].x=parseInt(e[3]*256+e[4]);
		video[size].y=parseInt(e[5]*256+e[6]);
		video[size++].weirdness_bit=e[7];
		now+=8;
	}
	// console.log(now);
	video[size].lb=video[size].mb=video[size].rb=0;
	video[size].x=video[size-1].x;
	video[size].y=video[size-1].y;
	video[size].sec=video[size-1].sec;
	video[size].ths=video[size-1].ths;
	++size;
	video[0].size=size;
	// log(video);



	//第一事件
	if(video[0].lb)video[0].mouse=3;//lc
	else if(video[0].rb)video[0].mouse=9;//rc
	else if(video[0].mb)video[0].mouse=33;//mc
	else video[0].mouse=1;//mv
	video[0].rows=parseInt(video[0].x/16)+1;
	video[0].columns=parseInt(video[0].y/16)+1;

	var temp=video;
	size=0;
	video=new Array();
	video[0]=temp[0];
	video[0].hun=video[0].ths;
	video[0].path=0;
	video[0].realtime=score_sec+score_ths/1000;

	for(var i=1;i<temp[0].size;++i){
		if(temp[i].x!=temp[i-1].x||temp[i].y!=temp[i-1].y){
			video[++size]=new Array();
			video[size].mouse=1;
			video[size].sec=temp[i].sec;
			video[size].hun=temp[i].ths/10;//mvf精度为1ms，与avf播放兼容要/10,精准到1ms没啥意义。。
			video[size].x=temp[i].x;
			video[size].y=temp[i].y;
			video[size].rows=parseInt(temp[i].x/16)+1;
			video[size].columns=parseInt(temp[i].y/16)+1;
			video[size].path=video[size-1].path+Math.pow((Math.pow(video[size].x-video[size-1].x,2)+Math.pow(video[size].y-video[size-1].y,2)),0.5);
		}
		if(!temp[i].lb&&temp[i-1].lb){
			video[++size]=new Array();
			video[size].mouse=5;
			video[size].sec=temp[i].sec;
			video[size].hun=temp[i].ths/10;
			video[size].x=temp[i].x;
			video[size].y=temp[i].y;
			video[size].rows=parseInt(temp[i].x/16)+1;
			video[size].columns=parseInt(temp[i].y/16)+1;
			video[size].path=video[size-1].path+Math.pow((Math.pow(video[size].x-video[size-1].x,2)+Math.pow(video[size].y-video[size-1].y,2)),0.5);
		}
		if(!temp[i].rb&&temp[i-1].rb){
			video[++size]=new Array();
			video[size].mouse=17;
			video[size].sec=temp[i].sec;
			video[size].hun=temp[i].ths/10;
			video[size].x=temp[i].x;
			video[size].y=temp[i].y;
			video[size].rows=parseInt(temp[i].x/16)+1;
			video[size].columns=parseInt(temp[i].y/16)+1;
			video[size].path=video[size-1].path+Math.pow((Math.pow(video[size].x-video[size-1].x,2)+Math.pow(video[size].y-video[size-1].y,2)),0.5);
		}
		if(!temp[i].mb&&temp[i-1].mb){
			video[++size]=new Array();
			video[size].mouse=65;
			video[size].sec=temp[i].sec;
			video[size].hun=temp[i].ths/10;
			video[size].x=temp[i].x;
			video[size].y=temp[i].y;
			video[size].rows=parseInt(temp[i].x/16)+1;
			video[size].columns=parseInt(temp[i].y/16)+1;
			video[size].path=video[size-1].path+Math.pow((Math.pow(video[size].x-video[size-1].x,2)+Math.pow(video[size].y-video[size-1].y,2)),0.5);
		}
		if(temp[i].lb&&!temp[i-1].lb){
			video[++size]=new Array();
			video[size].mouse=3;
			video[size].sec=temp[i].sec;
			video[size].hun=temp[i].ths/10;
			video[size].x=temp[i].x;
			video[size].y=temp[i].y;
			video[size].rows=parseInt(temp[i].x/16)+1;
			video[size].columns=parseInt(temp[i].y/16)+1;
			video[size].path=video[size-1].path+Math.pow((Math.pow(video[size].x-video[size-1].x,2)+Math.pow(video[size].y-video[size-1].y,2)),0.5);
		}
		if(temp[i].rb&&!temp[i-1].rb){
			video[++size]=new Array();
			video[size].mouse=9;
			video[size].sec=temp[i].sec;
			video[size].hun=temp[i].ths/10;
			video[size].x=temp[i].x;
			video[size].y=temp[i].y;
			video[size].rows=parseInt(temp[i].x/16)+1;
			video[size].columns=parseInt(temp[i].y/16)+1;
			video[size].path=video[size-1].path+Math.pow((Math.pow(video[size].x-video[size-1].x,2)+Math.pow(video[size].y-video[size-1].y,2)),0.5);
		}
		if(temp[i].mb&&!temp[i-1].mb){
			video[++size]=new Array();
			video[size].mouse=33;
			video[size].sec=temp[i].sec;
			video[size].hun=temp[i].ths/10;
			video[size].x=temp[i].x;
			video[size].y=temp[i].y;
			video[size].rows=parseInt(temp[i].x/16)+1;
			video[size].columns=parseInt(temp[i].y/16)+1;
			video[size].path=video[size-1].path+Math.pow((Math.pow(video[size].x-video[size-1].x,2)+Math.pow(video[size].y-video[size-1].y,2)),0.5);
		}
	}
	video[0].size=size+1;//mvf没有sec=-1的结束标志，与avf播放兼容要size+1
	// console.log(video);
}

function read_2007(result){//0.97clone
	video[0]=new Array();

	var mouth=charCodeAt(result[number]);
	var day=charCodeAt(result[++number]);
	var year=(charCodeAt(result[++number]))*256+charCodeAt(result[++number]);
	var hour=charCodeAt(result[++number]);
	var min=charCodeAt(result[++number]);
	var sec=charCodeAt(result[++number]);
	var level=charCodeAt(result[++number]);

	container.init(level);

	var mode=charCodeAt(result[++number]);
	var score_ths=(charCodeAt(result[++number]))*65536+(charCodeAt(result[++number]))*256+charCodeAt(result[++number]);
	var score_sec=parseInt(score_ths/1000);
	score_ths%=1000;
	if(charCodeAt(result[++number])){//question marks
		console.log("问号模式: on");
		document.getElementById("question").innerHTML='取消问号';
		question=true;
	}else{
    	document.getElementById("question").innerHTML='标记问号';
		question=false;
    }
	// console.log('Timestamp: '+year+'-'+mouth+'-'+day+' '+hour+':'+min+':'+sec);
	// console.log('Level: '+level+'  Score:'+score_sec+'.'+three_char(score_ths));
	var mode_names=new Array("","classic","density","UPK","cheat");
	console.log("Mode: "+mode_names[mode]);
	read_board(result,-1);

	var len=charCodeAt(result[++number]);//标识长度
	video[0].player=new Array();
	for(var i=0;i<len;i++){
		video[0].player+=result[++number];//此处不能进行charCodeAt()操作
	}
	console.log('用户标识: '+video[0].player);

	var leading=(charCodeAt(result[++number]))*256+charCodeAt(result[++number]);
	var num1=Math.sqrt(leading);
	var num2=Math.sqrt(leading+1000.0);
	var num3=Math.sqrt(num1+1000.0);
	var num4=Math.sqrt(num2+1000.0);
	var mult=100000000;
	var s=new Array();
	var byte=new Array();
	var bit=new Array();
	var cur=0;
	var e=new Array();
	s+=sprintf(parseInt(Math.round(Math.abs(Math.cos(num3+1000.0)*mult))));//格式化数字为%8d
	s+=sprintf(parseInt(Math.round(Math.abs(Math.sin(Math.sqrt(num2))*mult))));
	s+=sprintf(parseInt(Math.round(Math.abs(Math.cos(num3)*mult))));
	s+=sprintf(parseInt(Math.round(Math.abs(Math.sin(Math.sqrt(num1)+1000.0)*mult))));
	s+=sprintf(parseInt(Math.round(Math.abs(Math.cos(num4)*mult))));
	s+=sprintf(parseInt(Math.round(Math.abs(Math.sin(num4)*mult))));
	// log(s);
	if(s[48])s[48]=0;//这句好像有点多余？？还是另有用处
	cur=0;
	for(var i=0;i<=9;++i){
		for(var j=0;j<48;++j){
			if(s[j]==i)
			{
				byte[cur]=parseInt(j/8);//此处剧毒，原c文件中byte[]为int型，js需增加parseInt操作
				bit[cur++]=1<<(j%8);
			}
		}
	}

	video[0].size=(charCodeAt(result[++number]))*65536+(charCodeAt(result[++number]))*256+charCodeAt(result[++number]);
	// console.log('size'+video[0].size);
	for(var i=0;i<video[0].size;i++){
		for(var k=0;k<6;k++){
			e[k]=charCodeAt(result[++number]);
		}
		if(i>0)video[i]=new Array();
		video[i].rb=apply_perm(0,byte,bit,e);
		video[i].mb=apply_perm(1,byte,bit,e);
		video[i].lb=apply_perm(2,byte,bit,e);
		video[i].x=video[i].y=video[i].ths=video[i].sec=0;
		for(j=0;j<11;++j)
		{
			video[i].x|=(apply_perm(14+j,byte,bit,e)<<j);
			video[i].y|=(apply_perm(3+j,byte,bit,e)<<j);
		}
		for(j=0;j<22;++j) video[i].ths|=(apply_perm(25+j,byte,bit,e)<<j);
		video[i].sec=parseInt(video[i].ths/1000);
		video[i].ths%=1000;
		video[i].x-=32;
		video[i].y-=32;
	}
	// for(var i=0;i<video[0].size;i++){
		// log(video);
	// }
	
	//第一事件
	if(video[0].lb)video[0].mouse=3;//lc
	else if(video[0].rb)video[0].mouse=9;//rc
	else if(video[0].mb)video[0].mouse=33;//mc
	else video[0].mouse=1;//mv
	video[0].rows=parseInt(video[0].x/16)+1;
	video[0].columns=parseInt(video[0].y/16)+1;

	var temp=video;
	var size=0;
	video=new Array();
	video[0]=temp[0];
	video[0].hun=video[0].ths;
	video[0].path=0;
	video[0].realtime=score_sec+score_ths/1000;
	video[0].level=level;

	for(var i=1;i<temp[0].size;++i){
		if(temp[i].x!=temp[i-1].x||temp[i].y!=temp[i-1].y){
			video[++size]=new Array();
			video[size].mouse=1;
			video[size].sec=temp[i].sec;
			video[size].hun=temp[i].ths/10;//mvf精度为1ms，与avf播放兼容要/10,精准到1ms没啥意义。。
			video[size].x=temp[i].x;
			video[size].y=temp[i].y;
			video[size].rows=parseInt(temp[i].x/16)+1;
			video[size].columns=parseInt(temp[i].y/16)+1;
			video[size].path=video[size-1].path+Math.pow((Math.pow(video[size].x-video[size-1].x,2)+Math.pow(video[size].y-video[size-1].y,2)),0.5);
		}
		if(!temp[i].lb&&temp[i-1].lb){
			video[++size]=new Array();
			video[size].mouse=5;
			video[size].sec=temp[i].sec;
			video[size].hun=temp[i].ths/10;
			video[size].x=temp[i].x;
			video[size].y=temp[i].y;
			video[size].rows=parseInt(temp[i].x/16)+1;
			video[size].columns=parseInt(temp[i].y/16)+1;
			video[size].path=video[size-1].path+Math.pow((Math.pow(video[size].x-video[size-1].x,2)+Math.pow(video[size].y-video[size-1].y,2)),0.5);
		}
		if(!temp[i].rb&&temp[i-1].rb){
			video[++size]=new Array();
			video[size].mouse=17;
			video[size].sec=temp[i].sec;
			video[size].hun=temp[i].ths/10;
			video[size].x=temp[i].x;
			video[size].y=temp[i].y;
			video[size].rows=parseInt(temp[i].x/16)+1;
			video[size].columns=parseInt(temp[i].y/16)+1;
			video[size].path=video[size-1].path+Math.pow((Math.pow(video[size].x-video[size-1].x,2)+Math.pow(video[size].y-video[size-1].y,2)),0.5);
		}
		if(!temp[i].mb&&temp[i-1].mb){
			video[++size]=new Array();
			video[size].mouse=65;
			video[size].sec=temp[i].sec;
			video[size].hun=temp[i].ths/10;
			video[size].x=temp[i].x;
			video[size].y=temp[i].y;
			video[size].rows=parseInt(temp[i].x/16)+1;
			video[size].columns=parseInt(temp[i].y/16)+1;
			video[size].path=video[size-1].path+Math.pow((Math.pow(video[size].x-video[size-1].x,2)+Math.pow(video[size].y-video[size-1].y,2)),0.5);
		}
		if(temp[i].lb&&!temp[i-1].lb){
			video[++size]=new Array();
			video[size].mouse=3;
			video[size].sec=temp[i].sec;
			video[size].hun=temp[i].ths/10;
			video[size].x=temp[i].x;
			video[size].y=temp[i].y;
			video[size].rows=parseInt(temp[i].x/16)+1;
			video[size].columns=parseInt(temp[i].y/16)+1;
			video[size].path=video[size-1].path+Math.pow((Math.pow(video[size].x-video[size-1].x,2)+Math.pow(video[size].y-video[size-1].y,2)),0.5);
		}
		if(temp[i].rb&&!temp[i-1].rb){
			video[++size]=new Array();
			video[size].mouse=9;
			video[size].sec=temp[i].sec;
			video[size].hun=temp[i].ths/10;
			video[size].x=temp[i].x;
			video[size].y=temp[i].y;
			video[size].rows=parseInt(temp[i].x/16)+1;
			video[size].columns=parseInt(temp[i].y/16)+1;
			video[size].path=video[size-1].path+Math.pow((Math.pow(video[size].x-video[size-1].x,2)+Math.pow(video[size].y-video[size-1].y,2)),0.5);
		}
		if(temp[i].mb&&!temp[i-1].mb){
			video[++size]=new Array();
			video[size].mouse=33;
			video[size].sec=temp[i].sec;
			video[size].hun=temp[i].ths/10;
			video[size].x=temp[i].x;
			video[size].y=temp[i].y;
			video[size].rows=parseInt(temp[i].x/16)+1;
			video[size].columns=parseInt(temp[i].y/16)+1;
			video[size].path=video[size-1].path+Math.pow((Math.pow(video[size].x-video[size-1].x,2)+Math.pow(video[size].y-video[size-1].y,2)),0.5);
		}
	}
	video[0].size=size+1;//mvf没有sec=-1的结束标志，与avf播放兼容要size+1
	// console.log(video);
}

function read_097(result){//0.97clone
	video[0]=new Array();

	var mouth=charCodeAt(result[number]);
	var day=charCodeAt(result[++number]);
	var year=(charCodeAt(result[++number]))*256+charCodeAt(result[++number]);
	var hour=charCodeAt(result[++number]);
	var min=charCodeAt(result[++number]);
	var sec=charCodeAt(result[++number]);
	var level=charCodeAt(result[++number]);

	container.init(level);

	var mode=charCodeAt(result[++number]);
	var score_sec=(charCodeAt(result[++number]))*256+charCodeAt(result[++number]);
	var score_ths=charCodeAt(result[++number])*10;
	var bbbv=(charCodeAt(result[++number]))*256+charCodeAt(result[++number]);
	var solved_bbbv=(charCodeAt(result[++number]))*256+charCodeAt(result[++number]);
	var lcl=(charCodeAt(result[++number]))*256+charCodeAt(result[++number]);
	var dcl=(charCodeAt(result[++number]))*256+charCodeAt(result[++number]);
	var rcl=(charCodeAt(result[++number]))*256+charCodeAt(result[++number]);
	if(charCodeAt(result[++number])){//question marks
		console.log("问号模式: on");
		document.getElementById("question").innerHTML='取消问号';
		question=true;
	}else{
    	document.getElementById("question").innerHTML='标记问号';
		question=false;
    }
	// console.log('Timestamp: '+year+'-'+mouth+'-'+day+' '+hour+':'+min+':'+sec);
	// console.log('Level: '+level+'  Score:'+score_sec+'.'+three_char(score_ths));
	var mode_names=new Array("","classic","density","UPK","cheat");
	console.log("Mode: "+mode_names[mode]);
	// console.log('3BV:'+bbbv+'  Solved3BV:'+solved_bbbv);
	// console.log('LeftClicks:'+lcl+'  RightClicks:'+rcl+'  DoubleClicks:'+dcl);
	read_board(result,-1);

	var len=charCodeAt(result[++number]);//标识长度
	video[0].player=new Array();
	for(var i=0;i<len;i++){
		video[0].player+=result[++number];//此处不能进行charCodeAt()操作
	}
	console.log('用户标识: '+video[0].player);

	var leading=(charCodeAt(result[++number]))*256+charCodeAt(result[++number]);
	var num1=Math.sqrt(leading);
	var num2=Math.sqrt(leading+1000.0);
	var num3=Math.sqrt(num1+1000.0);
	var mult=100000000;
	var s=new Array();
	var byte=new Array();
	var bit=new Array();
	var cur=0;
	var e=new Array();
	s+=sprintf(parseInt(Math.round(Math.abs(Math.cos(num3+1000.0)*mult))));//格式化数字为%8d
	s+=sprintf(parseInt(Math.round(Math.abs(Math.sin(Math.sqrt(num2))*mult))));
	s+=sprintf(parseInt(Math.round(Math.abs(Math.cos(num3)*mult))));
	s+=sprintf(parseInt(Math.round(Math.abs(Math.sin(Math.sqrt(num1)+1000.0)*mult))));
	s+=sprintf(parseInt(Math.round(Math.abs(Math.cos(Math.sqrt(num2+1000.0))*mult))));
	if(s[40])s[40]=0;
	cur=0;
	// console.log(s);
	for(var i=0;i<=9;++i){
		for(var j=0;j<40;++j){
			if(s[j]==i)
			{
				byte[cur]=parseInt(j/8);//此处剧毒，原c文件中byte[]为int型，js需增加parseInt操作
				bit[cur++]=1<<(j%8);
			}
		}
	}

	video[0].size=(charCodeAt(result[++number]))*65536+(charCodeAt(result[++number]))*256+charCodeAt(result[++number]);
	// console.log('size:'+video[0].size);
	for(var i=0;i<video[0].size;i++){
		for(var k=0;k<5;k++){
			e[k]=charCodeAt(result[++number]);
		}
		if(i>0)video[i]=new Array();
		video[i].rb=apply_perm(0,byte,bit,e);
		video[i].mb=apply_perm(1,byte,bit,e);
		video[i].lb=apply_perm(2,byte,bit,e);
		video[i].x=video[i].y=video[i].ths=video[i].sec=0;
		for(j=0;j<9;++j)
		{
			video[i].x|=(apply_perm(12+j,byte,bit,e)<<j);
			video[i].y|=(apply_perm(3+j,byte,bit,e)<<j);
		}
		for(j=0;j<7;++j) video[i].ths|=(apply_perm(21+j,byte,bit,e)<<j);
		video[i].ths*=10;
		for(j=0;j<10;++j) video[i].sec|=(apply_perm(28+j,byte,bit,e)<<j);
	}
	// for(var i=0;i<video[0].size;i++){
		// log(video);
	// }
	
	//第一事件
	if(video[0].lb)video[0].mouse=3;//lc
	else if(video[0].rb)video[0].mouse=9;//rc
	else if(video[0].mb)video[0].mouse=33;//mc
	else video[0].mouse=1;//mv
	video[0].rows=parseInt(video[0].x/16)+1;
	video[0].columns=parseInt(video[0].y/16)+1;

	var temp=video;
	var size=0;
	video=new Array();
	video[0]=temp[0];
	video[0].hun=video[0].ths;
	video[0].path=0;
	video[0].realtime=score_sec+score_ths/1000;
	video[0].level=level;

	for(var i=1;i<temp[0].size;++i){
		if(temp[i].x!=temp[i-1].x||temp[i].y!=temp[i-1].y){
			video[++size]=new Array();
			video[size].mouse=1;
			video[size].sec=temp[i].sec;
			video[size].hun=temp[i].ths/10;//mvf精度为1ms，与avf播放兼容要/10,精准到1ms没啥意义。。
			video[size].x=temp[i].x;
			video[size].y=temp[i].y;
			video[size].rows=parseInt(temp[i].x/16)+1;
			video[size].columns=parseInt(temp[i].y/16)+1;
			video[size].path=video[size-1].path+Math.pow((Math.pow(video[size].x-video[size-1].x,2)+Math.pow(video[size].y-video[size-1].y,2)),0.5);
		}
		if(!temp[i].lb&&temp[i-1].lb){
			video[++size]=new Array();
			video[size].mouse=5;
			video[size].sec=temp[i].sec;
			video[size].hun=temp[i].ths/10;
			video[size].x=temp[i].x;
			video[size].y=temp[i].y;
			video[size].rows=parseInt(temp[i].x/16)+1;
			video[size].columns=parseInt(temp[i].y/16)+1;
			video[size].path=video[size-1].path+Math.pow((Math.pow(video[size].x-video[size-1].x,2)+Math.pow(video[size].y-video[size-1].y,2)),0.5);
		}
		if(!temp[i].rb&&temp[i-1].rb){
			video[++size]=new Array();
			video[size].mouse=17;
			video[size].sec=temp[i].sec;
			video[size].hun=temp[i].ths/10;
			video[size].x=temp[i].x;
			video[size].y=temp[i].y;
			video[size].rows=parseInt(temp[i].x/16)+1;
			video[size].columns=parseInt(temp[i].y/16)+1;
			video[size].path=video[size-1].path+Math.pow((Math.pow(video[size].x-video[size-1].x,2)+Math.pow(video[size].y-video[size-1].y,2)),0.5);
		}
		if(!temp[i].mb&&temp[i-1].mb){
			video[++size]=new Array();
			video[size].mouse=65;
			video[size].sec=temp[i].sec;
			video[size].hun=temp[i].ths/10;
			video[size].x=temp[i].x;
			video[size].y=temp[i].y;
			video[size].rows=parseInt(temp[i].x/16)+1;
			video[size].columns=parseInt(temp[i].y/16)+1;
			video[size].path=video[size-1].path+Math.pow((Math.pow(video[size].x-video[size-1].x,2)+Math.pow(video[size].y-video[size-1].y,2)),0.5);
		}
		if(temp[i].lb&&!temp[i-1].lb){
			video[++size]=new Array();
			video[size].mouse=3;
			video[size].sec=temp[i].sec;
			video[size].hun=temp[i].ths/10;
			video[size].x=temp[i].x;
			video[size].y=temp[i].y;
			video[size].rows=parseInt(temp[i].x/16)+1;
			video[size].columns=parseInt(temp[i].y/16)+1;
			video[size].path=video[size-1].path+Math.pow((Math.pow(video[size].x-video[size-1].x,2)+Math.pow(video[size].y-video[size-1].y,2)),0.5);
		}
		if(temp[i].rb&&!temp[i-1].rb){
			video[++size]=new Array();
			video[size].mouse=9;
			video[size].sec=temp[i].sec;
			video[size].hun=temp[i].ths/10;
			video[size].x=temp[i].x;
			video[size].y=temp[i].y;
			video[size].rows=parseInt(temp[i].x/16)+1;
			video[size].columns=parseInt(temp[i].y/16)+1;
			video[size].path=video[size-1].path+Math.pow((Math.pow(video[size].x-video[size-1].x,2)+Math.pow(video[size].y-video[size-1].y,2)),0.5);
		}
		if(temp[i].mb&&!temp[i-1].mb){
			video[++size]=new Array();
			video[size].mouse=33;
			video[size].sec=temp[i].sec;
			video[size].hun=temp[i].ths/10;
			video[size].x=temp[i].x;
			video[size].y=temp[i].y;
			video[size].rows=parseInt(temp[i].x/16)+1;
			video[size].columns=parseInt(temp[i].y/16)+1;
			video[size].path=video[size-1].path+Math.pow((Math.pow(video[size].x-video[size-1].x,2)+Math.pow(video[size].y-video[size-1].y,2)),0.5);
		}
	}
	video[0].size=size+1;//mvf没有sec=-1的结束标志，与avf播放兼容要size+1
	// console.log(video);
}

function apply_perm(num,byte,bit,event){
	return (event[byte[num]]&bit[num])?1:0;
}

function sprintf(num) {//格式化数字为%8d,返回值为字符串型（影响不大？）
	var add=8-num.toString().length;//直接放for循环会出错
	for(var i=0;i<add;i++){
		num='0'+num;
	}
	return num;
}