<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-30
'------------------------
%>
<!--#include virtual="/Player/Check.asp"-->
<%
Call Check_Master()

If Check_Result <> "Fail" Then
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
	<!--#include virtual="/Models/Include/ShowHide.asp"-->
	</head>
	<body onload="Window_Load();Player_Form.Player_Id.focus();" onMousemove="move()" topmargin=0 leftmargin=0 scroll=no>
	<form name="Player_Form" action="/Player/Search_Result.asp" method="post">
	<table id="Window_Table" border="0" cellspacing="1" cellpadding="0" bgcolor="#999999">
		<tr>
			<td bgcolor="#444444">
				<table width="300" border="0" cellspacing="0" cellpadding="0">
					<tr bgcolor="#555555">
						<td height="25" class="Highest" onmousedown="down=true;divtop=event.clientY;divleft=event.clientX;" onmouseup="down=false" onmouseout="down=false">　查找用户</td>
						<td width="20" height="25" align="center" class="Bold" onMouseOver="this.className='Signest';" onMouseOut="this.className='Bold';" style="cursor:pointer; " onClick="Cancel();">×</td>
				</tr>
				</table>
				<table width="300" border="0" cellspacing="10" cellpadding="0">
					<tr>
						<td colspan="2" class="Text">
	用户ＩＤ：
				  <input name="Player_Id" type="text" class="input-no" size="6" maxlength="6">
				  <br>
				  登陆名称：
				  <input name="Player_Name" type="text" class="input-no" size="12" maxlength="12">
				  <br>
	中文姓名：
	<input name="Player_Name_Chinese" type="text" class="input-no" size="12" maxlength="12">
	<br>
	姓名拼音：
	<input name="Player_Name_English" type="text" class="input-no" size="20" maxlength="30">
	<br>
	网　　名：
	<input name="Player_Name_Net" type="text" class="input-no" size="12" maxlength="20">
	<br>
	ＱＱ号码：
	<input name="Player_QQ" type="text" class="input-no" size="12" maxlength="12">
	<br>
电子邮箱：
<input name="Player_Email" type="text" class="input-no" size="20" maxlength="50">
<br>
	录象标识文字：
	<input name="Player_Text" type="text" class="input-no" size="30" maxlength="50">
	<br>
	登陆IP地址：
	<input name="Player_IP" type="text" class="input-no" size="20" maxlength="15">
	</td>
					</tr>
					<tr>
						<td width="141" class="Text">
							<table width="110" height="30" border="0" align="right" cellpadding="0" cellspacing="1" style="cursor:pointer; " onClick="Player_Form.submit();">
								<tr>
									<td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">进行查找</td>
								</tr>
							</table>
						</td>
						<td width="129" class="Text">					  
							<table width="110" height="30" border="0" align="left" cellpadding="0" cellspacing="1" style="cursor:pointer; " onClick="Cancel();">
								<tr>
									<td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">放弃查找</td>
								</tr>
						</table></td>
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
			Player_Form.Player_Name.blur();
			Player_Form.Player_Name_Chinese.blur();
			Player_Form.Player_Name_English.blur();
			Player_Form.Player_Name_Net.blur();
			Player_Form.Player_QQ.blur();
			Player_Form.Player_Email.blur();
			Player_Form.Player_Text.blur();
			Player_Form.Player_IP.blur();
			parent.End_Mask();
			parent.document.getElementById('Window_Box').style.display='none';
	}
	</script>
	<%
End If
%>