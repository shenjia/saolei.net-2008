<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-13
'------------------------
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
<link href="/Models/Css/2008.css" rel="stylesheet" type="text/css">
<!--#include virtual="/Models/Include/Windows.asp"-->
</head>
<body onLoad="Window_Load();" onMousemove="move()" topmargin=0 leftmargin=0 scroll=no>
<table id="Window_Table" border="0" cellspacing="1" cellpadding="0" bgcolor="#999999">
	<tr>
		<td bgcolor="#444444">
			<table width="300" border="0" cellspacing="0" cellpadding="0">
				<tr bgcolor="#555555">
					<td height="25" class="Highest" onMouseDown="down=true;divtop=event.clientY;divleft=event.clientX;" onMouseUp="down=false" onMouseOut="down=false">　软件下载</td>
					<td width="20" height="25" align="center" class="Bold" onMouseOver="this.className='Signest';" onMouseOut="this.className='Bold';" style="cursor:pointer; " onClick="Cancel();">×</td>
			</tr>
			</table>
			<table width="300" border="0" cellspacing="10" cellpadding="0">
				<tr>
				  <td colspan="2" class="Text">	
						<img src="/Models/Images/Common/Yellow.GIF" width="7" height="25" align="absmiddle"> <a href="Arbiter_0.52.3.zip" class="Sign">Minesweeper Arbiter 0.52.3</a> (<a href="/BBS/Title.asp?Id=11038" class="High" target="_blank">教程</a>) (<a href="/BBS/Title.asp?Id=11499" class="High" target="_blank">中文插件</a>)<br>
						<img src="/Models/Images/Common/Yellow.GIF" width="7" height="25" align="absmiddle"> <a href="Minesweeper_Clone_0.97.exe">Minesweeper Clone 0.97</a> (<a href="/BBS/Title.asp?Id=1006" class="High" target="_blank">使用说明</a>) (<a href="/Help/Question.asp" class="High">常见问题</a>) <br>
						<img src="/Models/Images/Common/Yellow.GIF" width="7" height="25" align="absmiddle"> <a href="Minesweeper_Clone_2007.exe" class="Text">Minesweeper Clone 2007</a> <br>
						<img src="/Models/Images/Common/Yellow.GIF" width="7" height="25" align="absmiddle"> <a href="MinesweeperX_1.15.zip" class="Text">Minesweeper X 1.15</a> <br>
						<img src="/Models/Images/Common/Yellow.GIF" width="7" height="25" align="absmiddle"> <a href="Viennasweeper_3.0.zip" class="Text">Viennasweeper 3.0</a> <br>
						<img src="/Models/Images/Common/Yellow.GIF" width="7" height="25" align="absmiddle"> <a href="Minesweeper_2000XP.exe" class="Text">Minesweeper 2000/XP</a> <br>
                    <img src="/Models/Images/Common/Yellow.GIF" alt="" width="7" height="25" align="absmiddle"> <a href="MineSweeper_Solver.exe" class="Text">Minesweeper Solver</a><br>
						<img src="/Models/Images/Common/Yellow.GIF" width="7" height="25" align="absmiddle"> <a href="Saolei.net&#20998;&#36776;&#29575;&#35843;&#25972;&#24037;&#20855;.exe" class="High">Saolei.net分辨率调整工具</a><br>
				  <img src="/Models/Images/Common/Yellow.GIF" width="7" height="25" align="absmiddle"> <a href="Saolei.net&#22320;&#22270;&#36716;&#25442;&#24037;&#20855;.rar" class="High">Saolei.net地图转换工具</a><br>
						<img src="/Models/Images/Common/Yellow.GIF" width="7" height="25" align="absmiddle"> <a href="MPlayer_v2.0.2.apk" class="Text">Android录像播放器 2.0.2</a> <br>
						<img src="/Models/Images/Common/Yellow.GIF" width="7" height="25" align="absmiddle"> <a href="NotMinesweeper_V1.0.19.apk" class="Text">Android雷感训练器 1.0.19</a> <br>


</td>
				</tr>
				<tr>
					<td width="175" class="Text">
						<table width="100" height="30" border="0" align="right" cellpadding="0" cellspacing="1" style="cursor:pointer; " onClick="top.location='/BBS/Index.asp';">
							<tr>
								<td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">下载有问题</td>
							</tr>
						</table>
					</td>
					<td width="155" class="Text">
						<table width="80" height="30" border="0" align="left" cellpadding="0" cellspacing="1" style="cursor:pointer; " onClick="Cancel();">
							<tr>
								<td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">返回</td>
							</tr>
						</table>
					</td>
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
		parent.End_Mask();
		parent.document.getElementById('Window_Box').style.display='none';
}
</script>
