<!--#include virtual="/Models/Common/Const.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<META name="description" content="【中国扫雷网】国内最权威的扫雷网站，由国内第一人张砷镓创办，开设栏目：排行榜、录像、雷界、论坛、教程、雷神殿、……">
<META name="keywords" content="张砷镓,扫雷,挖金子,扫雷排行,扫雷录象,雷神,雷界,扫雷游戏,扫雷下载,扫雷玩家,扫雷心得,扫雷技巧,扫雷记录,扫雷教程,扫雷论坛,扫雷网,中国扫雷">
<title>【中国扫雷网】——国内最权威的扫雷网站</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #333333;
}
-->
</style>
<link href="/Models/Css/2008.css?v=20220104" rel="stylesheet" type="text/css">
</head>
<body>

<div id="Window_Box" style="position:absolute; width:1px; height:1px; z-index:1; display: none;">
	<iframe id="Window_Frame" width="1" height="1" frameborder="0" src="" scrolling="no"></iframe>
</div>
<script language="javascript">
function Window(Url)
{
	parent.document.getElementById('Window_Frame').src=Url;
}
</script>
<div id="divPageMask" style="background-color:black;opacity:0.33; left:0px;position:absolute;top:0px;"></div>
<script language="javascript">
var isIE=document.all? true:false;
if(isIE)
{
	document.getElementById("divPageMask").style.filter="alpha(opacity=33)";   
}
else
{
	document.getElementById("divPageMask").style.MozOpacity=0.33; 
}

function Start_Mask()
{
	document.getElementById("divPageMask").style.display="block";
	resizeMask();
	window.onResize = resizeMask;
}
function End_Mask()
{
	document.getElementById("divPageMask").style.width = "0px";
	document.getElementById("divPageMask").style.height = "0px";
	window.onResize = null;
}
function resizeMask()
{
	if(screen.height<=document.body.scrollHeight)
	{
	document.getElementById("divPageMask").style.width = document.body.scrollWidth;
	document.getElementById("divPageMask").style.height = document.body.scrollHeight;
	}
	else
	{
	document.getElementById("divPageMask").style.width = document.body.scrollWidth;
	document.getElementById("divPageMask").style.height = screen.height-168;
	}
	
}
</script>

<div id="Message_Box" style="position:absolute; width:1px; height:1px; z-index:1; display: none;">
	<iframe id="Message_Frame" width="1" height="1" frameborder="0" src="/Message/Check.asp" scrolling="no"></iframe>
</div>
<script language="javascript">
function Message_Check()
{
	if (!((parent.document.getElementById('Window_Box').style.display=='')&&(parent.document.getElementById('Window_Frame').src='/Message/Box.asp')))
		{
			document.getElementById('Message_Frame').location='/Message/Check.asp?tmp='+Math.random();
		}
}
Message_Checking=setInterval('Message_Check()',30000);
</script>
<table width="910" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="215" height="60" align="center"><img src="/Models/Images/Common/Logo.gif" width="185" height="55"></td>
    <td width="695" align="right" class="High">
	
		欢迎您, <span class="Sign">张砷镓</span> !　 <a href="/Player/Action/Quit_Action.asp" target="Action" class="High">退出登录</a>　|　<a href="javascript:;" onClick="Window('/Message/Box.asp');" class="High">短消息</a>　|　<a href="/Player/Index.asp?Id=1" class="High">我的地盘</a>　|　<a href="javascript:;" onClick="Window('/Download/Index.asp');" class="High">软件下载</a>　|　<a href="javascript:;" onClick="Window('/History/2008.asp');" class="High">更新历史</a>　|　<a href="javascript:;" onClick="Window('/About/Index.asp');" class="High">关于本站</a>　|　<a href="javascript:;" onClick="Window('/Team/Index.asp');" class="High">管理团队</a>　
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
	
    <td width="100" id="Top_8" style="cursor:pointer " class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" onClick="location='/Player/Index.asp?Id=1';">我的地盘</td>
    <td width="100" id="Top_10" style="cursor:pointer " class="Sign" onClick="Window('/Video/Upload.asp');">上传录像</td>
	
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
<table width="910" border="0" align="center" cellpadding="0" cellspacing="1">
<tr>
<td>
<form name="Player_Form" action="Action/Login_Action.asp" method="post" target="Action">
<table width="453" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#999999" id="Error_Table">
	<tr>
		<td bgcolor="#444444">
			<table width="453" border="0" cellspacing="0" cellpadding="0">
				<tr bgcolor="#555555">
					<td height="25" class="Highest" onmousedown="down=true;divtop=event.clientY;divleft=event.clientX;" onmouseup="down=false" onmouseout="down=false">　出错提示</td>
			</tr>
		  </table>
			<table width="453" border="0" cellspacing="30" cellpadding="0">
				<tr>
					<td colspan="3" class="Text"><span class="Sign"><img src="/Models/Images/Common/Sad.GIF" width="19" height="19" align="absmiddle"> 很抱歉，您所访问的文件不存在，您可以返回上页或回到本站首页。</span></td>
				</tr>
				<tr>
				  <td colspan="3" valign="top" class="Text">如果您是从本网站论坛内部访问，可能是由于用户的链接错误。<br>
				    如果您正在使用本网站功能，可能是由于我们的失误，请与管理员联系。				    <br>
			      如果您是从搜索引擎访问，可能是由于网站的更新导致内容过期。</td>
			  </tr>
				<tr>
				  <td width="124" valign="top" class="Text"><table width="100" height="40" border="0" align="center" cellpadding="0" cellspacing="1" style="cursor:pointer; " onClick="history.go(-1);">
                    <tr>
                      <td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">返回上页</td>
                    </tr>
                  </table></td>
			      <td width="124" align="left" valign="top" class="Text"><table width="100" height="40" border="0" align="left" cellpadding="0" cellspacing="1" style="cursor:pointer; " onClick="location='/Main/Index.asp';">
                    <tr>
                      <td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">回到首页</td>
                    </tr>
                  </table></td>
			      <td width="125" align="left" valign="top" class="Text"><table width="100" height="40" border="0" align="left" cellpadding="0" cellspacing="1" style="cursor:pointer; " onClick="Window('/Team/Index.asp');">
                    <tr>
                      <td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">联系管理员</td>
                    </tr>
                  </table></td>
			  </tr>
		  </table>
		</td>
	</tr>
</table>
<iframe name="Action" style="display: none"></iframe>
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
		case 13:
		Player_Form.submit();
		break;
		case 27:
		Cancel();      
		break;
	}
}		
document.onkeydown=KeyDown; 
document.onkeypress=KeyDown;

function Cancel()
{
		Player_Form.Player_Name.blur();
		Player_Form.Player_Password.blur();
		parent.End_Mask();
		parent.document.getElementById('Error_Box').style.display='none';
}
function Select()
{ 
	Player_Form.Player_Name.select();
}
</script>


<table width="910" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr height="100">
    <td height="60" align="center" class="High">Copyright @ 2008　<a href="<%=URL%>" target="_blank" class="High">中国扫雷网<b><%=Domain%></b></a>　版权所有</td>
  </tr>
</table>
</body>
<iframe name="Action" width="0" height="0" style="display: none"></iframe>
</html>