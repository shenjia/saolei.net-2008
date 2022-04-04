<%
'------------------------
'Code:Zhang Shen Jia
'Date:2008-1-1
'------------------------
Dim Title_Id
%>
<!--#include virtual="/Player/Check.asp"-->
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
<!--#include virtual="/Models/Common/Function.asp"-->	
<%
Call Check()
Call Get_Input()
Call Check_Input()

If Message = "No" And Check_Result <> "Fail" Then

	Call Start_Conn()
	
	Set cmd = Server.CreateObject("ADODB.Command")
	Set cmd.ActiveConnection = Conn
	cmd.CommandText = "dbo.Title_Del_My"
	cmd.CommandType = &H0004
	
	cmd.Parameters.Append cmd.CreateParameter("@Title_Id",3)
	cmd.Parameters.Append cmd.CreateParameter("@Player_Id",3)
	cmd.Parameters.Append cmd.CreateParameter("@Result",200,2,20)
	
	cmd("@Title_Id") = Title_Id
	cmd("@Player_Id") = Session("Player_Id")
	
	cmd.execute
	
	Result = cmd("@Result")
	Set cmd = Nothing
	Call End_Conn()
	
	
	Select Case Result
	
		Case "Del_OK"
		
			Act="top.location=top.location"
			Call Error()
	
		Case "Del_Fail_Exist"
		
			Message = "此回复不存在!"
			Act="top.location=top.location"
			Call Error()
	
		Case "Del_Fail_Power"
		
			Message = "您无权删除此回复!"
			Act = "No"
			Call Error()
		
			
	End Select

End If

Sub Get_Input()

	Title_Id = Request("Id")

End Sub

Sub Check_Input()

	Message = "No"
	
	If Title_Id <> "" And Check_Express(Title_Id,"\d{1,8}") Then Message = "您指定的[ID]不合法!"
	
	If Message <> "No" Then
		Act = "Top_Go"
		Link = "/BBS/Index.asp"
		Call Error()
	End If	
	
End Sub
%>
