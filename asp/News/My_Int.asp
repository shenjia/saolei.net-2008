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
<body onLoad="parent.document.getElementById('News').style.display='block';">
<table width="575" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="555" rowspan="3" valign="top" class="Text">
	<table width="555" border="0" cellspacing="0" cellpadding="0">
	<%
	If Request("Id")<>"" Then Session("News_Player") = Request("Id")
	Page = Request("Page")
	
	Call Start_Conn()
	
	SQL_Text = "News_My_Int "&Session("News_Player")&","&Point&","&CInt(Page)
	rs.Open SQL_Text,Conn,3,1
		
	Max_Page = 1
			
	If Not rs.Eof Then
	
		Total_Number = rs("Total")
		
		If Total_Number Mod Point = 0 Then
			Max_Page = Total_Number \ Point
		Else
			Max_Page = Total_Number \ Point + 1
		End If
	
		Do While Not rs.Eof
			If rs("Player_Sex") Then
				Player_Sex_Text = "GG"
			Else
				Player_Sex_Text = "mm"
			End If
			If rs("News_Hero") Then
				News_Rank_Text="<span class=World1>【神界】</span>"
			Else
				News_Rank_Text="<span class=World2>【人界】</span>"
			End If
			%><tr class="Text" onMouseOver="this.style.background='#444444';" onMouseOut="this.style.background='#333333';">
			<td width="135"><%=FormatDateTime(rs("News_Time"),1)%>&nbsp;<%=FormatDateTime(rs("News_Time"),4)%></td>
			<td><%=News_Rank_Text%><span class="Texts">[</span><span onClick="top.Window('/Help/Title.asp');" class="<%=rs("News_Player_Title")%>" title="点击查看称号说明"><%=rs("News_Player_Title")%></span><span class="Texts">]</span> <a href="javascript:;" onClick="top.Window('/Player/Show.asp?Id=<%=rs("News_Player")%>');" title="点击查看个人信息"class="High"><%=rs("News_Player_Name")%></a><span class="Counter"><%=Player_Sex_Text%></span> 将<%=rs("News_Model")%><%=rs("News_Thing")%>记录刷新为 <a href="javascript:;" onClick="top.Window('/Video/Show.asp?Id=<%=rs("News_Video")%>');" title="点击查看录像" class="Highest"><%=FormatNumber(rs("News_Score"),2,True)%></a> <span class="Signest">↑<%=FormatNumber(rs("News_Grow"),2,True)%></span>
			</td></tr><%
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
    <td height="267" align="center" valign="top" onMouseOver="Show('Pages');" onMouseOut="Hide('Pages');">
		<table height="<%If Max_Page<>1 Then%><%=(Page-1)/(Max_Page-1)*230%><%End If%>"><tr><td></td></tr></table>
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
function News_Refresh()
{
	try{top.News_Frame.location=top.News_Frame.location;}catch(e){}
}
News_Refreshing=setInterval('News_Refresh()',120000);
</script>
</body>
</html>
