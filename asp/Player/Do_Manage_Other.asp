<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-31
'------------------------
Dim Player_Id
%>
<!--#include virtual="/Player/Check.asp"-->
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
<%
Call Get_Input()
Call Check_Master()

If Check_Result <> "Fail" Then
	
	Call Start_Conn()
	
	SQL_Text = "Player_Read "&Player_Id
	rs.Open SQL_Text,Conn,1,3
	
	Player_IsLive = rs("Player_IsLive")
	
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
		<table width="100" height="20" border="0" align="left" cellpadding="0" cellspacing="0" style="cursor:pointer; " onClick="top.Window('/Player/Edit.asp?Id=<%=Player_Id%>');">
			<tr>
			  <td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">编辑用户</td>
			</tr>
		</table>
		</td>
		<td width="160" align="left" valign="top">编辑本用户的资料</td>
	  </tr>
	  <tr class="Text">
		<td width="100" align="left" valign="top">
		<table width="100" height="20" border="0" align="left" cellpadding="0" cellspacing="0" style="cursor:pointer; " onClick="Action.location='/Player/Action/Live_Action.asp?Id=<%=Player_Id%>';">
			<tr>
			  <td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';"><%If Player_IsLive Then%>封停<%Else%>激活<%End If%>用户</td>
			</tr>
		</table>
		</td>
		<td width="160" align="left" valign="top">激活/封停本用户</td>
	  </tr>
	  <tr class="Text">
		<td width="100" align="left" valign="top">
		<table width="100" height="20" border="0" align="left" cellpadding="0" cellspacing="0" style="cursor:pointer; " onClick="Action.location='/Player/Action/Del_Action.asp?Id=<%=Player_Id%>';">
			<tr>
			  <td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">删除用户</td>
			</tr>
		</table>
		</td>
		<td width="160" align="left" valign="top">删除本用户</td>
	  </tr>
	</table>
	<iframe name="Action" style="display: yes"></iframe>
	</body>
	</html>
	<%
End If

Sub Get_Input()

	Player_Id = Request("Id")

End Sub
%>