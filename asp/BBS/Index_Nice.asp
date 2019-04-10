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
.tbl {table-layout:fixed}
.td {overflow:hidden;}
-->
</style>
<link href="/Models/Css/2008.css" rel="stylesheet" type="text/css">
</head>
<body onLoad="parent.document.getElementById('BBS').style.display='block';">
<table width="290" border="0" cellspacing="5" cellpadding="0">
  <tr>
    <td width="290" valign="top" class="Text">
	<table id="Scroll_Table" width="280" class="tbl" border="0" cellspacing="0" cellpadding="0">
	<%
	Call Start_Conn()
	
	SQL_Text = "Title_Index_Nice"
	rs.Open SQL_Text,Conn,3,1
			
	If Not rs.Eof Then
	
		Notice_Text = "<span class=Sign>公告</span>"
		Skill_Text = "技术"
		Other_Text = "杂谈"
		Ask_Text = "问答"
	
		Do While Not rs.Eof
			If rs("Title_IsHigh") Then 
				Cls = "High"
			Else
				Cls = "Text"
			End If
			%>
			<tr class="Text" onMouseOver="Title_<%=rs("Title_Id")%>.className='Sign';this.style.background='#444444';" onMouseOut="Title_<%=rs("Title_Id")%>.className='<%=Cls%>';this.style.background='#333333';">
			<td width="80%" class="td" valign="top" nowrap><div class="Text">
			<img src="/Models/Images/Common/Yellow.GIF" width="7" height="25" align="absmiddle">&nbsp;[<%Execute "Response.Write("&rs("Title_Model")&"_Text)"%>]&nbsp;<a id="Title_<%=rs("Title_Id")%>" href="/BBS/Title.asp?Id=<%=rs("Title_Id")%>" class="<%=Cls%>" target="_blank"><%=rs("Title_Name")%></a><%If rs("Title_IsNice") Then%><span class="Sign">.精</span><%End If%></div></td>
		  <td width="20%" class="td" valign="top" align="center"><div class="Text"><%=Month(rs("Title_Post_Time"))%>-<%=Day(rs("Title_Post_Time"))%></div></td></tr><%
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
