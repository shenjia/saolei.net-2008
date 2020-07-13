<%
'------------------------
'Code:Zhang Shen Jia
'Date:2008-3-14
'------------------------
Dim Title_Id
%>
<!--#include virtual="/Player/Check.asp"-->
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
<!--#include virtual="/Models/Common/Function.asp"-->
<%
Call Check_Master()
Call Get_Input()
Call Check_Input()

If Message = "No" And Check_Result <> "Fail" Then

	Call Start_Conn()
	
	Set cmd = Server.CreateObject("ADODB.Command")
	Set cmd.ActiveConnection = Conn
	cmd.CommandText = "dbo.Title_Lock"
	cmd.CommandType = &H0004
	
	cmd.Parameters.Append cmd.CreateParameter("@Title_Id",3)
	cmd.Parameters.Append cmd.CreateParameter("@Admin_Id",3)
	cmd.Parameters.Append cmd.CreateParameter("@Result",200,2,20)
	
	cmd("@Title_Id") = Title_Id
	cmd("@Admin_Id") = Session("Player_Id")
	
	cmd.execute
	
	Result = cmd("@Result")
	Set cmd = Nothing
	Call End_Conn()
	
	Select Case Result
	
		Case "Lock_On"

			Message = "No"
			Act="top.location=top.location"
			Call Error()
	
		Case "Lock_Off"

			Message = "No"
			Act="top.location=top.location"
			Call Error()
			
		Case "Lock_Fail"
		
			Message = "此主题不存在!"
			Act = "top.location='/BBS/Index.asp'"
			Call Error()
			
	End Select

End If

Sub Get_Input()

	Title_Id = Request("Id")

End Sub

Sub Check_Input()

	Message = "No"
	
	If Title_Id <> "" And Check_Express(Title_Id,"\d{1,6}") Then Message = "您指定的[主题ID]不合法!"
	
	If Message <> "No" Then
		Act="Back"
		Call Error()
	End If	
	
End Sub
%>