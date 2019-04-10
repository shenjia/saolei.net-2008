<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-17
'------------------------
Dim Message_Text
%>
<!--#include virtual="/Player/Check.asp"-->
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
<%
Call Check_Master()
Call Get_Input()
Call Check_Input()

If Message = "No" And Check_Result <> "Fail" Then

	Session("Message_Text") = Message_Text
	Act = "top.Window_Frame.location='/Message/Broad_Doing.asp';"
	Call Error()

End If

Sub Get_Input()

	Message_Text = Request.Form("Message_Text")

End Sub

Sub Check_Input()

	Message = "No"
	
	If Message_Text = "" Then Message = "请输入[消息内容]!"
	If Len(Message_Text) < 2  Then Message = "输入的[消息内容]太短!"
	If Len(Message_Text) > 100  Then Message = "输入的[消息内容]太长!"

	If Message <> "No" Then
		Act="No"
		Call Error()
	End If	
	
End Sub
%>