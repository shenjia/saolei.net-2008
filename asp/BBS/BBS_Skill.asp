<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-31
'------------------------
Point = 19
%>
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
<!--#include virtual="/Models/Include/ShowHide.asp"-->
<%
Call Get_Input()

If Request("Nice") <> "" Then Session("Nice") = Request("Nice")
If Session("Nice") = "" Then Session("Nice") = 0
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
.tbl {table-layout:fixed}
.td {overflow:hidden;}
-->
</style>
<link href="/Models/Css/2008.css?v=20211218" rel="stylesheet" type="text/css">
</head>
<body onLoad="parent.document.getElementById('BBS').style.display='block';">
<%
If Session("Nice") Then
	%>
	<table width="575" border="0" cellspacing="0" cellpadding="0">
	<tr>
	<td width="96" class="Text">
	<table width="80" height="20" border="0" align="left" cellpadding="0" cellspacing="0" style="cursor:pointer; " onClick="location='?Nice=0';">
	  <tr>
		<td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">返回</td>
	  </tr>
	</table></td>
	<td width="369" class="Title">【精华区】</td>
	</tr>
	<tr><td height="10" colspan="3"></td></tr>
	<tr><td height="1" colspan="3" bgcolor="#555555"></td></tr>
	<tr><td height="10" colspan="3"></td></tr>
	</table>
	<%
Else
	%>
	<table width="575" border="0" cellspacing="0" cellpadding="0">
	<tr>
	<td width="110">
		<table width="100" height="20" border="0" align="left" cellpadding="0" cellspacing="0" style="cursor:pointer; " onClick="<%If Session("Player_Id")<>"" Then%>location='/BBS/Post.asp?Model=Skill';<%Else%>top.Window('/Player/Login.asp');<%End If%>">
		<tr>
		<td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">发表新主题</td>
		</tr>
		</table>
	</td>
	<td width="96" class="Text">
	<table width="80" height="20" border="0" align="left" cellpadding="0" cellspacing="0" style="cursor:pointer; " onClick="location='?Nice=1';">
	  <tr>
		<td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">精华区</td>
	  </tr>
	</table></td>
	<td width="369" class="Text">经验心得,教程讲座...</td>
	</tr>
	<tr><td height="10" colspan="3"></td></tr>
	<tr><td height="1" colspan="3" bgcolor="#555555"></td></tr>
	<tr><td height="10" colspan="3"></td></tr>
	</table>
	<%
