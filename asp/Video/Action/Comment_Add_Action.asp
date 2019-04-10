<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-16
'------------------------
Dim Comment_Video
Dim Comment_Text
%>
<!--#include virtual="/Player/Check.asp"-->
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
<!--#include virtual="/Models/Common/Function.asp"-->
<!--#include virtual="/Models/Include/upload_5xsoft.inc"-->
<%
Call Check()
Call Get_Input()
Call Check_Input()

If Message = "No" And Check_Result <> "Fail" Then

	Call Start_Conn()
	
	Set cmd = Server.CreateObject("ADODB.Command")
	Set cmd.ActiveConnection = Conn
	cmd.CommandText = "dbo.Video_Comment_Add"
	cmd.CommandType = &H0004
	
	cmd.Parameters.Append cmd.CreateParameter("@Video_Id",3)
	cmd.Parameters.Append cmd.CreateParameter("@Player_Id",3)
	cmd.Parameters.Append cmd.CreateParameter("@Comment_Text",200,,500)
	cmd.Parameters.Append cmd.CreateParameter("@Result",200,2,20)
	
	cmd("@Video_Id") = Comment_Video
	cmd("@Player_Id") = Session("Player_Id")
	cmd("@Comment_Text") = Comment_Text
	
	cmd.execute
	
	Result = cmd("@Result")
	Set cmd = Nothing
	Call End_Conn()
	
	Select Case Result
	
		Case "Add_OK"

			Message = "No"
			Act = "parent.location=parent.location;try{top.Video_Frame.location=top.Video_Frame.location;}catch(e){}"
			Call Error()
			
		Case "Add_Fail"
		
			Message = "此录像不存在!"
			Act = "No"
			Call Error()
			
	End Select


End If

Sub Get_Input()

	Comment_Video = Request.Form("Comment_Video")
	Comment_Text = Request.Form("Comment_Text")

End Sub

Sub Check_Input()

	Message = "No"
	
	If Comment_Text = "" Then Message = "请输入[评论内容]!"
	If Len(Comment_Text) < 4  Then Message = "输入的[评论内容]太短!"

	If Message <> "No" Then
		Act="No"
		Call Error()
	End If	
	
End Sub
%>