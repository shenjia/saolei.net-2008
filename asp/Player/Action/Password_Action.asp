<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-13
'------------------------
Dim Player_Id
Dim Player_Answer
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
	cmd.CommandText = "dbo.Player_Password"
	cmd.CommandType = &H0004
	
	cmd.Parameters.Append cmd.CreateParameter("@Player_Id",3)
	cmd.Parameters.Append cmd.CreateParameter("@Player_Answer",200,,50)
	cmd.Parameters.Append cmd.CreateParameter("@Player_Name",200,2,12)
	cmd.Parameters.Append cmd.CreateParameter("@Player_Password",200,2,12)
	cmd.Parameters.Append cmd.CreateParameter("@Result",200,2,20)
	
	cmd("@Player_Id") = Player_Id
	cmd("@Player_Answer") = Player_Answer
	
	cmd.execute
	
	Result = cmd("@Result")
	Session("Player_Name") = cmd("@Player_Name")
	Session("Player_Password") = cmd("@Player_Password")
	Set cmd = Nothing
	Call End_Conn()
	
	Select Case Result
	
		Case "Check_Ok"
		
			Act = "Parent_Go"
			Link = "/Player/Password_OK.asp"
			Call Error()
			
		Case "Check_Fail"
		
			Act = "Parent_Go"
			Link = "/Player/Password_Fail.asp"
			Call Error()
				
	End Select
	
End If

Sub Get_Input()

	Player_Id = Request.Form("Player_Id")
	Player_Answer = Request.Form("Player_Answer")

End Sub

Sub Check_Input()

	Message = "No"
	If Check_Str(Player_Answer) Then Message = "您在[问题答案]中输入了非法字符!"
	
	If Message <> "No" Then
		Act="No"
		Call Error()
	End If	
	
End Sub
%>