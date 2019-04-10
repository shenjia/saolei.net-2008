<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-25
'------------------------
Dim Goto_Id
Dim Goto_Name
Dim Goto_Rank
%>
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
<!--#include virtual="/Models/Common/Error.asp"-->
<%
Call Get_Input()
Call Check_Input()

If Message = "No" Then
	
	If Goto_Id = "" Then
		Message = "No"
		Act = "top.Window_Frame.location='/Ranking/Goto_List.asp?Name="&Goto_Name&"&Rank="&Goto_Rank&"';"
		Call Error()
	Else
		Response.Redirect("/Ranking/Action/Goto_Action.asp?Id="&Goto_Id&"&Rank="&Goto_Rank)
	End If
	
End If

Sub Get_Input()

	Goto_Id = Trim(Request.form("Goto_Id"))
	Goto_Name = Trim(Request.form("Goto_Name"))
	Goto_Rank = Trim(Request.form("Goto_Rank"))
	
End Sub

Sub Check_Input()
	
	Message = "No"
	If Goto_Id = "" And Goto_Name = "" Then Message = "请至少输入一个条件!"
	If Goto_Id <> "" And Not IsNumeric(Goto_Id) Then Message = "您输入的[ID]不合法!"
	If Message <> "No" Then
		Act="No"
		Call Error()
	End If

End Sub
%>