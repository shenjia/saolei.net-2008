<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-11
'------------------------
Dim Player_Id
%>
<!--#include virtual="/Models/Common/Error.asp"-->
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
<!--#include virtual="/Models/Common/Function.asp"-->
<%
Call Get_Input()
Call Check_Input()

If Message = "No" Then
	
	Call Start_Conn()
	
	Set cmd = Server.CreateObject("ADODB.Command")
	Set cmd.ActiveConnection = Conn
	cmd.CommandText = "dbo.Player_Password_Read"
	cmd.CommandType = &H0004
	
	cmd.Parameters.Append cmd.CreateParameter("@Player_Id",3)
	cmd.Parameters.Append cmd.CreateParameter("@Player_Question",200,2,50)
	cmd.Parameters.Append cmd.CreateParameter("@Result",200,2,20)
	
	cmd("@Player_Id") = Player_Id
	
	cmd.execute
	
	Result = cmd("@Result")
	Player_Question = cmd("@Player_Question")
	Set cmd = Nothing
	Call End_Conn()
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
	<body onload="Window_Load();Player_Form.Player_Name.select();" onMousemove="move()" topmargin=0 leftmargin=0 scroll=no>
		<form name="Player_Form" action="Action/Password_Action.asp" method="post" target="Action">
		<table id="Window_Table" border="0" cellspacing="1" cellpadding="0" bgcolor="#999999">
			<tr>
			<td bgcolor="#444444">
				<table width="260" border="0" cellspacing="0" cellpadding="0">
					<tr bgcolor="#555555">
						<td height="25" class="Highest" onmousedown="down=true;divtop=event.clientY;divleft=event.clientX;" onmouseup="down=false" onmouseout="down=false">　<%=Player_Question%></td>
						<td width="20" height="25" align="center" class="Bold" onMouseOver="this.className='Signest';" onMouseOut="this.className='Bold';" style="cursor:pointer; " onClick="Cancel();">×</td>
				</tr>
				</table>
				<table width="260" border="0" cellspacing="10" cellpadding="0">
					<tr>
						<td colspan="2" class="Text">
						请输入答案：
						<input name="Player_Answer" type="text" class="input-no" id="Player_Name" size="20" maxlength="50"> 
						<input name="Player_Id" type="hidden" value="<%=Player_Id%>">
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
			Player_Form.Player_Name.blur();
			parent.End_Mask();
			parent.document.getElementById('Window_Box').style.display='none';
	}
	</script>
	<%
End If

Sub Get_Input()

	Player_Id = Request("Id")

End Sub

Sub Check_Input()

	Message = "No"
	If Check_Express(Player_Id,"\d{1,6}") Then Message = "指定的[用户ID]不合法!"
	If Player_Id = "" Then Message = "未指定[用户ID]!"
	
	If Message <> "No" Then
		Act = "parent.End_Mask();parent.document.getElementById('Window_Box').style.display='none';"
		Call Error()
	End If	
	
End Sub
%>

