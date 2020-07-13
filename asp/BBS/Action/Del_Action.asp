<%
'------------------------
'Code:Zhang Shen Jia
'Date:2008-1-1
'------------------------
Dim Title_Id
Dim Why_Text
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
	cmd.CommandText = "dbo.Title_Del"
	cmd.CommandType = &H0004
	
	cmd.Parameters.Append cmd.CreateParameter("@Title_Id",3)
	cmd.Parameters.Append cmd.CreateParameter("@Admin_Id",3)
	cmd.Parameters.Append cmd.CreateParameter("@Why_Text",200,,100)
	cmd.Parameters.Append cmd.CreateParameter("@Result",200,2,20)
	
	cmd("@Title_Id") = Title_Id
	cmd("@Admin_Id") = Session("Player_Id")
	cmd("@Why_Text") = Why_Text
	
	cmd.execute
	
	Result = cmd("@Result")
	Set cmd = Nothing
	Call End_Conn()
	
	
	Select Case Result
	
		Case "Del_OK"
		
			Act="top.location=top.location"
			Call Error()
	
		Case "Del_Fail"
		
			Message = "此帖子不存在!"
			Act="top.location=top.location"
			Call Error()
		
			
	End Select

End If

Sub Get_Input()

	Title_Id = Request("Title_Id")
	Why_Text = Request("Why_Text")

End Sub

Sub Check_Input()

	Message = "No"
	
	If Title_Id <> "" And Check_Express(Title_Id,"\d{1,8}") Then Message = "您指定的[ID]不合法!"
	If Why_Text = "" Then Message = "请输入或选择原因!"
	
	If Message <> "No" Then
		Act="parent.document.all.Why_Text.focus()"
		Call Error()
	End If	
	
End Sub
%>