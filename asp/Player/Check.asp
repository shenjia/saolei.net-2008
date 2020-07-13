<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-12
'------------------------
Dim Check_Result
%>
<!--#include virtual="/Models/Common/Error.asp"-->
<%
Sub Check()

	If Session("Player_Id") = "" Then
	
		Check_Result = "Fail"	
		'If Message = "" Then Message = "请登陆后再进行此操作!"
		If Message = "" Then Message = "No"
		If Act = "" Then Act = "No"
		Call Error()

	End If
	
End Sub

Sub Check_Master()

	If Session("Player_IsMaster") <> "1" Then
	
		Check_Result = "Fail"
		'If Message = "" Then Message = "请以管理员身份登陆后再进行此操作!"
		If Message = "" Then Message = "No"
		If Act = "" Then Act = "No"
		Call Error()

	End If
	
End Sub
%>