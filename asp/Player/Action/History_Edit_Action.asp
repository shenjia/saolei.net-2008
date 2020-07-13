<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-17
'------------------------
Dim History_Id
Dim History_Year
Dim History_Month
Dim History_Text
Dim History_Time
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
	cmd.CommandText = "dbo.History_Edit"
	cmd.CommandType = &H0004
	
	cmd.Parameters.Append cmd.CreateParameter("@History_Id",3)
	cmd.Parameters.Append cmd.CreateParameter("@Player_Id",3)
	cmd.Parameters.Append cmd.CreateParameter("@History_Time",135)
	cmd.Parameters.Append cmd.CreateParameter("@History_Text",200,,1000)
	cmd.Parameters.Append cmd.CreateParameter("@Result",200,2,20)
	
	cmd("@History_Id") = History_Id
	cmd("@Player_Id") = Session("Player_Id")
	cmd("@History_Time") = History_Time
	cmd("@History_Text") = History_Text
	
	cmd.execute
	
	Result = cmd("@Result")
	Set cmd = Nothing
	Call End_Conn()
	response.Write(Result)
	Select Case Result
	
		Case "Edit_OK"

			Message = "No"
			Act = "top.location.reload()"
			Call Error()
			
		Case "Edit_Fail_Exist"
		
			Message = "此月的历程已经存在!"
			Act = "No"
			Call Error()
			
		Case "Edit_Fail_Not"
		
			Message = "此月的历程不存在!"
			Act = "top.location.reload()"
			Call Error()
			
		Case "Edit_Fail_User"
		
			Message = "用户不存在!"
			Act = "No"
			Call Error()
			
		Case "Edit_Fail_Power"
		
			Message = "您没有执行该操作的权限!"
			Act = "No"
			Call Error()
			
	End Select


End If

Sub Get_Input()

	History_Id = Request.Form("History_Id")
	History_Year = Request.Form("History_Year")
	History_Month = Request.Form("History_Month")
	History_Text = Request.Form("History_Text")
	History_Time = History_Year&"-"&History_Month&"-1"

End Sub

Sub Check_Input()

	Message = "No"
	
	If History_Text = "" Then Message = "请输入[此月历程]!"
	If Len(History_Text) < 5  Then Message = "输入的[此月历程]太短!"
	If Len(History_Text) >100  Then Message = "输入的[此月历程]太长!"

	If Message <> "No" Then
		Act="No"
		Call Error()
	End If	
	
End Sub
%>