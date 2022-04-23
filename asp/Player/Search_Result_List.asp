<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-31
'------------------------
Point = 10
%>
<!--#include virtual="/Player/Check.asp"-->
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
<!--#include virtual="/Models/Include/ShowHide.asp"-->
<%
Call Check()

If Check_Result <> "Fail" Then
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
		background-color: #444444;
	}
	-->
	</style>
	<link href="/Models/Css/2008.css?v=20220423" rel="stylesheet" type="text/css">
	</head>
	<body onLoad="parent.List.style.display='';">
	<table width="400" border="0" cellspacing="5" cellpadding="0">
	  <tr>
		<td width="390" rowspan="3" valign="top" class="Text">
		<table width="370" border="0" cellspacing="0" cellpadding="0">
		<%
		Page = Request("Page")

		Call Start_Conn()
		
		Beg_Text = "初级"
		Int_Text = "中级"
		Exp_Text = "高级"
		
		SQL_Text = "Player_Search '"&Session("Search_Player_Id")&"','"&Session("Search_Player_Name")&"','"&Session("Search_Player_Name_Chinese")&"','"&Session("Search_Player_Name_English")&"','"&Session("Search_Player_Name_Net")&"','"&Session("Search_Player_Area")&"','"&Session("Search_Player_QQ")&"','"&Session("Search_Player_Email")&"','"&Session("Search_Player_Text")&"','"&Session("Search_Player_IP")&"',"&Point&","&CInt(Page)
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
				If rs("Player_IsHero") Then
					Rank_Text="<span class=World1>【神界】</span>"
				Else
					Rank_Text="<span class=World2>【人界】</span>"
				End If
				If rs("Player_Sex") Then
					Player_Sex_Text = "GG"
				Else
					Player_Sex_Text = "mm"
				End If
				%><tr title="最近登录IP：<%=rs("Player_IP")%>" style="cursor: pointer " onMouseOver="this.style.background='#555555';" onMouseOut="this.style.background='#444444';" onClick="window.open('/Player/Index.asp?Id=<%=rs("Player_Id")%>');">
				<td class="Text" height="20">
				<%=Rank_Text%><span class="Texts">[</span><span class="<%=rs("Player_Title")%>"><%=rs("Player_Title")%></span><span class="Texts">]</span> <span class="High"><%=rs("Player_Name_Chinese")%></span>
				<span class="Title"><%=rs("Player_Area")%></span><span class="Counter"><%=Player_Sex_Text%></span>				
				</td>
				<td width="100" class="Text">
				<%=FormatDateTime(rs("Player_Register_Time"),1)%>
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
		<td height="210" align="center" valign="top" onMouseOver="Show('Pages');" onMouseOut="Hide('Pages');">
			<table height="<%If Max_Page<>1 Then%><%=(Page-1)/(Max_Page-1)*184%><%End If%>"><tr><td></td></tr></table>
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
	</body>
	<iframe name="Action" style="display: none"></iframe>
	</html>
	<%
End If
%>