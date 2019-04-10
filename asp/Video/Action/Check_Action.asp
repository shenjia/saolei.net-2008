<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-11
'------------------------
Dim Video_Id
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
	cmd.CommandText = "dbo.Video_Check"
	cmd.CommandType = &H0004
	
	cmd.Parameters.Append cmd.CreateParameter("@Video_Id",3)
	cmd.Parameters.Append cmd.CreateParameter("@Admin_Id",3)
	cmd.Parameters.Append cmd.CreateParameter("@Next_Id",3,2)
	cmd.Parameters.Append cmd.CreateParameter("@Result",200,2,20)
	
	cmd("@Video_Id") = Video_Id
	cmd("@Admin_Id") = Session("Player_Id")
	
	cmd.execute
	
	Next_Id = cmd("@Next_Id")
	Result = cmd("@Result")
	Set cmd = Nothing
	Call End_Conn()
	
	
	Select Case Result
	
		Case "Check_OK"
		
			Message = "No"
			Act = "parent.location='/Video/Show.asp?Id="&Next_Id&"';"
			Call Error()
	
		Case "Check_OK_Refresh"
		
			Message = "No"
			Act = "top.Window('/Ranking/Refresh.asp?tmp='+Math.random());try{top.Video_Frame.location=top.Video_Frame.location;}catch(e){}"
			Call Error()
		
	
		Case "Check_Fail"
		
			Message = "此录象不存在!"
			Act="top.location=top.location"
			Call Error()
		
			
	End Select

End If

Sub Get_Input()

	Video_Id = Request("Id")

End Sub

Sub Check_Input()

	Message = "No"
	
	If Video_Id <> "" And Check_Express(Video_Id,"\d{1,8}") Then Message = "您指定的[录象ID]不合法!"
	
	If Message <> "No" Then
		Act="Back"
		Call Error()
	End If	
	
End Sub
%>