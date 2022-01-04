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
<body onload="Window_Load();Player_Form.Player_Id.select();" onMousemove="move()" topmargin=0 leftmargin=0 scroll=no>
<form name="Player_Form" action="Action/Password_Id_Check_Action.asp" method="post" target="Action">
<table id="Window_Table" border="0" cellspacing="1" cellpadding="0" bgcolor="#999999">
	<tr>
		<td bgcolor="#444444">
			<table width="260" border="0" cellspacing="0" cellpadding="0">
				<tr bgcolor="#555555">
					<td height="25" class="Highest" onmousedown="down=true;divtop=event.clientY;divleft=event.clientX;" onmouseup="down=false" onmouseout="down=false">　找回密码</td>
					<td width="20" height="25" align="center" class="Bold" onMouseOver="this.className='Signest';" onMouseOut="this.className='Bold';" style="cursor:pointer; " onClick="Cancel();">×</td>
			</tr>
			</table>
			<table width="260" border="0" cellspacing="10" cellpadding="0">
				<tr>
					<td colspan="2" class="Text">
					请输入您的用户ID：
					<input name="Player_Id" type="text" class="input-no" id="Player_Id" size="12" maxlength="5"> 
					</td>
				</tr>
				<tr>
					<td width="120" class="Text">
						<table width="80" height="30" border="0" align="right" cellpadding="0" cellspacing="1" style="cursor:pointer; " onClick="Player_Form.submit();">
							<tr>
								<td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">下一步</td>
							</tr>
						</table>
					</td>
					<td width="110" class="Text">
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
</form>
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
		Player_Form.Player_Id.blur();
		parent.End_Mask();
		parent.document.getElementById('Window_Box').style.display='none';
}
</script>
