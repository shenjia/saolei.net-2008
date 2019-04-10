<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-25
'------------------------
Dim Goto_Id
Dim Goto_Rank
%>
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
<!--#include virtual="/Models/Common/Error.asp"-->
<%
Call Get_Input()
Call Check_Input()

If Message = "No" Then
	
	Call Start_Conn()

	Set cmd = Server.CreateObject("ADODB.Command")
	Set cmd.ActiveConnection = Conn
	cmd.CommandText = "dbo.Ranking_Goto_"&Goto_Rank
	cmd.CommandType = &H0004
	
	cmd.Parameters.Append cmd.CreateParameter("@Player_Id",200,,12)
	cmd.Parameters.Append cmd.CreateParameter("@By",200,,25)
	cmd.Parameters.Append cmd.CreateParameter("@Page",200,2,20)
	cmd.Parameters.Append cmd.CreateParameter("@Result",200,2,20)
	
	cmd("@Player_Id") = Goto_Id
	cmd("@By") = Session("Ranking_By")
	
	cmd.execute
	Result = cmd("@Result")
	
	Select Case Result
				
		Case "Check_Ok"
		
			Session("Goto_Id") = Goto_Id
			Page = cmd("@Page")
			Set cmd = Nothing
			Call End_Conn()
			
			Message = "No"
			Act = "top.End_Mask();top.Window_Box.style.display='none';top.Ranking_Frame.location='/Ranking/Ranking_"&Goto_Rank&".asp?Page="&Page&"';"
			Call Error()
				
		Case "Check_Fail"
		
			Set cmd = Nothing
			Call End_Conn()
			Message = "没有符合条件的玩家！"
			Act = "No"
			Call Error()
			
	End Select
	
End If

Sub Get_Input()

	Goto_Id = Trim(Request("Id"))
	Goto_Rank = Trim(Request("Rank"))
	
End Sub

Sub Check_Input()
	
	Message = "No"
	If Goto_Id <> "" And Not IsNumeric(Goto_Id) Then Message = "您输入的ID不合法!"
	If Message <> "No" Then
		Act="No"
		Call Error()
	End If

End Sub
%>