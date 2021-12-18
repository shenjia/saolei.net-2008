<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-17
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
	<link href="/Models/Css/2008.css?v=20211218" rel="stylesheet" type="text/css">
	</head>
	<body onLoad="parent.document.getElementById('Box').style.display='';">
	<table width="400" border="0" cellspacing="5" cellpadding="0">
	  <tr>
		<td width="390" rowspan="3" valign="top" class="Text">
		<table width="370" border="0" cellspacing="0" cellpadding="0">
		<%
		Page = Request("Page")
	
		Call Start_Conn()
		
		SQL_Text = "Message_List "&Session("Player_Id")&","&Point&","&CInt(Page)
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
				%><tr style="cursor: pointer " onMouseOver="this.style.background='#555555';" onMouseOut="this.style.background='#444444';" onClick="parent.location='/Message/Show.asp?Id=<%=rs("Message_Id")%>';">
				<td class="Text" height="20">　<span class="Texts">[</span><span class="<%=rs("Player_Title")%>"><%=rs("Player_Title")%></span><span class="Texts">]</span> <span class="High"><%=rs("Player_Name")%></span> 于<%=FormatDateTime(rs("Message_Time"),1)%>发来短消息
				　<%If Not rs("Message_Read") Then%><span class="Sign">未读!</span><%Else%>已读<%End If%>
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