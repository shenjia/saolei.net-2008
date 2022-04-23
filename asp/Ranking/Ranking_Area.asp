<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-25
'------------------------
Point = 20
%>
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
<!--#include virtual="/Models/Include/ShowHide.asp"-->
<!--#include virtual="/Models/Include/Bar.asp"-->
<%
Call Get_Input()
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
<link href="/Models/Css/2008.css?v=20220423" rel="stylesheet" type="text/css">
</head>
<body onLoad="parent.document.getElementById('Ranking').style.display='block';">
<table width="575" border="0" cellspacing="0" cellpadding="0">
  <tr>
	<td width="555" rowspan="3" valign="top" class="Text">
	<table class="tbl" border="0" cellspacing="0" cellpadding="0">
	<tr class="Title">
		<td width="60" align="center">排名</td>
		<td width="50" align="center">地区</td>
		<td width="100" align="center"><a href="?By=Area_Best_Rank" class="<%If Session("Area_By") = "Area_Best" Then%>Signest<%Else%>Title<%End If%>">领军人物</a></td>
		<td width="60" align="center"><a href="?By=Area_Players" class="<%If Session("Area_By") = "Area_Players" Then%>Signest<%Else%>Title<%End If%>">排行人数</a></td>
		<td width="80" align="center"><a href="?By=Area_Average" class="<%If Session("Area_By") = "Area_Average" Then%>Signest<%Else%>Title<%End If%>">平均排行</a></td>
		<td width="160" align="center"><a href="?By=Area_Power" class="<%If Session("Area_By") = "Area_Power" Then%>Signest<%Else%>Title<%End If%>">综合排行指数</a></td>
		<td width="40"></td>
	</tr>
	<%
	Page = Request("Page")
	If Page = "" Then Page = 1
	
	Call Start_Conn()
	
	SQL_Text = "Ranking_Area '"&Session("Area_By")&"',"&Point&","&CInt(Page)
	rs.Open SQL_Text,Conn,3,1
		
	Max_Page = 1
			
	If Not rs.Eof Then
	
		Total_Number = rs("Total")
		Best_Power = CLng(rs("Best_Power"))
		
		If Total_Number Mod Point = 0 Then
			Max_Page = Total_Number \ Point
		Else
			Max_Page = Total_Number \ Point + 1
		End If
		
		I = 1
				
		Do While Not rs.Eof
			%>
			<tr height="25px" class="Text" onMouseOver="this.style.background='#444444';" onMouseOut="this.style.background='#333333';">
			<td class="Bold" align="center">第<span class="Sign">&nbsp;<strong><%=CInt(Page-1)*Point+I%></strong>&nbsp;</span>位</td>
			<td align="center"><a href="/Ranking/Ranking_Areas.asp?By=Player_Sum_Time_Score&Area=<%=rs("Area_Name")%>" class="<%If Session("Player_Area") = rs("Area_Name") Then%>Sign<%Else%>High<%End If%>"><%=rs("Area_Name")%></a></td>
			<td align="center"><span class="Texts">[</span><span onClick="top.Window('/Help/Title.asp');" class="<%=rs("Area_Best_Title")%>" title="点击查看称号说明"><%=rs("Area_Best_Title")%></span><span class="Texts">]</span><a href="javascript:void(0); " onClick="top.Window('/Player/Show.asp?Id=<%=rs("Area_Best_Id")%>');" class="High" title="点击查看个人信息"><%=rs("Area_Best_Player")%></a></td>
			<td align="center"><span class="<%If Session("Player_Area") = rs("Area_Name") Or Session("Area_By") = "Area_Players" Then%>Signest<%Else%>Bold<%End If%>"><%=CInt(rs("Area_Players"))%></span>&nbsp;人</td>
			<td align="center"><span class="<%If Session("Player_Area") = rs("Area_Name") Or Session("Area_By") = "Area_Average" Then%>Signest<%Else%>Bold<%End If%>"><%=rs("Area_Average")%></span>&nbsp;位</td>
			<td align="center"><%Call Bar("Power_"&I,CLng(rs("Area_Power")),Best_Power,160,10)%></td>
			<td class="<%If Session("Player_Area") = rs("Area_Name") Or Session("Area_By") = "Area_Power" Then%>Counter<%Else%>Counters<%End If%>" align="center"><%=rs("Area_Power")%></td>
			</tr>
			<%
			I = I +1
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
		%><span class="eButton" onMouseOver="this.className='hButton';Show('Pages');" onMouseOut="this.className='eButton';Hide('Pages');" onClick="location='?Page=<%=Page+1%>'">▼</span><%
	End If
	%></td>
  </tr>
</table>
<table width="475" cellpadding="0" cellspacing="0">
<form name="Page_Form" method="get">
<tr><td align="center" class="Text" height="30">
	<%
	Go = "转到"
	Go_Start = "第"
	Go_End = "页"
	Total_Start = "共"
	Total_End = "位"
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
<script language="javascript">
function Ranking_Refresh()
{
	try{top.Ranking_Frame.location=top.Ranking_Frame.location;}catch(e){}
}
Ranking_Refreshing=setInterval('Ranking_Refresh()',60000);
</script>
</body>
</html>
<%

Sub Get_Input()

	If Request("By")<>"" Then
		Session("Area_By") = Request("By")
	End If
	If Session("Area_By") = "" Then Session("Area_By") = "Area_Power"
	
End Sub
%>
