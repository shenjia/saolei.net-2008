<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-13
'------------------------
Dim Player_Text
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
	cmd.CommandText = "dbo.Player_Text_Check"
	cmd.CommandType = &H0004
	
	cmd.Parameters.Append cmd.CreateParameter("@Player_Text",200,,50)
	cmd.Parameters.Append cmd.CreateParameter("@Result",200,2,20)
	
	cmd("@Player_Text") = Player_Text
	
	cmd.execute
	
	Result = cmd("@Result")
	
	Select Case Result
	
		Case "Check_OK"
			
			Session("Player_Text") = cmd("@Player_Text")
			Set cmd = Nothing
			Call End_Conn()
			
			Message = "No"
			Act = "Parent_Go"
			Link = "/Player/Register_Input.asp"
			Call Error()
			
		Case "Check_Fail"			
		
			Set cmd = Nothing
			Call End_Conn()
		
			Message = "此录像标识文字已经被人使用，请更换!"
			Act = "parent.document.all.Player_Form.Player_Text.select();"
			Call Error()
				
	End Select
	
End If

Sub Get_Input()

	Player_Text = Request.Form("Player_Text")

End Sub

Sub Check_Input()

	Message = "No"
	If Player_Text = "" Then Message = "请输入[录像标识文字]!"
	
	If Message <> "No" Then
		Act="No"
		Call Error()
	End If	
	
End Sub
%>