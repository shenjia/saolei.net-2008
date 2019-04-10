<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-17
'------------------------
Dim Message_Id
%>
<!--#include virtual="/Player/Check.asp"-->
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
<!--#include virtual="/Models/Include/NoHtml.asp"-->
<%
Call Check()
Call Get_Input()
Call Check_Input()

If Message = "No" And Check_Result <> "Fail" Then

	Call Start_Conn()
	
	Set cmd = Server.CreateObject("ADODB.Command")
	Set cmd.ActiveConnection = Conn
	cmd.CommandText = "dbo.Message_Show"
	cmd.CommandType = &H0004
	
	cmd.Parameters.Append cmd.CreateParameter("@Message_Id",3)
	cmd.Parameters.Append cmd.CreateParameter("@Player_Id",3)
	cmd.Parameters.Append cmd.CreateParameter("@Message_From",3,2)
	cmd.Parameters.Append cmd.CreateParameter("@Message_From_Name",200,2,12)
	cmd.Parameters.Append cmd.CreateParameter("@Message_From_Title",200,2,4)
	cmd.Parameters.Append cmd.CreateParameter("@Message_Time",135,2)
	cmd.Parameters.Append cmd.CreateParameter("@Message_Text",200,2,500)
	cmd.Parameters.Append cmd.CreateParameter("@Message_IsMaster",3,2)
	cmd.Parameters.Append cmd.CreateParameter("@Result",200,2,20)
	
	cmd("@Message_Id") = Message_Id
	cmd("@Player_Id") = Session("Player_Id")
	
	cmd.execute
	
	Result = cmd("@Result")
	
	Select Case Result
	
		Case "Show_OK"
			
			Message_From = cmd("@Message_From")
			Message_From_Name = cmd("@Message_From_Name")
			Message_From_Title = cmd("@Message_From_Title")
			Message_Time = cmd("@Message_Time")
			Message_Text = cmd("@Message_Text")
			Message_IsMaster = cmd("@Message_IsMaster")
			Set cmd = Nothing
			Call End_Conn()
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
			<link href="/Models/Css/2008.css" rel="stylesheet" type="text/css">
			<!--#include virtual="/Models/Include/Windows.asp"-->
			</head>
			<body onload="Window_Load();" onMousemove="move()" topmargin=0 leftmargin=0 scroll=no>
			<table id="Window_Table" border="0" cellspacing="1" cellpadding="0" bgcolor="#999999">
				<tr>
					<td bgcolor="#444444">
						<table width="325" border="0" cellspacing="0" cellpadding="0">
							<tr bgcolor="#555555">
								<td height="25" class="Highest" onmousedown="down=true;divtop=event.clientY;divleft=event.clientX;" onmouseup="down=false" onmouseout="down=false">　查看消息</td>
								<td width="20" height="25" align="center" class="Bold" onMouseOver="this.className='Signest';" onMouseOut="this.className='Bold';" style="cursor:pointer; " onClick="Cancel();">×</td>
						</tr>
						</table>
						<table width="325" border="0" cellspacing="10" cellpadding="0">
							<tr>
								<td class="Text"><%If Message_IsMaster Then%><span class="Title">管理员</span>&nbsp;<%End If%><span class="Texts">[</span><span onClick="location='/Help/Title.asp';" class="<%=Message_From_Title%>" title="点击查看称号说明"><%=Message_From_Title%></span><span class="Texts">]</span> <a href="/Player/Show.asp?Id=<%=Message_From%>" title="点击查看个人信息"class="High"><%=Message_From_Name%></a> 于<%=FormatDateTime(Message_Time,1)%>发来短消息：</td>
							</tr>
							</table>
						<table width="325" border="0" cellspacing="0" cellpadding="0">
							<tr><td height="1" bgcolor="#555555"></td></tr>
						</table>
						<table width="325" border="0" cellspacing="10" cellpadding="0">
							<tr>
								<td class="Text"><%=NoHtml(Message_Text)%></td>
							</tr>
							<tr>
							  <td align="right" class="Text">
								<table width="305" border="0" align="center" cellpadding="0" cellspacing="0">
								  <tr>
									<td width="155">
										<table width="120" height="30" border="0" align="center" cellpadding="0" cellspacing="1" style="cursor:pointer; " onClick="Cancel();">
											<tr>
												<td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">恩，我知道了</td>
											</tr>
										</table>
									</td>
									<td width="150">
										<table width="120" height="30" border="0" align="center" cellpadding="0" cellspacing="1" style="cursor:pointer; " onClick="location='/Message/Send.asp?Id=<%=Message_From%>&From=Box';">
											<tr>
												<td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">回复此消息</td>
											</tr>
										</table>
									</td>
								  </tr>
								</table>
							  
							  </td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			</body>
			</html>
			<iframe name="Action" style="display: none"></iframe>
			<script language="javascript">
			function KeyDown(e){     
				var keyCode;
				try{ 
					   keyCode=event.keyCode;
				 } 
				 catch(a){
					   keyCode=KeyDown.arguments[0].keyCode; 
				 } 
				switch(keyCode)
				{
					case 27:
					Cancel();      
						break;
				}
			}		
			document.onkeydown=KeyDown; 
			document.onkeypress=KeyDown;

			function Cancel()
			{
				location='/Message/Box.asp';
			}
			</script>
			<%
	
		Case "Show_Fail"
			
			Set cmd = Nothing
			Call End_Conn()
			
			Message = "消息不存在!"
			Act="top.location=top.location"
			Call Error()
				
	End Select
	
End If

Sub Get_Input()

	Message_Id = Request("Id")

End Sub

Sub Check_Input()

	Message = "No"
	
	If Message_Id = "" Then Message = "未指定[消息ID]!"

	If Message <> "No" Then
		Act="No"
		Call Error()
	End If	
	
End Sub
%>