End If
%>
<table width="575" border="0" cellspacing="0" cellpadding="0">
  <tr>
	<td width="555" rowspan="3" valign="top" class="Text">
	<table class="tbl" border="0" cellspacing="0" cellpadding="0">
	<%
	Page = Request("Page")
	If Page = "" Then Page = 1
	
	Call Start_Conn()
	
	SQL_Text = "BBS_Skill 'Title_"&Session("BBS_Order")&"_Time',"&CInt(Session("Nice"))&","&Point&","&CInt(Page)
	rs.Open SQL_Text,Conn,3,1
		
	Max_Page = 1
			
	If Not rs.Eof Then
	
		Notice_Text = "公告"
		Skill_Text = "技术"
		Other_Text = "杂谈"
		Ask_Text = "问答"
	
		Total_Number = rs("Total")
		
		If Total_Number Mod Point = 0 Then
			Max_Page = Total_Number \ Point
		Else
			Max_Page = Total_Number \ Point + 1
		End If
		
		I = 1
				
		Do While Not rs.Eof
			If rs("Title_IsHigh") Then 
				Cls = "High"
			Else
				Cls = "Text"
			End If
			%>
			<tr class="Text" onMouseOver="Title_<%=rs("Title_Id")%>.className='Sign';this.style.background='#444444';" onMouseOut="Title_<%=rs("Title_Id")%>.className='<%=Cls%>';this.style.background='#333333';">
			<td width="20%"><%=FormatDateTime(rs("Title_"&Session("BBS_Order")&"_Time"),1)%></td>
			<td width="65%" class="td" nowrap><div>[<%Execute "Response.Write("&rs("Title_Model")&"_Text)"%>]&nbsp;<a id="Title_<%=rs("Title_Id")%>" href="/BBS/Title.asp?Id=<%=rs("Title_Id")%>" target="_blank" class="<%=Cls%>"><%=rs("Title_Name")%></a><%If rs("Title_IsNice") Then%><span class="Sign">.精</span><%End If%>&nbsp;(<span class="Counter"><%=rs("Title_Reply")%></span>/<span class="Counters"><%=rs("Title_Click")%></span>)</div></td>
			<td width="15%" class="td" nowrap><div><span class="Texts">[</span><span onClick="top.Window('/Help/Title.asp');" class="<%=rs("Title_Player_Title")%>" title="点击查看称号说明"><%=rs("Title_Player_Title")%></span><span class="Texts">]</span> <a href="javascript:;" onClick="top.Window('/Player/Show.asp?Id=<%=rs("Title_Player")%>');" class="High" title="点击查看个人信息"><%=rs("Title_Player_Name")%></a></div></td>
			</tr>
			<%
			I = I +1
			rs.MoveNext
		Loop
		%>
		<tr>
		<td colspan="3">
		<table width="475" cellpadding="0" cellspacing="0">
		<form name="Page_Form" method="get">
		<tr><td align="center" class="Text" height="30">
			<%
			Go = "转到"
			Go_Start = "第"
			Go_End = "页"
			Total_Start = "共"
			Total_End = "篇"
			First_Page = "首页"
			Previous_Page = "上一页"
			Next_Page = "下一页"
			Last_Page = "末页"
			Page_Start = "现在是第"
			Page_End = "页"
			%>　　<%=Total_Start%><span class="Signest">&nbsp;<%=Total_Number%>&nbsp;</span><%=Total_End%>	<%
			If Page<2 Then
				%>&nbsp;&nbsp;<span class="Text"><%=First_Page%></span>&nbsp;|&nbsp;<span class="Text"><%=Previous_Page%></span><%
			Else
				%>&nbsp;&nbsp;<a href="?Page=1" class="High"><%=First_Page%></a>&nbsp;|&nbsp;<a href="?Page=<%=Page-1%>" class="High"><%=Previous_Page%></a><%
			End If
			If Max_Page-Page<1 Then
				%>&nbsp;|&nbsp;<span class="Text"><%=Next_Page%></span>&nbsp;|&nbsp;<span class="Text"><%=Last_Page%></span><%
			Else
				%>&nbsp;|&nbsp;<a href="?Page=<%=Page+1%>" class="High"><%=Next_Page%></a>&nbsp;|&nbsp;<a href="?Page=<%=Max_Page%>" class="High"><%=Last_Page%></a><%
			End If%>&nbsp;&nbsp;<%=Page_Start%>&nbsp;<span class="Signest"><%=Page%></span><span class="Bold">/<%=Max_Page%></span>&nbsp;<%=Page_End%>
		  <select name="Page" class="input-no" onchange="Page_Form.submit()">
			<option><%=Go%></option>
			<%
			For I = 1 To Max_Page
				%><option value="<%=I%>"><%=Go_Start%><%=I%><%=Go_End%></option><%
			Next
			%>
		  </select>
		  </td></tr>
		  </form>
		  </table>
		</td>
		</tr>
		<%
	Else
		%>
		<tr>
		<td class="Sign">还没有任何主题</td>
		</tr>
		<%
	End If
	
	Call End_Conn()
	%>
	</table>	
	</td>
	<td width="20" height="15" align="center" valign="top">
	<%
	If Page = 1 Then
		%><span class="uButton" onMouseOver="Show('Pages');" onMouseOut="Hide('Pages');">▲</span><%
	Else
		%><span class="eButton" onMouseOver="this.className='hButton';Show('Pages');" onMouseOut="this.className='eButton';Hide('Pages');" onClick="location='?Page=<%=Page-1%>'">▲</span><%
	End If
	%>
	</td>
  </tr>
  <tr>
	<td height="470" align="center" valign="top" onMouseOver="Show('Pages');" onMouseOut="Hide('Pages');">
		<table height="<%If Max_Page<>1 Then%><%=(Page-1)/(Max_Page-1)*440%><%End If%>"><tr><td></td></tr></table>
		<span id="Pages" class="Counter" style="display:none; "><%=Page%></span>
	</td>
  </tr>
  <tr>
	<td width="20" height="15" align="center" valign="bottom">
	<%
	If CInt(Page) >= CInt(Max_Page) Then
		%><span class="uButton" onMouseOver="Show('Pages');" onMouseOut="Hide('Pages');">▼</span><%
	Else
		%><span class="eButton" onMouseOver="this.className='hButton';Show('Pages');" onMouseOut="this.className='eButton';Hide('Pages');" onClick="location='?Page=<%=Page+1%>'">▼</span><%
	End If
	%></td>
  </tr>
</table>
<script language="javascript">
function BBS_Refresh()
{
	try{top.BBS_Frame.location=top.BBS_Frame.location;}catch(e){}
}
BBS_Refreshing=setInterval('BBS_Refresh()',60000);
</script>
</body>
</html>
<%
Sub Get_Input()

	If Request("Order")<>"" Then
		Session("BBS_Order") = Request("Order")
	End If
	If Session("BBS_Order") = "" Then Session("BBS_Order") = "Post"
	
End Sub
%>
