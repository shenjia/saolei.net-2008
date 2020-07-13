<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-17
'------------------------
Dim Player_Id
Dim From
%>
<!--#include virtual="/Player/Check.asp"-->
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
<%
Message = "No"
Act = "top.Window('/Player/Login.asp');"
Call Check()
Call Get_Input()
Call Check_Input()

If Message = "No" And Check_Result <> "Fail" Then

	Call Start_Conn()
	
	SQL_Text = "Player_Name "&Player_Id
	rs.Open SQL_Text,Conn,3,1
	
	Player_Name = rs("Player_Name_Chinese")
	Player_Title = rs("Player_Title")
	
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
	<body onload="Window_Load();Message_Form.Message_Text.select();" onMousemove="move()" topmargin=0 leftmargin=0 scroll=no>
	<table id="Window_Table" border="0" cellspacing="1" cellpadding="0" bgcolor="#999999">
		  <form name="Message_Form" action="Action/Send_Action.asp" method="post" target="Action">
		<tr>
			<td bgcolor="#444444">
				<table width="325" border="0" cellspacing="0" cellpadding="0">
					<tr bgcolor="#555555">
						<td height="25" class="Highest" onmousedown="down=true;divtop=event.clientY;divleft=event.clientX;" onmouseup="down=false" onmouseout="down=false">　发送消息</td>
						<td width="20" height="25" align="center" class="Bold" onMouseOver="this.className='Signest';" onMouseOut="this.className='Bold';" style="cursor:pointer; " onClick="Cancel();">×</td>
				</tr>
				</table>
				<table width="325" border="0" cellspacing="10" cellpadding="0">
					<tr>
						<td class="Text">向
						<span class="Texts">[</span><span onClick="location='/Help/Title.asp';" class="<%=Player_Title%>" title="点击查看称号说明"><%=Player_Title%></span><span class="Texts">]</span> <a href="/Player/Show.asp?Id=<%=Player_Id%>" title="点击查看个人信息"class="High"><%=Player_Name%></a> 发送短消息：</td>
					</tr>
			  </table>
				<table width="325" border="0" cellspacing="0" cellpadding="0">
					<tr><td height="1" bgcolor="#555555"></td></tr>
				</table>
				<table width="325" border="0" cellspacing="10" cellpadding="0">
					<tr>
					    <td width="63" valign="top" class="Text">消息内容：</td>
						<td width="232" class="Text">
						<span class="High"><textarea name="Message_Text" cols="36" rows="7" wrap="VIRTUAL" class="input-no" onpropertychange="Text_Number.innerText=100-this.value.length;"></textarea><br>
						您还可输入<span id="Text_Number">100</span>字</span>
						<input name="Message_To" type="hidden" value="<%=Player_Id%>">
						<input name="From" type="hidden" value="<%=From%>">
						</td>
					</tr>
					<tr>
					  <td colspan="2" align="right" class="Text">
						<table width="305" border="0" align="center" cellpadding="0" cellspacing="0">
						  <tr>
							<td width="155">
								<table width="120" height="30" border="0" align="center" cellpadding="0" cellspacing="1" style="cursor:pointer; " onClick="Message_Form.submit();">
									<tr>
										<td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">发送短消息</td>
									</tr>
								</table>
							</td>
							<td width="150">
								<table width="120" height="30" border="0" align="center" cellpadding="0" cellspacing="1" style="cursor:pointer; " onClick="Cancel();">
									<tr>
										<td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">还是算了吧</td>
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
		</form>
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
			<%If From = "Box" Then%>
			location='/Message/Box.asp';
			<%Else%>
			top.End_Mask();
			top.document.getElementById('Window_Box').style.display='none';
			<%End If%>
	}
	</script>
	<%
	
End If

Sub Get_Input()

	Player_Id = Request("Id")
	From = Request("From")

End Sub

Sub Check_Input()

	Message = "No"
	
	If Player_Id = "" Then Message = "未指定[用户ID]!"

	If Message <> "No" Then
		Act="No"
		Call Error()
	End If	
	
End Sub
%>