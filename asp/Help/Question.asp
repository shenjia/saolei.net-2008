<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-17
'------------------------
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
			<table width="550" border="0" cellspacing="0" cellpadding="0">
				<tr bgcolor="#555555">
					<td height="25" class="Highest" onmousedown="down=true;divtop=event.clientY;divleft=event.clientX;" onmouseup="down=false" onmouseout="down=false">　Minesweeper Clone  0.97 常见问题</td>
					<td width="20" height="25" align="center" class="Bold" onMouseOver="this.className='Signest';" onMouseOut="this.className='Bold';" style="cursor:pointer; " onClick="Cancel();">×</td>
			</tr>
			</table>
			<table width="550" border="0" cellspacing="10" cellpadding="0">
				<tr>
				  <td class="Text">					  <p class="Text"><SPAN 
                  class=Title>运行游戏点击鼠标便自动退出</SPAN><BR>
				    　本游戏要求屏幕颜色为32位，进入&nbsp;<SPAN 
                  class=Sign>控制面板&nbsp;-&nbsp;显示&nbsp;-&nbsp;设置</SPAN>，将&nbsp;<SPAN 
                  class=Sign>颜色质量</SPAN>&nbsp;调整为&nbsp;<SPAN 
                  class=Sign>最高(32位)</SPAN>&nbsp;即可。<BR>
                  <SPAN 
                  class=Title>运行游戏后始终最小化</SPAN><br>
                  　本问题是因为软件最小化状态下在任务栏上右键关闭导致。解决方法有二：<BR>
                  　1、打开游戏安装目录下的&nbsp;<SPAN 
                  class=Sign>minesweeperclone.inf</SPAN>，将&nbsp;<SPAN 
                  class=Sign>Main&nbsp;X</SPAN>&nbsp;和&nbsp;<SPAN 
                  class=Sign>Main&nbsp;Y</SPAN>&nbsp;都改为&nbsp;<SPAN 
                  class=Sign>0</SPAN>&nbsp;保存即可。<br>
                  　2、在任务栏右键点击软件窗口，选择<span class="Sign"> 移动</span>，按上下左右任意一个方向键，点击左键。<BR>
                  <SPAN 
                  class=Title>完成游戏后无法保存录象</SPAN><BR>
                  　打开&nbsp;<SPAN 
                  class=Sign>Option</SPAN>&nbsp;菜单，选择&nbsp;<SPAN 
                  class=Sign>Classic&nbsp;Mode</SPAN>&nbsp;即可。<BR>
                  <SPAN 
                  class=Title>重装软件后各项纪录都为0无法刷新</SPAN><BR>
                  　打开纪录窗口，选择&nbsp;<SPAN 
                  class=Sign>Reset</SPAN>&nbsp;即可。<BR>
                  <SPAN 
                  class=Title>重装软件如何保存各种纪录和统计数据</SPAN><BR>
　事先备份游戏安装目录下的&nbsp;<SPAN 
                  class=Sign>history.inf</SPAN>&nbsp;和&nbsp;<SPAN 
                  class=Sign>history-density.inf</SPAN>&nbsp;，重装后拷贝至新安装目录下即可。<BR>
                  <SPAN 
                  class=Title>游戏结束时提示Run-time&nbsp;error&nbsp;'55'&nbsp;:&nbsp;File&nbsp;already&nbsp;open&nbsp;</SPAN><BR>
                  　按&nbsp;<SPAN 
                  class=Sign>F5</SPAN>&nbsp;键，进入&nbsp;<SPAN 
                  class=Sign>Auto&nbsp;recording</SPAN>，将&nbsp;<SPAN 
                  class=Sign>Text&nbsp;for&nbsp;videos</SPAN>&nbsp;和&nbsp;<SPAN 
                  class=Sign>Player&nbsp;Name</SPAN>&nbsp;都设置为英文。<br>
				  </p>
			      </td>
				</tr>
				<tr>
				  <td class="Text">
						<table width="180" height="30" border="0" align="center" cellpadding="0" cellspacing="1" style="cursor:pointer; " onClick="Cancel();">
							<tr>
								<td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">我明白了，多谢指教</td>
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
