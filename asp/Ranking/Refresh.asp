<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-17
'------------------------
%>
<!--#include virtual="/Player/Check.asp"-->
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
<!--#include virtual="/Models/Include/Bar.asp"-->
<%
Act = "Top_Go"
Call Check_Master()

If Check_Result <> "Fail" Then
	
	Call Start_Conn()
	
	Set cmd = Server.CreateObject("ADODB.Command")
	Set cmd.ActiveConnection = Conn
	cmd.CommandText = "dbo.Ranking_Refresh_Check"
	cmd.CommandType = &H0004
	
	cmd.Parameters.Append cmd.CreateParameter("@Video_Check",3,2)
	
	cmd.execute
	
	Video_Check = cmd("@Video_Check")
	
	Set cmd = Nothing
	
	Call End_Conn()
	
	If Video_Check>0 Then
		Response.Redirect("/Ranking/Refresh_Fail.asp?Check="&Video_Check)
	Else
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
		<body onMousemove="move()" onLoad="Window_Load();Action.location='/Ranking/Action/Refresh_Action.asp?tmp='+Math.random();" topmargin=0 leftmargin=0 scroll=no>
		<table id="Window_Table" border="0" cellspacing="1" cellpadding="0" bgcolor="#999999">
			<tr>
				<td bgcolor="#444444">
					<table width="360" border="0" cellspacing="0" cellpadding="0">
						<tr bgcolor="#555555">
							<td height="25" class="Highest" onMouseDown="down=true;divtop=event.clientY;divleft=event.clientX;" onMouseUp="down=false" onMouseOut="down=false">　<span id="Ranking">正在准备刷新排行...</span></td>
					</tr>
					</table>
					<table width="360" border="0" cellspacing="10" cellpadding="0">
						<tr onMouseOver="Box_Refresh.style.background='#999999';Bar_Refresh.style.background='#999999';" onMouseOut="Box_Refresh.style.background='#777777';Bar_Refresh.style.background='#777777';">
							<td width="320" class="Text">
							<%Call Bar("Refresh",0,100,340,20)%></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		</body>
		<iframe name="Action" style="display: none"></iframe>
		</html>
		<%
	End If
End If
%>