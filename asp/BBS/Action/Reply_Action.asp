<%
'------------------------
'Code:Zhang Shen Jia
'Date:2008-1-1
'------------------------
Dim Title_Id
Dim Title_Text
%>
<!--#include virtual="/Player/Check.asp"-->
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
<!--#include virtual="/Models/Common/Function.asp"-->
<!--#include virtual="/Models/Include/NoHtml.asp"-->
<%
Act = "Top_Go"
Call Get_Input()
Call Check_Input()
Call Format_Input()

If Message = "No" And Check_Result <> "Fail" Then
	
	Call Start_Conn()
	
	Set cmd = Server.CreateObject("ADODB.Command")
	Set cmd.ActiveConnection = Conn
	cmd.CommandText = "dbo.Title_Reply"
	cmd.CommandType = &H0004
	
	cmd.Parameters.Append cmd.CreateParameter("@Title_Id",3)
	cmd.Parameters.Append cmd.CreateParameter("@Title_Text",201,,strLength(Title_Text))
	cmd.Parameters.Append cmd.CreateParameter("@Title_Player",3)
	cmd.Parameters.Append cmd.CreateParameter("@Result",200,2,20)
	
	cmd("@Title_Id") = Title_Id
	cmd("@Title_Text") = Title_Text
	cmd("@Title_Player") = Session("Player_Id")
	cmd.execute
	
	Result = cmd("@Result")
	Set cmd = Nothing
	
	Select Case Result
	
		Case "Reply_OK"
		
			Call End_Conn()
			Message = "No"
			Act = "top.location='/BBS/Title.asp?Id="&Title_Id&"';"
			Call Error()
			
		Case "Reply_Fail_Player"
		
			Call End_Conn()
			Message = "用户不存在!"
			Act = "No"
			Call Error()
			
		Case "Reply_Fail_Title"
		
			Call End_Conn()
			Message = "主题不存在!"
			Act = "top.location='/BBS/Index.asp'"
			Call Error()

		Case "Reply_Fail_Newbee"
		
			Call End_Conn()
			Message = "加入排行后才能进行回复!新人有问题请加首页的QQ群，或发短消息给管理员，感谢理解：）"
			Act = "No"
			Call Error()
	
	End Select
	
End If

Sub Get_Input()

	Title_Id = Request.form("Title_Id")
	Title_Text = Request.form("Title_Text")
	
End Sub

Sub Check_Input()
	
	Message = "No"
	If strLength(Title_Text) > 5000 Then Message = "内容超过5000字符，请分开发表!"
	If strLength(Title_Text) < 2 Then Message = "内容过短，请补充!"
	If Title_Text = "" Then Message = "请输入内容!"
	If Message <> "No" Then
		Act="No"
		Call Error()
	End If

End Sub

Sub Format_Input()

	Title_Text = NoHtml(Title_Text)

End Sub
%>