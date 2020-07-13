<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-14
'------------------------
Point = 12
%>
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
<!--#include virtual="/Models/Include/ShowHide.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="Refresh" content="100">
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
<body onLoad="parent.document.getElementById('Hot').style.display='block';">
<table width="290" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="290" height="550" valign="top" class="Text">
	<table width="280" border="0" cellspacing="0" cellpadding="0">
	<%
	Call Start_Conn()
	
	SQL_Text = "BBS_Hot "&Point
	rs.Open SQL_Text,Conn,3,1
		
	Max_Page = 1
			
	If Not rs.Eof Then
	
		Total_Number = rs("Total")
		
		If Total_Number Mod Point = 0 Then
			Max_Page = Total_Number \ Point
		Else
			Max_Page = Total_Number \ Point + 1
		End If
		
		Notice_Text = "<span class=Sign>公告</span>"
		Skill_Text = "技术"
		Other_Text = "杂谈"
		Ask_Text = "问答"
		I = 1
		
		Do While Not rs.Eof
			If rs("Title_IsHigh") Then 
				Cls = "High"
			Else
				Cls = "Text"
			End If
			%><tr class="Text" onMouseOver="Title_<%=I%>.className='Sign';this.style.background='#444444';" onMouseOut="Title_<%=I%>.className='<%=Cls%>';this.style.background='#333333';">
			<td width="99%" nowrap><div>[<%Execute "Response.Write("&rs("Title_Model")&"_Text)"%>]&nbsp;<a id="Title_<%=I%>" href="/BBS/Title.asp?Id=<%=rs("Title_Id")%>" target="_blank" class="<%=Cls%>"><%=rs("Title_Name")%></a><%If rs("Title_IsNice") Then%><span class="Sign">.精</span><%End If%>&nbsp;(<span class="Counter"><%=rs("Title_Reply")%></span>/<span class="Counters"><%=rs("Title_Click")%></span>)</div></td>
			<td width="1%" class="td" nowrap></td></tr>
			<%
			I = I + 1
			rs.MoveNext
		Loop		
		
	End If
	
	Call End_Conn()
	%>
	</table>
	</td>
  </tr>
</table>
<script language="javascript">
function Video_Refresh()
{
	try{top.Hot_Frame.location=top.Hot_Frame.location;}catch(e){}
}
Video_Refreshing=setInterval('Video_Refresh()',60000);
</script>
</body>
</html>
