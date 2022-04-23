<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-11
'------------------------
%>
<!--#include virtual="/Models/Include/Window.asp"-->
<!--#include virtual="/Models/Include/Mask.asp"-->
<!--#include virtual="/Models/Include/FlopPlayer.asp"-->
<%
If Session("Player_Id")<>"" Then
%><!--#include virtual="/Models/Include/Message.asp"-->
<%End If%>
<table width="910" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="215" height="60" align="center"><a href="/Main/Index.asp"><img src="/Models/Images/Common/Logo.gif" width="185" height="55"></a></td>
    <td width="695" align="right" class="High">
	<%If Session("Player_Id")="" Then
		If Request.Cookies("Saolei.net")("Player_Name_Chinese") <> "" Then%>欢迎您, <%=Request.Cookies("Saolei.net")("Player_Name_Chinese")%> !　 <%End If%><a href="javascript:;" onClick="Window('/Player/Login.asp');" class="Sign">登录</a> <span class="Signest">[F2]</span>　|　<a href="javascript:;" onClick="Window('/Player/Register.asp');" class="High">注册</a>　|　<a href="javascript:;" onClick="Window('/Player/Password.asp');" class="High">找回密码</a>　|　<a href="javascript:;" onClick="Window('/Download/Index.asp');" class="High">软件下载</a>　|　<a href="javascript:;" onClick="Window('/History/2008.asp');" class="High">更新历史</a>　|　<a href="javascript:;" onClick="Window('/About/Index.asp');" class="High">关于本站</a>　|　<a href="javascript:;" onClick="Window('/Team/Index.asp');" class="Sign">管理团队</a>
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
		欢迎您, <span class="Sign"><%=Session("Player_Name_Chinese")%></span> !　 <a href="/Player/Action/Quit_Action.asp" target="Action" class="High">退出登录</a>　|　<a href="javascript:;" onClick="Window('/Message/Box.asp');" class="High">短消息</a>　|　<a href="/Player/Index.asp?Id=<%=Session("Player_Id")%>" class="High">我的地盘</a>　|　<a href="javascript:;" onClick="Window('/Download/Index.asp');" class="High">软件下载</a>　|　<a href="javascript:;" onClick="Window('/History/2008.asp');" class="High">更新历史</a>　|　<a href="javascript:;" onClick="Window('/About/Index.asp');" class="High">关于本站</a>　|　<a href="javascript:;" onClick="Window('/Team/Index.asp');" class="Sign">管理团队</a>　
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
    <td width="100" id="Top_1" style="cursor:pointer " class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" onClick="location='/Main/Index.asp';" >首页</td>
    <td width="100" id="Top_2" style="cursor:pointer " class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" onClick="location='/Ranking/Index.asp';">排行榜</td>
    <td width="100" id="Top_3" style="cursor:pointer " class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" onClick="location='/Video/Index.asp';">录像</td>
    <td width="100" id="Top_4" style="cursor:pointer " class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" onClick="location='/World/Index.asp';">雷界</td>
    <td width="100" id="Top_5" style="cursor:pointer " class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" onClick="location='/BBS/Index.asp';">论坛</td>
    <td width="100" id="Top_6" style="cursor:pointer " class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" onClick="location='/Guide/Index.asp';">教程</td>
    <td width="100" id="Top_7" style="cursor:pointer " class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" onClick="location='/Hero/Index.asp';">雷神殿</td>
	<%If Session("Player_Id") = "" Then%>
    <td width="100" id="Top_8" style="cursor:pointer " class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" onClick="Window('/Player/Random.asp');">我的地盘</td>
    <td width="100" id="Top_9" style="cursor:pointer " class="Sign" onClick="Window('/Help/Ranking.asp');">新手上路</td>
	<%Else%>
    <td width="100" id="Top_8" style="cursor:pointer " class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" onClick="location='/Player/Index.asp?Id=<%=Session("Player_Id")%>';">我的地盘</td>
    <td width="100" id="Top_10" style="cursor:pointer " class="Sign" onClick="Window('/Video/Upload.asp');">上传录像</td>
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
</script>