<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-14
'------------------------
Point = 22
%>
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
<!--#include virtual="/Models/Include/ShowHide.asp"-->
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
<link href="/Models/Css/2008.css?v=20220423" rel="stylesheet" type="text/css">
</head>
<body onLoad="parent.document.getElementById('Video').style.display='block';">
<table width="575" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="555" rowspan="3" valign="top" class="Text">
	<table class="tbl" width="555" border="0" cellspacing="0" cellpadding="0">
	<%
	Page = Request("Page")
	
	Call Start_Conn()
	
	SQL_Text = "Video_New_Man "&Point&","&CInt(Page)
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
			<td><%If rs("Video_Check") Then%>评论&nbsp;<span class="High"><%=CLng(rs("Video_Comment"))%></span>&nbsp;条<%Else%><span class="Sign">未审核!</span><%End If%></td></tr><%
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
		%><span class="eButton" onMouseOver="this.className='hButton';Show('Pages');" onMouseOut="this.className='eButton';Hide('Pages');" onClick="location='?Page=<%=Page-1%>'">▲</span><%
	End If
	%>
	</td>
  </tr>
  <tr>
    <td height="490" align="center" valign="top" onMouseOver="Show('Pages');" onMouseOut="Hide('Pages');">
		<table height="<%If Max_Page<>1 Then%><%=(Page-1)/(Max_Page-1)*490%><%End If%>"><tr><td></td></tr></table>
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
function Video_Refresh()
{
	try{top.Video_Frame.location=top.Video_Frame.location;}catch(e){}
}
Video_Refreshing=setInterval('Video_Refresh()',60000);
</script>
</body>
</html>
