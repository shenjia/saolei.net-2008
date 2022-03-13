<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-11
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
<link href="/Models/Css/2008.css?v=20220104" rel="stylesheet" type="text/css">
<!--#include virtual="/Models/Include/Windows.asp"-->
</head>
<body onload="Window_Load();" onMousemove="move()" topmargin=0 leftmargin=0 scroll=no>
<table id="Window_Table" border="0" cellspacing="1" cellpadding="0" bgcolor="#999999">
	<tr>
		<td bgcolor="#444444">
			<table width="360" border="0" cellspacing="0" cellpadding="0">
				<tr bgcolor="#555555">
					<td height="25" class="Highest" onmousedown="down=true;divtop=event.clientY;divleft=event.clientX;" onmouseup="down=false" onmouseout="down=false">　注册必读</td>
					<td width="20" height="25" align="center" class="Bold" onMouseOver="this.className='Signest';" onMouseOut="this.className='Bold';" style="cursor:pointer; " onClick="Cancel();">×</td>
			</tr>
			</table>
			<table width="360" border="0" cellspacing="10" cellpadding="0">
				<tr>
					<td colspan="2" class="Text">
						1、<span class="High"><strong>必须使用</strong></span><span class="Signest"><strong>真实姓名</strong></span><span class="High"><strong>注册，每人只能注册一个用户。</strong></span><br>
						2、<span class="High"><strong>未用实名注册者所上传录象，一律不审核通过。</strong></span><br>
						3、如发现注册信息不实，管理员有权封停或删除该用户。<br>
						4、本网站只接受 <a href="/Download/Index.asp" target="_blank" class="High"><strong>Minesweeper Arbiter</strong></a> 录制的 <span class="High"><strong>avf</strong></span> 格式录象。 <br>
						5、录象上传后需经管理员审核后方可生效。<br>
						6、如发现用户伪造录象，将立刻删除该用户所有信息。
					</td>
				</tr>
				<tr>
					<td width="175" class="Text">
						<table width="110" height="30" border="0" align="right" cellpadding="0" cellspacing="1" style="cursor:pointer; " onClick="location='/Player/Register_Text.asp';">
							<tr>
								<td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">我同意以上条例</td>
							</tr>
						</table>
					</td>
					<td width="155" class="Text">
						<table width="80" height="30" border="0" align="left" cellpadding="0" cellspacing="1" style="cursor:pointer; " onClick="Cancel();">
							<tr>
								<td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">放弃注册</td>
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
function KeyDown()
{ 
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
