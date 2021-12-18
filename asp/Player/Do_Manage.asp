<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-16
'------------------------
%>
<!--#include virtual="/Player/Check.asp"-->
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
<%
Call Check_Master()

If Check_Result <> "Fail" Then
	
	Call Start_Conn()
	
	Set cmd = Server.CreateObject("ADODB.Command")
	Set cmd.ActiveConnection = Conn
	cmd.CommandText = "dbo.Satus_Manage"
	cmd.CommandType = &H0004
	
	cmd.Parameters.Append cmd.CreateParameter("@Player_Number",3,2)
	cmd.Parameters.Append cmd.CreateParameter("@Video_Check",3,2)
	
	cmd.execute
	
	Player_Number = cmd("@Player_Number")
	Video_Check = cmd("@Video_Check")
	
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
	<link href="/Models/Css/2008.css?v=20211218" rel="stylesheet" type="text/css">
	</head>
	<body onLoad="parent.document.getElementById('Info').style.display='block';">
	<table width="290" border="0" cellspacing="10" cellpadding="0">
	  <tr class="Text">
		<td width="100" align="left" valign="top">
		<table width="100" height="20" border="0" align="left" cellpadding="0" cellspacing="0" style="cursor:pointer; " onClick="top.Window('/Ranking/Refresh.asp?tmp='+Math.random());">
			<tr>
			  <td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">刷新排行</td>
			</tr>
		</table>
		</td>
		<td width="160" align="left" valign="top">还有<span class="Signest">&nbsp;<%=Video_Check%>&nbsp;</span>个录像等待您的审核</td>
	  </tr>
	  <tr class="Text">
		<td width="100" align="left" valign="top">
		<table width="100" height="20" border="0" align="left" cellpadding="0" cellspacing="0" style="cursor:pointer; " onClick="top.Window('/Player/Search.asp');">
			<tr>
			  <td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">查找用户</td>
			</tr>
		</table>
		</td>
		<td width="160" align="left" valign="top">共有<span class="Signest">&nbsp;<%=Player_Number%>&nbsp;</span>位用户</td>
	  </tr>
	  <tr class="Text">
		<td width="100" align="left" valign="top">
		<table width="100" height="20" border="0" align="left" cellpadding="0" cellspacing="0" style="cursor:pointer; " onClick="top.Window('/Message/Broad.asp');">
			<tr>
			  <td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">消息广播</td>
			</tr>
		</table>
		</td>
		<td width="160" align="left" valign="top">向全体用户发送短消息</td>
	  </tr>
	</table>
	</body>
	</html>
	<%
End If
%>