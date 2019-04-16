<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-11
'------------------------
%>
<!--#include virtual="/Models/Include/Window.asp"-->
<!--#include virtual="/Models/Include/Mask.asp"-->
<%
If Session("Player_Id")<>"" Then
  %><!--#include virtual="/Models/Include/Message.asp"-->
  <%End If%>
<table width="910" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="215" height="60" align="center"><img src="/Models/Images/Common/Logo.gif" width="185" height="55"></td>
    <td width="695" align="right" class="High">
      <%If Session("Player_Id")="" Then
      If Request.Cookies("Saolei.net")("Player_Name_Chinese") <> "" Then%>»¶Ó­Äú, <%=Request.Cookies("Saolei.net")("Player_Name_Chinese")%> !¡¡ <%End If%><a href="javascript:;" onClick="Window('/Player/Login.asp');" class="Sign">µÇÂ¼</a> <span class="Signest">[F2]</span>¡¡|¡¡<a href="javascript:;" onClick="Window('/Player/Register.asp');" class="High">×¢²á</a>¡¡|¡¡<a href="javascript:;" onClick="Window('/Player/Password.asp');" class="High">ÕÒ»ØÃÜÂë</a>¡¡|¡¡<a href="javascript:;" onClick="Window('/Download/Index.asp');" class="High">Èí¼þÏÂÔØ</a>¡¡|¡¡<a href="javascript:;" onClick="Window('/History/2008.asp');" class="High">¸üÐÂÀúÊ·</a>¡¡|¡¡<a href="javascript:;" onClick="Window('/About/Index.asp');" class="High">¹ØÓÚ±¾Õ¾</a>¡¡|¡¡<a href="javascript:;" onClick="Window('/Team/Index.asp');" class="Sign">¹ÜÀíÍÅ¶Ó</a>
      <script language="javascript">
        function KeyDown(e){     
          var keyCode;
          try{ 
            keyCode=event.keyCode;
          } 
          catch(a){
            keyCode=KeyDown.arguments[0].keyCode; 
          } 
          switch(keyCode)
          {
            case 113:
            Window('/Player/Login.asp');         
            break;
            case 27:
            try{document.frames("Window_Frame").Cancel();}catch(e){}
            break;
          }
        }		
        document.onkeydown=KeyDown; 
        document.onkeypress=KeyDown;
      </script>
      <%Else%>
      »¶Ó­Äú, <span class="Sign"><%=Session("Player_Name_Chinese")%></span> !¡¡ <a href="/Player/Action/Quit_Action.asp" target="Action" class="High">ÍË³öµÇÂ¼</a>¡¡|¡¡<a href="javascript:;" onClick="Window('/Message/Box.asp');" class="High">¶ÌÏûÏ¢</a>¡¡|¡¡<a href="/Player/Index.asp?Id=<%=Session("Player_Id")%>" class="High">ÎÒµÄµØÅÌ</a>¡¡|¡¡<a href="javascript:;" onClick="Window('/Download/Index.asp');" class="High">Èí¼þÏÂÔØ</a>¡¡|¡¡<a href="javascript:;" onClick="Window('/History/2008.asp');" class="High">¸üÐÂÀúÊ·</a>¡¡|¡¡<a href="javascript:;" onClick="Window('/About/Index.asp');" class="High">¹ØÓÚ±¾Õ¾</a>¡¡|¡¡<a href="javascript:;" onClick="Window('/Team/Index.asp');" class="Sign">¹ÜÀíÍÅ¶Ó</a>¡¡
      <script language="javascript">
        function KeyDown(e){     
          var keyCode;
          try{ 
            keyCode=event.keyCode;
          } 
          catch(a){
            keyCode=KeyDown.arguments[0].keyCode; 
          } 
          switch(keyCode)
          {
            case 27:
            try{document.frames("Window_Frame").Cancel();}catch(e){}
            break;
          }
        }		
        document.onkeydown=KeyDown; 
        document.onkeypress=KeyDown;
      </script>
      <%End If%>
    </td>
  </tr>
</table>
<table width="910" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr align="center" bgcolor="#555555" height="25">
    <!-- <td width="100" id="Top_1" style="cursor:pointer " class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" onClick="loadVideo('../play/rawvf/4.avf');" >Ê×Ò³</td> -->
     <td width="100" id="Top_1" style="cursor:pointer " class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" onClick="location='/Main/Index.asp';">Ê×Ò³</td>
    <td width="100" id="Top_2" style="cursor:pointer " class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" onClick="location='/Ranking/Index.asp';">ÅÅÐÐ°ñ</td>
    <td width="100" id="Top_3" style="cursor:pointer " class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" onClick="location='/Video/Index.asp';">Â¼Ïñ</td>
    <td width="100" id="Top_4" style="cursor:pointer " class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" onClick="location='/World/Index.asp';">À×½ç</td>
    <td width="100" id="Top_5" style="cursor:pointer " class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" onClick="location='/BBS/Index.asp';">ÂÛÌ³</td>
    <td width="100" id="Top_6" style="cursor:pointer " class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" onClick="location='/Guide/Index.asp';">½Ì³Ì</td>
    <td width="100" id="Top_7" style="cursor:pointer " class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" onClick="location='/Hero/Index.asp';">À×Éñµî</td>
    <%If Session("Player_Id") = "" Then%>
    <td width="100" id="Top_8" style="cursor:pointer " class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" onClick="Window('/Player/Random.asp');">ÎÒµÄµØÅÌ</td>
    <td width="100" id="Top_9" style="cursor:pointer " class="Sign" onClick="Window('/Help/Ranking.asp');">ÐÂÊÖÉÏÂ·</td>
    <%Else%>
    <td width="100" id="Top_8" style="cursor:pointer " class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" onClick="location='/Player/Index.asp?Id=<%=Session("Player_Id")%>';">ÎÒµÄµØÅÌ</td>
    <td width="100" id="Top_10" style="cursor:pointer " class="Sign" onClick="Window('/Video/Upload.asp');">ÉÏ´«Â¼Ïñ</td>
    <%End If%>
  </tr>
</table>
<table width="910" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr height="15">
    <td></td>
  </tr>
</table>
<script language="javascript">
  function Top(Id)
  {
    try{document.getElementById("Top_"+Id).style.backgroundColor = "#666666";}catch(e){}
  }
  function High(Id)
  {
    try{document.getElementById(Id).style.backgroundColor = "#444444";}catch(e){}
  }
  function Low(Id)
  {
    try{document.getElementById(Id).style.backgroundColor = "#333333";}catch(e){}
  }

  function loadVideo(path){//µ÷ÓÃ×ÓÒ³Ãæ·½·¨
    parent.document.getElementById('Window_Frame').src="../play/video.html";
    parent.document.getElementById('Window_Frame').name=path;
    parent.document.getElementById('Window_Box').style.display='block';
    parent.document.getElementById('Window_Frame').style.display='block';
    parent.Start_Mask();
    changeVideoPosision()
    
  }
  function changeVideoPosision(){
    var height=document.body.scrollHeight;
    var width=document.body.clientWidth;
    parent.document.getElementById('Window_Box').style.left=width/2;
  }
</script>