<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-17
'------------------------
%>
<!--#include virtual="/Player/Check.asp"-->
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
<%
Call Check()

If Check_Result <> "Fail" Then

	Call Start_Conn()
	
	Set cmd = Server.CreateObject("ADODB.Command")
	Set cmd.ActiveConnection = Conn
	cmd.CommandText = "dbo.Message_Satus"
	cmd.CommandType = &H0004
	
	cmd.Parameters.Append cmd.CreateParameter("@Player_Id",3)
	cmd.Parameters.Append cmd.CreateParameter("@All_Number",3,2)
	cmd.Parameters.Append cmd.CreateParameter("@New_Number",3,2)
	
	cmd("@Player_Id") = Session("Player_Id")
	cmd.execute
	
	All_Number = cmd("@All_Number")
	New_Number = cmd("@New_Number")
	
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
		background-color: #333333;
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
			<table width="420" border="0" cellspacing="0" cellpadding="0">
				<tr bgcolor="#555555">
					<td height="25" class="Highest" onmousedown="down=true;divtop=event.clientY;divleft=event.clientX;" onmouseup="down=false" onmouseout="down=false">　收件箱</td>
					<td width="20" height="25" align="center" class="Bold" onMouseOver="this.className='Signest';" onMouseOut="this.className='Bold';" style="cursor:pointer; " onClick="Cancel();">×</td>
				</tr>
			</table>
			<table width="420" border="0" cellspacing="10" cellpadding="0">
				<tr><td width="126" height="30">
					<table width="120" height="30" border="0" align="left" cellpadding="0" cellspacing="1" style="cursor:pointer; " onClick="Action.location='/Message/Action/Clear_Action.asp';">
						<tr>
							<td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">清除已读消息</td>
						</tr>
				  </table>
					</td>
				  <td width="264" class="Text">收件箱内共有&nbsp;<span class="Title"><%=All_Number%></span>&nbsp;条消息，其中&nbsp;<span class="Signest"><%=New_Number%></span>&nbsp;条未读消息</td>
				</tr>
			</table>
			<table width="420" border="0" cellspacing="0" cellpadding="0">
				<tr><td height="1" bgcolor="#555555"></td></tr>
			</table>
			<table width="420" border="0" cellspacing="10" cellpadding="0">
				<tr>
					<td valign="middle" class="Text">
					<table width="400" border="0" cellspacing="0" cellpadding="0">
						<tr><td height="260" valign="top">
							<div id="Box" style="display:none ">
							<iframe name="Box_Frame" frameborder="0" width="400" height="260" scrolling="no" src="/Message/List.asp?Page=1"></iframe>
							</div>
						</td></tr>
						<tr>
						  <td height="30" valign="middle" class="Text">※ 消息自发出后保存七天，过后将自动删除，请注意保存有用信息</td>
					  </tr>
					</table>
					</td>
			    </tr>
			</table>
		  </td>
		</tr>
	</table>
	<iframe name="Action" style="display: none"></iframe>
	</body>
	</html>
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
	<%

End If
%>