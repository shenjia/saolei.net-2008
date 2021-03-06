<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-17
'------------------------
Dim Video_Id
Dim Why_Text
Dim Why(10)
%>
<!--#include virtual="/Player/Check.asp"-->
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
<!--#include virtual="/Models/Common/Function.asp"-->	
<%
Call Check_Master()
Call Get_Input()
Call Check_Input()

Why_Counter = 5

Why(1) = "未设定录像标识文字"
Why(2) = "录像的标识与用户注册标识不符"
Why(3) = "填写数据与录像实际数据不符"
Why(4) = "录像非Classical模式"
Why(5) = "录像存在BUG"

If Message = "No" And Check_Result <> "Fail" Then

	Call Start_Conn()
	
	Set cmd = Server.CreateObject("ADODB.Command")
	Set cmd.ActiveConnection = Conn
	cmd.CommandText = "dbo.Video_Freeze"
	cmd.CommandType = &H0004
	
	cmd.Parameters.Append cmd.CreateParameter("@Video_Id",3)
	cmd.Parameters.Append cmd.CreateParameter("@Admin_Id",3)
	cmd.Parameters.Append cmd.CreateParameter("@Next_Id",3,2)
	cmd.Parameters.Append cmd.CreateParameter("@Why_Text",200,,100)
	cmd.Parameters.Append cmd.CreateParameter("@Result",200,2,20)
	
	cmd("@Video_Id") = Video_Id
	cmd("@Admin_Id") = Session("Player_Id")
	cmd("@Why_Text") = Why_Text
	
	cmd.execute
	
	Next_Id = cmd("@Next_Id")
	Result = cmd("@Result")
	Set cmd = Nothing
	Call End_Conn()
	
	
	Select Case Result
	
		Case "Freeze_OK"
		
			Message = "No"
			Act = "parent.location='/Video/Show.asp?Id="&Next_Id&"';"
			Call Error()
	
		Case "Freeze_OK_Refresh"
		
			Message = "No"
			Act = "top.Window('/Ranking/Refresh.asp?tmp='+Math.random());try{top.Video_Frame.location=top.Video_Frame.location;}catch(e){}"
			Call Error()
	
		Case "Freeze_Fail_Exist"
		
			Message = "此录象不存在!"
			Act = "No"
			Call Error()
	
		Case "Freeze_Fail_Power"
		
			Message = "没有冻结本录象的权限!"
			Act = "No"
			Call Error()
		
			
	End Select

End If

Sub Get_Input()

	Video_Id = Request("Video_Id")
	Why_Text = Request("Why_Text")

End Sub

Sub Check_Input()

	Message = "No"
	
	If Video_Id <> "" And Check_Express(Video_Id,"\d{1,8}") Then Message = "您指定的[录象ID]不合法!"
	If Why_Text = "" Then Message = "请输入或选择理由!"
	
	If Message <> "No" Then
		Act="parent.document.all.Why_Text.focus()"
		Call Error()
	End If	
	
End Sub
%>