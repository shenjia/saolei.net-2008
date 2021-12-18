<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-14
'------------------------
Point = 21
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
<link href="/Models/Css/2008.css?v=20211218" rel="stylesheet" type="text/css">
</head>
<body onLoad="parent.document.getElementById('Video').style.display='block';">
<table width="575" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="555" rowspan="3" valign="top" class="Text">
	<table width="555" border="0" cellspacing="0" cellpadding="0">
	<%
	Page = Request("Page")
	If Page = "" Then Page = 1
	If Request("Id") <> "" Then Session("Video_Player") = Request("Id")
	If Request("Save") <> "1" Then
		Session("Order") = Request("Order")
		Session("BV") = Request("BV")
	End If
	If Session("Order") = "" Then Session("Order")="Time"
	If Session("BV") = "" Then Session("BV")="0"
	BV = Session("BV")
	
	Select Case Session("Order")
		Case "Time"
			OrderBy = "Video_Time"
			Order = 1
		Case "Score"
			OrderBy = "Video_Score"
			Order = 0
		Case "3BV"
			OrderBy = "Video_3BV"
			Order = 1
		Case "3BVS"
			OrderBy = "Video_3BVS"
			Order = 1
		Case "Comment"
			OrderBy = "Video_Comment"
			Order = 1
		Case Else
			Session("Order") = "Time"
			OrderBy = "Video_Time"
			Order = 1
	End Select
	
	Call Start_Conn()
	
	SQL_Text = "Video_Exp '"&OrderBy&"','"&CINt(BV)&"',"&Order&","&Point&","&CInt(Page)
	rs.Open SQL_Text,Conn,3,1
		
	Max_Page = 1
			
	If Not rs.Eof Then
	
		Total_Number = rs("Total")
		
		If Total_Number Mod Point = 0 Then
			Max_Page = Total_Number \ Point
		Else
			Max_Page = Total_Number \ Point + 1
		End If
		
		Beg_Text = "初级"
		Int_Text = "中级"
		Exp_Text = "高级"
		I = 1
		
		Do While Not rs.Eof
			If rs("Player_Sex") Then
				Player_Sex_Text = "GG"
			Else
				Player_Sex_Text = "mm"
			End If
			If rs("Video_Hero") Then
				Video_Text="<span class=World1>【神界】</span>"
			Else
				Video_Text="<span class=World2>【人界】</span>"
			End If
			%><tr class="Text" onMouseOver="Video_<%=I%>.className='Signest';BV_<%=I%>.className='Signest';BVS_<%=I%>.className='Signest';this.style.background='#444444';" onMouseOut="Video_<%=I%>.className='Title';BV_<%=I%>.className='Title';BVS_<%=I%>.className='Title';this.style.background='#333333';">
			<td width="24%" class="td" nowrap><%=FormatDateTime(rs("Video_Time"),1)%>&nbsp;<%=FormatDateTime(rs("Video_Time"),4)%></td>
			<td width="27%" class="td" nowrap><div><%=Video_Text%><span class="Texts">[</span><span onClick="top.Window('/Help/Title.asp');" class="<%=rs("Video_Title")%>" title="点击查看称号说明"><%=rs("Video_Title")%></span><span class="Texts">]</span> <a href="javascript:;" onClick="top.Window('/Player/Show.asp?Id=<%=rs("Video_Player")%>');" class="High" title="点击查看个人信息"><%=rs("Video_Player_Name")%></a><span class="Counter"><%=Player_Sex_Text%></span></div></td>
			<td width="10%" class="td" nowrap><span class="Text">3BV=</span><span id="BV_<%=I%>" class="Title"><%=CInt(rs("Video_3BV"))%></span></td>
			<td width="13%" class="td" nowrap><span class="Text">3BV/s=</span><span id="BVS_<%=I%>" class="Title"><%=FormatNumber(rs("Video_3BVS"),2,True)%></span></td>
			<td width="15%" class="td" nowrap><span class="<%=rs("Video_Model")%>"><%Execute "Response.Write("&rs("Video_Model")&"_Text)"%></span> <a href="javascript:;" onClick="top.Window('/Video/Show.asp?Id=<%=rs("Video_Id")%>&tmp='+Math.random());" class="Title" id="Video_<%=I%>" title="点击查看录像"><%=FormatNumber(rs("Video_Score"),2)%></a><%If rs("Video_IsNoFrag") Then%><span class="Counter">NF</span><%End If%></td>
			<td><%If rs("Video_IsFreeze") Then%><span class="Sign">已冻结!</span><%Else%><%If rs("Video_Check") Then%>评论&nbsp;<span class="High"><%=CLng(rs("Video_Comment"))%></span>&nbsp;条<%Else%><span class="Sign">未审核!</span><%End If%><%End If%></td></tr><%
			I = I + 1
			rs.MoveNext
		Loop		
		
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
		%><span class="eButton" onMouseOver="this.className='hButton';Show('Pages');" onMouseOut="this.className='eButton';Hide('Pages');" onClick="location='?Page=<%=Page-1%>&Save=1'">▲</span><%
	End If
	%>
	</td>
  </tr>
  <tr>
    <td height="490" align="center" valign="top" onMouseOver="Show('Pages');" onMouseOut="Hide('Pages');">
		<table height="<%If Max_Page<>1 Then%><%=(Page-1)/(Max_Page-1)*460%><%End If%>"><tr><td></td></tr></table>
		<span id="Pages" class="Counter" style="display:none; "><%=Page%></span>
	</td>
  </tr>
  <tr>
    <td width="20" height="15" align="center" valign="bottom">
	<%
	If CInt(Page) >= CInt(Max_Page) Then
		%><span class="uButton" onMouseOver="Show('Pages');" onMouseOut="Hide('Pages');">▼</span><%
	Else
		%><span class="eButton" onMouseOver="this.className='hButton';Show('Pages');" onMouseOut="this.className='eButton';Hide('Pages');" onClick="location='?Page=<%=Page+1%>&Save=1'">▼</span><%
	End If
	%></td>
  </tr>
</table><table width="575" cellpadding="0" cellspacing="0">
<form name="Page_Form" method="get">
<tr><td align="center" class="Text" height="30">
	<%
	Go = "转到"
	Go_Start = "第"
	Go_End = "页"
	Total_Start = "共"
	Total_End = "个录像"
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
		%>&nbsp;&nbsp;<a href="?Page=1&Save=1" class="High"><%=First_Page%></a>&nbsp;|&nbsp;<a href="?Page=<%=Page-1%>&Save=1" class="High"><%=Previous_Page%></a><%
	End If
	If Max_Page-Page<1 Then
		%>&nbsp;|&nbsp;<span class="Text"><%=Next_Page%></span>&nbsp;|&nbsp;<span class="Text"><%=Last_Page%></span><%
	Else
		%>&nbsp;|&nbsp;<a href="?Page=<%=Page+1%>&Save=1" class="High"><%=Next_Page%></a>&nbsp;|&nbsp;<a href="?Page=<%=Max_Page%>&Save=1" class="High"><%=Last_Page%></a><%
	End If%>&nbsp;&nbsp;<%=Page_Start%>&nbsp;<span class="Signest"><%=Page%></span><span class="Bold">/<%=Max_Page%></span>&nbsp;<%=Page_End%>
	<input name="Save" type="hidden" value="1">
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
<script language="javascript">
function Video_Refresh()
{
	try{top.Video_Frame.location=top.Video_Frame.location;}catch(e){}
}
Video_Refreshing=setInterval('Video_Refresh()',60000);
</script>
</body>
</html>
