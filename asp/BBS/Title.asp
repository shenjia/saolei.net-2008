<%
'------------------------
'Code:Zhang Shen Jia
'Date:2008-1-1
'------------------------
Dim Title_Id
Point = 10
%>
<!--#include virtual="/Models/Common/Error.asp"-->
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
<!--#include virtual="/Models/Common/Function.asp"-->
<!--#include virtual="/Models/Include/UBB.asp"-->
<%
Call Get_Input()
Call Check_Input()

If Message = "No" Then
	
	Call Start_Conn()
	
	SQL_Text = "Title_Check "&CLng(Title_Id)
	rs.Open SQL_Text,Conn,3,1
	
	If rs.Eof Then
	
		Message = "该主题不存在!"
		Act="top.location='/BBS/Index.asp'"
		Call Error()
	
	Else
	
		Title_Get_Id = CLng(rs("Title_Get_Id"))
		Title_Name = rs("Title_Name")
		Session("Title_Name") = Title_Name
		Title_IsNice = rs("Title_IsNice")
		Title_IsHigh = rs("Title_IsHigh")
		Title_IsLock = rs("Title_IsLock")
		Title_Player = rs("Title_Player")
		Session("Title_Poster") = Title_Player			
		
		Call End_Conn()
		
		If Title_Get_Id <> 0 Then Response.Redirect("/BBS/Title.asp?Id="&Title_Get_Id)
	
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
		<title><%=Title_Name%><%=Site_Name%></title>
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
		<link href="/Models/Css/2008.css" rel="stylesheet" type="text/css">
		</head>
		<body onLoad="Top(5);">
		<!--#include virtual="/Models/Include/Top.asp"-->
		<table width="910" border="0" align="center" cellpadding="0" cellspacing="1">
		  <tr>
			<td width="604" height="500" valign="top">
			<%
			If Session("Title_Page")=1 Then
			
				Notice_Text = "公告"
				Skill_Text = "技术"
				Other_Text = "杂谈"
				Ask_Text = "问答"
				
				Call Start_Conn()
				
				SQL_Text = "Title_Read "&CLng(Title_Id)
				rs.Open SQL_Text,Conn
				Title_Text = UBB(rs("Title_Text"))
				Title_Model = rs("Title_Model")
				Title_Post_Time = rs("Title_Post_Time")
				Title_Edit_Time = rs("Title_Edit_Time")
				Title_Click = rs("Title_Click")
				Title_Reply = rs("Title_Reply")
				Title_Player_Name = rs("Title_Player_Name_Chinese")
				Title_Player_Title = rs("Title_Player_Title")
				
				Call End_Conn()
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
				<td valign="top">
				<table border="0" cellpadding="0" cellspacing="1">
				<tr><td height="134" class="BBS" valign="top" rules='all' style='table-layout:word-wrap:break-word;word-break:break-all'>
				<%=Title_Text%>
				</td></tr>
				</table>		
				<table border="0" cellspacing="0" cellpadding="0" align="right">
				<%If Not IsNull(Title_Edit_Time) Then%>
				<tr><td align="right" class="High" colspan="7">
					最近一次修改:<%=FormatDateTime(Title_Edit_Time,2)%>&nbsp;<%=FormatDateTime(Title_Edit_Time,3)%>
				</td></tr>
				<%End If%>
				<tr valign="bottom" height="40">
				<%If Title_IsLock Then%>
				<td width="100">
					<table width="100" height="20" border="0" align="left" cellpadding="0" cellspacing="0" style="cursor:pointer; ">
					<tr>
					<td align="center" bgcolor="#555555" class="Sign" onMouseOver="this.className='Sign';" onMouseOut="this.className='Sign';">主题被锁定</td>
					</tr>
					</table>
				</td>
				<%Else%>
				<td width="100">
					<table width="100" height="20" border="0" align="left" cellpadding="0" cellspacing="0" style="cursor:pointer; " onClick="<%
						If Session("Player_Id")<>"" Then
							If Session("Player_Rank") = 0 Then
								%>alert('加入排行后才能回复主题!新人有问题请加首页的QQ群，或发短消息给管理员，感谢理解：）');<%
							Else
								%>location='/BBS/Reply.asp?Id=<%=Title_Id%>';<%
							End If
						Else
							%>top.Window('/Player/Login.asp');<%
						End If%>">
					<tr>
					<td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">回复此主题</td>
					</tr>
					</table>
				</td>
				<%End If%>
				<%If Session("Player_IsMaster") Then%>
				<td width="90">
					<table width="80" height="20" border="0" align="right" cellpadding="0" cellspacing="0" style="cursor:pointer; " onClick="Action.location='/BBS/Action/Nice_Action.asp?Id=<%=Title_Id%>'">
					  <tr>
						<td align="center" bgcolor="#444444" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';"><%If Title_IsNice Then%>取消精华<%Else%>加入精华<%End If%></td>
					  </tr>
					</table>
				</td>
				<td width="90">
					<table width="80" height="20" border="0" align="right" cellpadding="0" cellspacing="0" style="cursor:pointer; " onClick="Action.location='/BBS/Action/High_Action.asp?Id=<%=Title_Id%>'">
					  <tr>
						<td align="center" bgcolor="#444444" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';"><%If Title_IsHigh Then%>取消加亮<%Else%>设置加亮<%End If%></td>
					  </tr>
					</table>
				</td>
				<td width="70">
					<table width="60" height="20" border="0" align="right" cellpadding="0" cellspacing="0" style="cursor:pointer; " onClick="Action.location='/BBS/Action/Lock_Action.asp?Id=<%=Title_Id%>'">
					  <tr>
						<td align="center" bgcolor="#444444" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';"><%If Title_IsLock Then%>解锁<%Else%>锁定<%End If%></td>
					  </tr>
					</table>
				</td>
				<td width="70">
					<table width="60" height="20" border="0" align="right" cellpadding="0" cellspacing="0" style="cursor:pointer; " onClick="top.Window('/BBS/Move.asp?Id=<%=Title_Id%>')">
					  <tr>
						<td align="center" bgcolor="#444444" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">移动</td>
					  </tr>
					</table>
				</td>
				<%End If%>
				<%If Session("Player_IsMaster") Or (Session("Player_Id") <> "" And Session("Player_Id") = CInt(Title_Player)) Then%>
				<td width="70">
					<table width="60" height="20" border="0" align="right" cellpadding="0" cellspacing="0" style="cursor:pointer; " onClick="location='/BBS/Edit.asp?Id=<%=Title_Id%>';">
					  <tr>
						<td align="center" bgcolor="#444444" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">编辑</td>
					  </tr>
					</table>
				</td>
				<%End If%>
				<%If Session("Player_IsMaster") Then%>
				<td width="70">
					<table width="60" height="20" border="0" align="right" cellpadding="0" cellspacing="0" style="cursor:pointer; " onClick="top.Window('/BBS/Del.asp?Id=<%=Title_Id%>')">
					  <tr>
						<td align="center" bgcolor="#444444" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">删除</td>
					  </tr>
					</table>
				</td>
				<%End If%>
				</tr>
				</table>
				</td>
				</tr>
				</table>
				<%End If%>
				<table width="604" border="0" cellpadding="0" cellspacing="0">
				<tr height="10"><td></td></tr>
				</table>
				<%
				Call Start_Conn()
				
				SQL_Text = "Title_List '"&Clng(Title_Id)&"',"&Clng(Point)&","&CLng(Session("Title_Page"))	
				rs.Open SQL_Text,Conn
				
				If Not rs.Eof Then
					
					Total_Number = rs("Total")
					rs.movefirst
			
					If Total_Number Mod Point = 0 Then
						Max_Page = Total_Number \ Point
					Else
						Max_Page = Total_Number \ Point + 1
					End If
					
					I = 1
						
					Do While Not rs.Eof
					
						Title_Text = UBB(rs("Title_Text"))
						Title_Post_Time = rs("Title_Post_Time")
						Title_Player = rs("Title_Player")
						Title_Player_Name = rs("Title_Player_Name")
						Title_Player_Title = rs("Title_Player_Title")
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
								<td class="Text">第&nbsp;<span class="Signest"><%=CInt(Session("Title_Page")-1)*Point+I%></span>&nbsp;楼</td>
								<td width="15"></td>
								</tr>
								</table>
							</td>
							<td>
								<table border="0" cellpadding="0" cellspacing="0">
								<tr>
								<td class="Text">
								　<span class="Texts">[</span><span onClick="top.Window('/Help/Title.asp');" class="<%=Title_Player_Title%>" title="点击查看称号说明"><%=Title_Player_Title%></span><span class="Texts">]</span> <a href="javascript:;" onClick="top.Window('/Player/Show.asp?Id=<%=Title_Player%>');" class="High" title="点击查看个人信息"><%=Title_Player_Name%></a>
								回复于
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
						<td valign="top">
						<table border="0" cellpadding="0" cellspacing="1">
						<tr><td height="50" class="BBS" valign="top" rules='all' style='table-layout:word-wrap:break-word;word-break:break-all'>
						<%=Title_Text%>
						</td></tr>
						</table>		
						<table border="0" cellspacing="0" cellpadding="0" align="right">
						<tr valign="bottom" height="40">
					<%If Not(Title_IsLock) Then%>
					<td width="110">
						<table width="100" height="20" border="0" align="left" cellpadding="0" cellspacing="0" style="cursor:pointer; " onClick="<%If Session("Player_Id")<>"" Then%>location='/BBS/Reply.asp?Id=<%=Title_Id%>';<%Else%>top.Window('/Player/Login.asp');<%End If%>">
						<tr>
						<td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">回复此主题</td>
						</tr>
						</table>
					</td>
					<%End If%>
						<%If Session("Player_IsMaster") Then%>
						<td width="70">
							<table width="60" height="20" border="0" align="right" cellpadding="0" cellspacing="0" style="cursor:pointer; " onClick="location='/BBS/Edit.asp?Id=<%=rs("Title_Id")%>';">
							  <tr>
								<td align="center" bgcolor="#444444" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">编辑</td>
							  </tr>
							</table>
						</td>
						<td width="70">
							<table width="60" height="20" border="0" align="right" cellpadding="0" cellspacing="0" style="cursor:pointer; " onClick="top.Window('/BBS/Del.asp?Id=<%=rs("Title_Id")%>')">
							  <tr>
								<td align="center" bgcolor="#444444" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">删除</td>
							  </tr>
							</table>
						</td>
						<%Else
							If Session("Player_Id") <> "" And Session("Player_Id") = CInt(Title_Player) Then
							%>
						<td width="70">
							<table width="60" height="20" border="0" align="right" cellpadding="0" cellspacing="0" style="cursor:pointer; " onClick="Action.location=('/BBS/Action/Del_My_Action.asp?Id=<%=rs("Title_Id")%>')">
							  <tr>
								<td align="center" bgcolor="#444444" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">删除</td>
							  </tr>
							</table>
						</td>
							<%
							End If
						End If%>
						</tr>
						</table>
						</td>
						</tr>
						</table>		
						<table width="604" border="0" cellpadding="0" cellspacing="0">
						<tr height="10"><td></td></tr>
						</table>			
						<%
						rs.MoveNext
						I = I + 1
					
					Loop					
				%>
	<table width="475" cellpadding="0" cellspacing="0">
	<form name="Page_Form" method="get">
	<tr><td align="center" class="Text" height="30">
		<%
		Go = "转到"
		Go_Start = "第"
		Go_End = "页"
		Total_Start = "共"
		Total_End = "篇回复"
		First_Page = "首页"
		Previous_Page = "上一页"
		Next_Page = "下一页"
		Last_Page = "末页"
		Page_Start = "现在是第"
		Page_End = "页"
		%>　　<%=Total_Start%><span class="Signest">&nbsp;<%=Total_Number%>&nbsp;</span><%=Total_End%>	<%
		If Session("Title_Page")<2 Then
			%>&nbsp;&nbsp;<span class="Text"><%=First_Page%></span>&nbsp;|&nbsp;<span class="Text"><%=Previous_Page%></span><%
		Else
			%>&nbsp;&nbsp;<a href="?Id=<%=Title_Id%>&Page=1" class="High"><%=First_Page%></a>&nbsp;|&nbsp;<a href="?Id=<%=Title_Id%>&Page=<%=Session("Title_Page")-1%>" class="High"><%=Previous_Page%></a><%
		End If
		If Max_Page-Session("Title_Page")<1 Then
			%>&nbsp;|&nbsp;<span class="Text"><%=Next_Page%></span>&nbsp;|&nbsp;<span class="Text"><%=Last_Page%></span><%
		Else
			%>&nbsp;|&nbsp;<a href="?Id=<%=Title_Id%>&Page=<%=Session("Title_Page")+1%>" class="High"><%=Next_Page%></a>&nbsp;|&nbsp;<a href="?Id=<%=Title_Id%>&Page=<%=Max_Page%>" class="High"><%=Last_Page%></a><%
		End If%>&nbsp;&nbsp;<%=Page_Start%>&nbsp;<span class="Signest"><%=Session("Title_Page")%></span><span class="Bold">/<%=Max_Page%></span>&nbsp;<%=Page_End%>
	  <select name="Page" class="input-no" onchange="Page_Form.submit()">
		<option><%=Go%></option>
		<%
		For I = 1 To Max_Page
			%><option value="<%=I%>"><%=Go_Start%><%=I%><%=Go_End%></option><%
		Next
		%>
	  </select>
	  <input name="Id" type="hidden" value="<%=Title_Id%>">
	  </td></tr>
	  </form>
	  </table>
	  <%
					
				End If
				
				Call End_Conn()
				%>
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
					<iframe name="Info_Frame" frameborder="0" width="280" height="175" scrolling="no" src="/Player/Poster.asp?Id=<%=Session("Title_Poster")%>"></iframe>
					</div>
					</td>
				  </tr>
				</table>
		<table width="303" border="0" cellpadding="0" cellspacing="0">
		  <tr height="15">
			<td></td>
		  </tr>
		</table>
				<table border="0" cellpadding="0" cellspacing="1" bgcolor="#444444">
				  <tr align="center" height="25">
					<td width="100" class="High" bgcolor="#444444">赞助广告</td>
				  </tr>
				</table>
				<table width="303" border="0" cellpadding="5" cellspacing="1" bgcolor="#666666">
				  <tr bgcolor="#333333">
					<td height="195" align="center" valign="top" class="Text">
						<img src="/Models/Images/Ad/bbs.png"/>
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

End If

Sub Get_Input()

	Title_Id = Request("Id")
	
End Sub

Sub Check_Input()

	Message = "No"
	
	If Title_Id = "" Then Message = "未指定[主题ID]!"

	If Message <> "No" Then
		Act="Top_Go"
		Link="/BBS/Index.asp"
		Call Error()
	End If	
	
	Session("Title_Page")=Request("Page")
	If Session("Title_Page") = "" Then Session("Title_Page") = 1
		
End Sub
%>
