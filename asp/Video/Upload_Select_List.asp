<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-31
'------------------------
Dim Model
Point = 10
%>
<!--#include virtual="/Player/Check.asp"-->
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
<!--#include virtual="/Models/Include/ShowHide.asp"-->
<%
Call Check()
Call Get_Input()

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
		If Model <> "" Then Session("Model") = Model

		Call Start_Conn()
		
		Set cmd = Server.CreateObject("ADODB.Command")
		Set cmd.ActiveConnection = Conn
		cmd.CommandText = "dbo.Player_Record_"&Session("Model")
		cmd.CommandType = &H0004
		
		cmd.Parameters.Append cmd.CreateParameter("@Player_Id",3)
		cmd.Parameters.Append cmd.CreateParameter("@Record_Score",5,2)
		cmd.Parameters.Append cmd.CreateParameter("@Record_3BVS",5,2)
		cmd.Parameters.Append cmd.CreateParameter("@Record_Score_NF",5,2)
		cmd.Parameters.Append cmd.CreateParameter("@Record_3BVS_NF",5,2)
		
		cmd("@Player_Id") = Session("Player_Id")
		cmd.execute
		
		Record_Score = cmd("@Record_Score")
		Record_3BVS = cmd("@Record_3BVS")
		Record_Score_NF = cmd("@Record_Score_NF")
		Record_3BVS_NF = cmd("@Record_3BVS_NF")
		
		Set cmd = Nothing
		
		Call End_Conn()

		Call Start_Conn()
		
		Beg_Text = "初级"
		Int_Text = "中级"
		Exp_Text = "高级"
		
		SQL_Text = "Video_Upload_Select "&Session("Player_Id")&",'"&Session("Model")&"'"&","&Point&","&CInt(Page)
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
				%><tr style="cursor: pointer " onMouseOver="this.style.background='#555555';" onMouseOut="this.style.background='#444444';" onClick="<%If FormatNumber(rs("Video_Score"),2)=FormatNumber(Record_Score,2) Or rs("Video_Score")=Record_Score_NF Or rs("Video_3BVS")=Record_3BVS Or rs("Video_3BVS")=Record_3BVS_NF Then%>alert('不能替换自己现有的纪录!');<%Else%>top.Window('/Video/Upload_Input.asp?Model=<%=Session("Model")%>&Id=<%=rs("Video_Id")%>');<%End If%>">
				<td class="Text" height="20">
				<span class="<%=rs("Video_Model")%>"><%Execute "Response.Write("&rs("Video_Model")&"_Text)"%></span> <span class="Title"><%=FormatNumber(rs("Video_Score"),2)%></span><%If rs("Video_IsNoFrag") Then%><span class="Counter">NF</span><%End If%>
				<span class="Counters">3BV=</span><span class="Counter"><%=CInt(rs("Video_3BV"))%></span> <span class="Counters">3BV/s=</span><span class="Counter"><%=FormatNumber(rs("Video_3BVS"),2,True)%></span>
				</td>
				<td width="90" class="Text">
				<%If rs("Video_IsFreeze") Then%><span class="Sign">已冻结!</span><%Else%><%If rs("Video_Check") Then%>评论&nbsp;<span class="High"><%=CLng(rs("Video_Comment"))%></span>&nbsp;条<%Else%><span class="Sign">未审核!</span><%End If%><%End If%>
				</td>
				<td width="100" class="Text">
				<%=FormatDateTime(rs("Video_Time"),2)%>
				</td>
				</tr><%
				rs.MoveNext
			Loop		
			
		End If
		
		Call End_Conn()
		%>
		</table>
		</td>
		<td width="25" height="15" align="center" valign="top">
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

Sub Get_Input()

	Model = Trim(Request("Model"))
	
End Sub
%>