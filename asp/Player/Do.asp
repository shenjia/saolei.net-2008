<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-12
'------------------------
%>
<!--#include virtual="/Player/Check.asp"-->
<%
Call Check()

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
		background-color: #333333;
	}
	-->
	</style>
	<link href="/Models/Css/2008.css?v=20211218" rel="stylesheet" type="text/css">
	</head>
	<body onLoad="parent.document.getElementById('Do').style.display='block';">
	<table width="290" border="0" cellspacing="10" cellpadding="0">
	  <tr class="Text">
		<td width="100" align="left" valign="top">
		<table width="100" height="20" border="0" align="left" cellpadding="0" cellspacing="0" style="cursor:pointer; " onClick="top.Window('/Video/Upload.asp');">
			<tr>
			  <td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">上传录像</td>
			</tr>
		</table>
		</td>
		<td width="160" align="left" valign="top">上传一个新的录像</td>
	  </tr>
	  <tr class="Text">
		<td width="100" align="left" valign="top">
		<table width="100" height="20" border="0" align="left" cellpadding="0" cellspacing="0" style="cursor:pointer; " onClick="top.Window('/Player/Manage.asp');">
			<tr>
			  <td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">信息管理</td>
			</tr>
		</table>
		</td>
		<td width="160" align="left" valign="top">管理您的个人信息和密码</td>
	  </tr>
	  <tr class="Text">
		<td width="100" align="left" valign="top">
		<table width="100" height="20" border="0" align="left" cellpadding="0" cellspacing="0" style="cursor:pointer; " onClick="top.Window('/Message/Box.asp');">
			<tr>
			  <td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">收件箱</td>
			</tr>
		</table>
		</td>
		<td width="160" align="left" valign="top">管理您收到的短消息</td>
	  </tr>
	</table>
	</body>
	</html>
	<%
End If
%>