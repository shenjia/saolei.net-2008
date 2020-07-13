<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-17
'------------------------
Dim History_Id
%>
<!--#include virtual="/Player/Check.asp"-->
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
<!--#include virtual="/Models/Common/Function.asp"-->
<%
Call Check()
Call Get_Input()
Call Check_Input()

If Message = "No" And Check_Result <> "Fail" Then

	Call Start_Conn()
	
	Set cmd = Server.CreateObject("ADODB.Command")
	Set cmd.ActiveConnection = Conn
	cmd.CommandText = "dbo.History_Del"
	cmd.CommandType = &H0004
	
	cmd.Parameters.Append cmd.CreateParameter("@History_Id",3)
	cmd.Parameters.Append cmd.CreateParameter("@Player_Id",3)
	cmd.Parameters.Append cmd.CreateParameter("@Result",200,2,20)
	
	cmd("@History_Id") = History_Id
	cmd("@Player_Id") = Session("Player_Id")
	
	cmd.execute
	
	Result = cmd("@Result")
	Set cmd = Nothing
	Call End_Conn()
	
	Select Case Result
	
		Case "Del_OK"

			Message = "No"
			Act = "Parent_Refresh"
			Call Error()
			
		Case "Del_Fail_Exist"
		
			Message = "No"
			Act = "Parent_Refresh"
			Call Error()
			
		Case "Del_Fail_Power"
		
			Message = "您没有权限进行本操作!"
			Act = "No"
			Call Error()
			
	End Select


End If

Sub Get_Input()

	History_Id = Request("Id")

End Sub

Sub Check_Input()

	Message = "No"
	
	If History_Id = "" Then Message = "未指定[历程ID]!"

	If Message <> "No" Then
		Act="No"
		Call Error()
	End If	
	
End Sub
%>