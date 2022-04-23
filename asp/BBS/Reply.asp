<%
'------------------------
'Code:Zhang Shen Jia
'Date:2008-1-1
'------------------------
Dim Title_Id
%>
<!--#include virtual="/Models/Common/Error.asp"-->
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
<!--#include virtual="/Models/Common/Function.asp"-->
<!--#include virtual="/Models/Include/UBB.asp"-->
<%
Call Get_Input()

Call Start_Conn()

SQL_Text = "Title_Read "&CLng(Title_Id)
rs.Open SQL_Text,Conn,3,1

If rs.Eof Then

	Message = "该主题不存在!"
	Act="top.location='/BBS/Index.asp'"
	Call Error()

Else

	Title_Name = rs("Title_Name")
	Session("Title_Name") = Title_Name
	Title_Click = rs("Title_Click")
	Title_Reply = rs("Title_Reply")
	Title_IsNice = rs("Title_IsNice")
	Title_IsHigh = rs("Title_IsHigh")
	Title_Player = rs("Title_Player")
	Title_Model = rs("Title_Model")
	Title_Post_Time = rs("Title_Post_Time")
	Title_Edit_Time = rs("Title_Edit_Time")
	Title_Click = rs("Title_Click")
	Title_Reply = rs("Title_Reply")
	Title_Player_Name = rs("Title_Player_Name_Chinese")
	Title_Player_Title = rs("Title_Player_Title")
	
	Call End_Conn()

	If Title_IsHigh Then 
		Cls = "Title"
	Else
		Cls = "High"
	End If
	%>
	<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<META name="description" content="<%=Meta_Description%>">
	<META name="keywords" content="<%=Meta_Keywords%>">
	<title><%=Title_Name%><%=HTML_Title%></title>
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
	<link href="/Models/Css/2008.css?v=20220423" rel="stylesheet" type="text/css">
	</head>
	<body onLoad="Top(5);">
	<!--#include virtual="/Models/Include/Top.asp"-->
	<table width="910" border="0" align="center" cellpadding="0" cellspacing="1">
	  <tr>
		<td width="604" height="500" valign="top">
		<%
			Notice_Text = "公告"
			Skill_Text = "技术"
			Other_Text = "杂谈"
			Ask_Text = "问答"
			%>
			<table width="604" border="0" cellpadding="0" cellspacing="0">
			<tr height="25">
			<td>
				<table border="0" cellpadding="0" cellspacing="0">
				<tr>
				<td>
					<table border="0" cellpadding="0" cellspacing="1" bgcolor="#444444">
					<tr align="center" height="25">
					<td width="15"></td>
					<td class="Text">[<%Execute "Response.Write("&Title_Model&"_Text)"%>]<span class="<%=Cls%>"><%=Title_Name%></span><%If Title_IsNice Then%><span class="Sign">.精</span><%End If%>&nbsp;(<span class="Counter"><%=Title_Reply%></span>/<span class="Counters"><%=Title_Click%></span>)</td>
					<td width="15"></td>
					</tr>
					</table>
				</td>
				<td>
					<table border="0" cellpadding="0" cellspacing="0">
					<tr>
					<td class="Text">
					　<span class="Texts">[</span><span onClick="top.Window('/Help/Title.asp');" class="<%=Title_Player_Title%>" title="点击查看称号说明"><%=Title_Player_Title%></span><span class="Texts">]</span> <a href="javascript:;" onClick="top.Window('/Player/Show.asp?Id=<%=Title_Player%>');" class="High" title="点击查看个人信息"><%=Title_Player_Name%></a>
					发表于
					<%=FormatDateTime(Title_Post_Time,1)%>
					</td>
					</tr>
					</table>
				</td>
				</tr>
				</table>
			</td>
			</tr>
			</table>
			<table width="595" border="0" cellpadding="10" cellspacing="1" bgcolor="#666666">
			<tr bgcolor="#333333">
			<td height="555" valign="top">
				<div id="BBS" style="display:yes ">
				<iframe name="BBS_Frame" frameborder="0" width="575" height="555" scrolling="no" src="/BBS/Reply_Box.asp?Id=<%=Title_Id%>"></iframe>
				</div>
			</td>
			</tr>
			</table>
			<table width="604" border="0" cellpadding="0" cellspacing="0">
			<tr height="10"><td></td></tr>
			</table>
			</td>
		<td width="304" valign="top">
			<table border="0" cellpadding="0" cellspacing="1" bgcolor="#444444">
			  <tr align="center" height="25">
				<td width="100" class="High" bgcolor="#444444">楼主信息</td>
			  </tr>
			</table>
			<table width="303" border="0" cellpadding="5" cellspacing="1" bgcolor="#666666">
			  <tr bgcolor="#333333">
				<td height="195" valign="top" class="Text">
				<div id="Info" style="display:none ">
				<iframe name="Info_Frame" frameborder="0" width="280" height="175" scrolling="no" src="/Player/Poster.asp?Id=<%=Title_Player%>"></iframe>
				</div>
				</td>
			  </tr>
			</table>
		</td>
	  </tr>
	</table>
	<!--#include virtual="/Models/Include/Bottom.asp"-->
	<iframe name="Action" style="display: none"></iframe>
	</body>
	</html>
<%
End If

Sub Get_Input()

	Title_Id = Request("Id")
		
End Sub
%>
