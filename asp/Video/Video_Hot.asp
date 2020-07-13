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
	<table width="290" border="0" cellspacing="0" cellpadding="0">
	<%
	Call Start_Conn()
	
	SQL_Text = "Video_Hot "&Point
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
			%><tr class="Text" onMouseOver="Video_<%=I%>.className='Signest';this.style.background='#444444';" onMouseOut="Video_<%=I%>.className='Title';this.style.background='#333333';">
			<td width="80%" nowrap><div><span class="Texts">[</span><span onClick="top.Window('/Help/Title.asp');" class="<%=rs("Video_Title")%>" title="点击查看称号说明"><%=rs("Video_Title")%></span><span class="Texts">]</span> <a href="javascript:;" onClick="top.Window('/Player/Show.asp?Id=<%=rs("Video_Player")%>');" class="High" title="点击查看个人信息"><%=rs("Video_Player_Name")%></a>&nbsp;
			<span class="<%=rs("Video_Model")%>"><%Execute "Response.Write("&rs("Video_Model")&"_Text)"%></span> <a href="javascript:;" onClick="top.Window('/Video/Show.asp?Id=<%=rs("Video_Id")%>&tmp='+Math.random());" class="Title" id="Video_<%=I%>" title="点击查看录像"><%=FormatNumber(rs("Video_Score"),2)%></a><%If rs("Video_IsNoFrag") Then%><span class="Counter">NF</span><%End If%>&nbsp;
			(<span class="Title"><%=CLng(rs("Video_Comment"))%></span>评论)
			</div></td>
			<td width="20%" class="td" nowrap><%=Month(rs("Video_Time"))%>-<%=Day(rs("Video_Time"))%></td></tr>
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
