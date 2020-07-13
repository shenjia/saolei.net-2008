<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-13
'------------------------
Dim Player_Id
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
	cmd.CommandText = "dbo.Player_Password_Id_Check"
	cmd.CommandType = &H0004
	
	cmd.Parameters.Append cmd.CreateParameter("@Player_Id",3)
	cmd.Parameters.Append cmd.CreateParameter("@Result",200,2,20)
	
	cmd("@Player_Id") = Player_Id
	cmd.execute
	
	Result = cmd("@Result")
	Set cmd = Nothing
	Call End_Conn()
	
	Select Case Result
	
		Case "Check_Ok"
		
			Act = "Parent_Go"
			Link = "/Player/Password_Input.asp?Id="&Player_Id
			Call Error()
			
		Case "Check_Fail"
		
			Message = "该用户ID不存在!"
			Act = "No"
			Call Error()
				
	End Select
	
End If

Sub Get_Input()

	Player_Id = Request("Player_Id")

End Sub

Sub Check_Input()

	Message = "No"
	If Check_Express(Player_Id,"\d{1,6}") Then Message = "您输入的[用户ID]不合法!"
	If Player_Id = "" Then Message = "请输入[用户ID]!"
	
	If Message <> "No" Then
		Act="No"
		Call Error()
	End If	
	
End Sub
%>