<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-16
'------------------------
Point = 5
%>
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
<!--#include virtual="/Models/Include/ShowHide.asp"-->
<!--#include virtual="/Models/Include/NoHtml.asp"-->
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
.Text {word-break: break-word !important;}
-->
</style>
<link href="/Models/Css/2008.css" rel="stylesheet" type="text/css">
</head>
<body onLoad="parent.document.getElementById('Comment').style.display='block';loadframe()">
<table width="380" border="0" cellspacing="5" cellpadding="0">
  <tr>
    <td width="370" rowspan="3" valign="top" class="Text">
	<%
	If Request("Id")<>"" Then Session("Comment_Video") = Request("Id")
	Page = Request("Page")

	Call Start_Conn()
	
	SQL_Text = "Video_Read "&Session("Comment_Video")
	rs.Open SQL_Text,Conn,3,1
	
	Video_Owner = CInt(rs("Video_Player"))
	
	Call End_Conn()

	Call Start_Conn()
	
	SQL_Text = "Video_Comment_List "&Session("Comment_Video")&","&Point&","&CInt(Page)
	rs.Open SQL_Text,Conn,3,1
		
	Max_Page = 1
			
	If Not rs.Eof Then
	
		Total_Number = rs("Total")
		
		If Total_Number =1 Then
			Comment_Height = 26
		Else
			If Total_Number>5 Then
				Comment_Height = 210
			Else
				Comment_Height = (Video_Comment) * 20 - 30
			End If
		End If

		If Total_Number Mod Point = 0 Then
			Max_Page = Total_Number \ Point
		Else
			Max_Page = Total_Number \ Point + 1
		End If
	
		Do While Not rs.Eof
			%><span class="Texts">[</span><span onClick="top.Window('/Help/Title.asp');" class="<%=rs("Comment_Player_Title")%>" title="点击查看称号说明"><%=rs("Comment_Player_Title")%></span><span class="Texts">]</span> <a href="javascript:;" onClick="top.Window('/Player/Show.asp?Id=<%=rs("Comment_Player")%>');" title="点击查看个人信息"class="High"><%=rs("Comment_Player_Name")%></a> 于<%=FormatDateTime(rs("Comment_Time"),1)%>发表评论：
			<%If Video_Owner = Session("Player_Id") Or Session("Player_IsMaster") Then%>[<a href="Action/Comment_Del_Action.asp?Id=<%=rs("Comment_Id")%>" target="Action" class="High">删除</a>]<%End If%>
			<br><span class="Text"><%=NoHtml(rs("Comment_Text"))%></span><br><%
			rs.MoveNext
		Loop		
		
	End If
	
	Call End_Conn()
	%>
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
    <td height="<%=Comment_Height%>" align="center" valign="top" onMouseOver="Show('Pages');" onMouseOut="Hide('Pages');">
		<table height="<%If Max_Page<>1 Then%><%=(Page-1)/(Max_Page-1)*(Comment_Height-26)%><%End If%>"><tr><td></td></tr></table>
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
<script>
function loadframe()
{
	iframe=parent.document.getElementById('Comment_Frame');
	//iframe=$(o);
	if(iframe && !window.opera)
	{
	   if(iframe.contentDocument && iframe.contentDocument.body.offsetHeight)
	   {
		iframe.height = iframe.contentDocument.body.offsetHeight;//设置iframe在火狐下高度
	   }
	   else if (iframe.Document && iframe.Document.body.scrollHeight)
	   {
		iframe.height = iframe.Document.body.scrollHeight+5;//设置iframe在ie下的高度
	   }
	   
	}
	if(iframe.height==1)
	{setTimeout("loadframe()",1000)}
		else{parent.Window_Load();}
}
</script>
</body>
</html>
