<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-13
'------------------------
Dim Player_Name
%>
<!--#include virtual="/Models/Common/Error.asp"-->
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
<!--#include virtual="/Models/Common/Function.asp"-->
<%
Call Get_Input()
Call Check_Input()

If Message = "No" Then
	
	Call Start_Conn()
	
	Set cmd = Server.CreateObject("ADODB.Command")
	Set cmd.ActiveConnection = Conn
	cmd.CommandText = "dbo.Player_Password_Check"
	cmd.CommandType = &H0004
	
	cmd.Parameters.Append cmd.CreateParameter("@Player_Name",200,,12)
	cmd.Parameters.Append cmd.CreateParameter("@Player_Id",3,2)
	cmd.Parameters.Append cmd.CreateParameter("@Result",200,2,20)
	
	cmd("@Player_Name") = Player_Name
	
	cmd.execute
	
	Result = cmd("@Result")
	Player_Id = cmd("@Player_Id")
	Set cmd = Nothing
	Call End_Conn()
	
	Select Case Result
	
		Case "Check_Ok"
		
			Act = "Parent_Go"
			Link = "/Player/Password_Input.asp?Id="&Player_Id
			Call Error()
			
		Case "Check_Fail"
		
			Message = "该登陆名称不存在!"
			Act = "No"
			Call Error()
				
	End Select
	
End If

Sub Get_Input()

	Player_Name = Request.Form("Player_Name")

End Sub

Sub Check_Input()

	Message = "No"
	If Check_Express(Player_Name,"^\w{3,12}$") Then Message = "您输入的[登陆名称]不合法!"
	If Player_Name = "" Then Message = "请输入[登陆名称]!"
	
	If Message <> "No" Then
		Act="No"
		Call Error()
	End If	
	
End Sub
%>