<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-31
'------------------------
Dim Table_Id
Dim Player_Id
Dim Player_Score
%>
<!--#include virtual="/Player/Check.asp"-->
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
<!--#include virtual="/Models/Common/Function.asp"-->
<%
Call Get_Input()
Call Check_Input()

If Message = "No" Then

	Call Start_Conn()
	
	Set cmd = Server.CreateObject("ADODB.Command")
	Set cmd.ActiveConnection = Conn
	cmd.CommandText = "dbo.Online_End"
	cmd.CommandType = &H0004
	
	cmd.Parameters.Append cmd.CreateParameter("@Table_Id",3)
	cmd.Parameters.Append cmd.CreateParameter("@Player_Id",200,,50)
	cmd.Parameters.Append cmd.CreateParameter("@Player_Score",5)
	
	cmd("@Table_Id") = Table_Id
	cmd("@Player_Id") = Player_Id
	cmd("@Player_Score") = Player_Score
	
	cmd.execute
	Set cmd = Nothing
	Call End_Conn()

End If

Sub Get_Input()

	Table_Id = Request("Table")
	Player_Id = Request("Player")
	Player_Score = Request("Score")

End Sub

Sub Check_Input()

	Message = "No"
	
	If Check_Str(Table_Id) Or Check_Str(Table_Id) Or Check_Str(Player_Score)  Then Message = "您输入了非法字符!"
	
	If Message <> "No" Then
		Act="No"
		Call Error()
	End If	
	
End Sub
%>