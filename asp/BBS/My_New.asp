<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-20
'------------------------
%>
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #333333;
}
.tbl {table-layout:fixed}
.td {overflow:hidden;}
-->
</style>
<link href="/Models/Css/2008.css?v=20220104" rel="stylesheet" type="text/css">
</head>
<body onLoad="parent.document.getElementById('BBS').style.display='block';">
<table width="290" border="0" cellspacing="5" cellpadding="0">
  <tr>
    <td width="290" valign="top" class="Text">
	<table id="Scroll_Table" width="280" class="tbl" border="0" cellspacing="0" cellpadding="0">
	<%
	Player_Id = Request("Id")
	
	Call Start_Conn()
	
	SQL_Text = "Title_My_New "&Player_Id
	rs.Open SQL_Text,Conn,3,1
			
	If Not rs.Eof Then
	
		Notice_Text = "¹«¸æ"
		Skill_Text = "¼¼Êõ"
		Other_Text = "ÔÓÌ¸"
		Ask_Text = "ÎÊ´ð"
	
		Do While Not rs.Eof
			%>
			<tr class="Text" onMouseOver="Title_<%=rs("Title_Id")%>.className='Sign';this.style.background='#444444';" onMouseOut="Title_<%=rs("Title_Id")%>.className='Text';this.style.background='#333333';">
			<td width="80%" class="td" valign="top" nowrap><div class="Text">
			<img src="/Models/Images/Common/Yellow.GIF" width="7" height="25" align="absmiddle">&nbsp;[<%Execute "Response.Write("&rs("Title_Model")&"_Text)"%>]&nbsp;<a id="Title_<%=rs("Title_Id")%>" href="/BBS/Title.asp?Id=<%=rs("Title_Id")%>" class="Text" target="_blank"><%=rs("Title_Name")%></a></div></td>
		  <td width="20%" class="td" valign="top" align="left"><div class="Text">¡¡<%=Right(Year(rs("Title_Post_Time")),2)%>-<%=Month(rs("Title_Post_Time"))%></div></td></tr><%
			rs.MoveNext
		Loop		
		
	End If
	
	Call End_Conn()
	%>
	</table>
	</td>
  </tr>
</table>
</body>
<iframe name="Action" style="display: none"></iframe>
</html>
