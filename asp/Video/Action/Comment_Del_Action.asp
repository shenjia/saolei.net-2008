<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-16
'------------------------
Dim Comment_Id
%>
<!--#include virtual="/Models/Common/Error.asp"-->
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
<!--#include virtual="/Models/Common/Function.asp"-->
<%
Call Get_Input()
Call Check_Input()

If Message = "No" And Session("Player_Id") <> "" Then

	Call Start_Conn()
	
	Set cmd = Server.CreateObject("ADODB.Command")
	Set cmd.ActiveConnection = Conn
	cmd.CommandText = "dbo.Video_Comment_Del"
	cmd.CommandType = &H0004
	
	cmd.Parameters.Append cmd.CreateParameter("@Comment_Id",3)
	cmd.Parameters.Append cmd.CreateParameter("@Player_Id",3)
	cmd.Parameters.Append cmd.CreateParameter("@Result",200,2,20)
	
	cmd("@Comment_Id") = Comment_Id
	cmd("@Player_Id") = Session("Player_Id")
	
	cmd.execute
	
	Result = cmd("@Result")
	Set cmd = Nothing
	Call End_Conn()
	response.Write(Result)
	Select Case Result
	
		Case "Del_OK"

			Message = "No"
			Act = "parent.location=parent.location;try{top.Video_Frame.location=top.Video_Frame.location;}catch(e){}"
			Call Error()
			
		Case "Del_Fail_Exist"
		
			Message = "No"
			Act = "parent.location=parent.location;try{top.Video_Frame.location=top.Video_Frame.location;}catch(e){}"
			Call Error()
			
		Case "Del_Fail_Power"
		
			Message = "您没有权限进行本操作!"
			Act = "No"
			Call Error()
			
	End Select


End If

Sub Get_Input()

	Comment_Id = Request("Id")

End Sub

Sub Check_Input()

	Message = "No"
	
	If Comment_Id = "" Then Message = "未指定[评论ID]!"

	If Message <> "No" Then
		Act="No"
		Call Error()
	End If	
	
End Sub
%>