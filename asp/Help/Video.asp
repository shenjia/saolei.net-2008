<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-13
'------------------------
From = Request("From")
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #444444;
}
-->
</style>
<link href="/Models/Css/2008.css?v=20211218" rel="stylesheet" type="text/css">
<!--#include virtual="/Models/Include/Windows.asp"-->
</head>
<body onload="Window_Load();" onMousemove="move()" topmargin=0 leftmargin=0 scroll=no>
<table id="Window_Table" border="0" cellspacing="1" cellpadding="0" bgcolor="#999999">
	<tr>
		<td bgcolor="#444444">
			<table width="500" border="0" cellspacing="0" cellpadding="0">
				<tr bgcolor="#555555">
					<td height="25" class="Highest" onmousedown="down=true;divtop=event.clientY;divleft=event.clientX;" onmouseup="down=false" onmouseout="down=false">　怎么看录像？</td>
					<td width="20" height="25" align="center" class="Bold" onMouseOver="this.className='Signest';" onMouseOut="this.className='Bold';" style="cursor:pointer; " onClick="Cancel();">×</td>
			</tr>
			</table>
			<table width="500" border="0" cellspacing="10" cellpadding="0">
				<tr>
				  <td colspan="2" class="Text">					  <p class="Text"><span class="Title">                  </span> 　　
要观看avf录像，请先下载 <a href="/Download/Arbiter_0.52.2.zip" class="Sign">Minesweeper Arbiter 0.52.2</a> 。<br>　　
要观看mvf录像，请先下载 <a href="/Download/Minesweeper_Clone_0.97.rar" class="Sign">Minesweeper Clone 0.97</a> 并安装。<br>
　　安装完后运行进入游戏，如果遇到问题，<a href="/BBS/Index.asp" target="_blank" class="Sign">请到论坛提问</a>。<br>
　　打开网站上任何一个录像，点击<span class="High">“保存录像”</span>，将录像保存到桌面上。<br>
　　双击保存下来的录像文件，选择打开方式。<br>
　　mvf录像浏览到 <span class="Sign">Clone</span> 的安装目录，选择<span class="Sign"> Minesweeper Clone.exe</span> 。<br>
　　avf录像浏览到 <span class="Sign">Arbiter</span> 的所在目录，选择<span class="Sign"> ms_arbiter.exe</span> 。<br>
　　选择 <span class="Sign">“始终使用选择的程序打开这种文件”</span> 。<br>
　　打开网站上任何一个录像，点击<span class="High">“打开录像”</span>，选择“始终打开”。<br>
　　好了，现在你可以选择“打开录像”来直接播放，也可以选择“保存录像”将其下载。<br>
				  </p>
			      </td>
				</tr>
				<tr>
				  <td width="258" class="Text">
						<table width="180" height="30" border="0" align="right" cellpadding="0" cellspacing="1" style="cursor:pointer; " onClick="Cancel();">
							<tr>
								<td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">明白了，我要继续看录像</td>
							</tr>
					</table>
				  </td>
				  <td width="212" class="Text"><table width="120" height="30" border="0" align="left" cellpadding="0" cellspacing="1" style="cursor:pointer; " onClick="top.location='/BBS/Index.asp';">
                    <tr>
                      <td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">我有问题想问</td>
                    </tr>
                  </table></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</body>
</html>
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
		case 27:
		Cancel();      
			break;
	}
}		
document.onkeydown=KeyDown; 
document.onkeypress=KeyDown;

function Cancel()
{
	<%If From="Index" Then%>
	parent.End_Mask();
	parent.document.getElementById('Window_Box').style.display='none';
	<%Else%>
	history.go(-1);
	<%End If%>
}
</script>
