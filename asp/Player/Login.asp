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
<body onLoad="Window_Load();Select();" onMousemove="move()" topmargin=0 leftmargin=0 scroll=no>
<form name="Player_Form" action="Action/Login_Action.asp" method="post" target="Action">
<table id="Window_Table" border="0" cellspacing="1" cellpadding="0" bgcolor="#999999">
	<tr>
		<td bgcolor="#444444">
			<table width="360" border="0" cellspacing="0" cellpadding="0">
				<tr bgcolor="#555555">
					<td height="25" class="Highest" onMouseDown="down=true;divtop=event.clientY;divleft=event.clientX;" onMouseUp="down=false" onMouseOut="down=false">　用户登录</td>
					<td width="20" height="25" align="center" class="Bold" onMouseOver="this.className='Signest';" onMouseOut="this.className='Bold';" style="cursor:pointer; " onClick="Cancel();">×</td>
			</tr>
			</table>
			<table width="360" border="0" cellspacing="10" cellpadding="0">
				<tr>
					<td width="220" class="Text">
						登陆名称 
						<input name="Player_Name" type="text" class="input-no" size="25" maxlength="12" value="<%=Request.Cookies("Saolei.net")("Player_Name")%>">
						<br>
						登陆密码
						<input name="Player_Password" type="password" class="input-no" size="25" maxlength="12" value="<%=Request.Cookies("Saolei.net")("Player_Password")%>">  
					</td>
					<td width="50" class="Text">
						<table width="50" height="40" border="0" align="center" cellpadding="0" cellspacing="1" style="cursor:pointer; " onClick="Player_Form.submit();">
							<tr>
								<td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">登录</td>
							</tr>
						</table>
					</td>
					<td width="50" class="Text">
						<table width="50" height="40" border="0" align="center" cellpadding="0" cellspacing="1" style="cursor:pointer; " onClick="Cancel();">
							<tr>
								<td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">取消</td>
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
		parent.document.getElementById('Window_Box').style.display='none';
}
function Select()
{ 
	<%
	If Request.Cookies("Saolei.net")("Player_Name") = "" Then
		%>Player_Form.Player_Name.select();<%
	End If
	%>
}
</script>
