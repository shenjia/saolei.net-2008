<%
'------------------------
'Code:Zhang Shen Jia
'Date:2008-1-1
'------------------------
Dim Title_Id
Dim Title_Model
%>
<!--#include virtual="/Player/Check.asp"-->
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
<%
Call Check_Master()
Call Get_Input()

If Check_Result <> "Fail" Then
	Notice_Text = "公告"
	Skill_Text = "技术"
	Other_Text = "杂谈"
	Ask_Text = "问答"
	
	Execute "Title_Model_Text = "&Title_Model&"_Text"
		
	Call Start_Conn()

	Set cmd = Server.CreateObject("ADODB.Command")
	Set cmd.ActiveConnection = Conn
	cmd.CommandText = "dbo.Title_Move"
	cmd.CommandType = &H0004
	
	cmd.Parameters.Append cmd.CreateParameter("@Title_Id",3)
	cmd.Parameters.Append cmd.CreateParameter("@Admin_Id",3)
	cmd.Parameters.Append cmd.CreateParameter("@Title_Model",200,,6)
	cmd.Parameters.Append cmd.CreateParameter("@Title_Model_Text",200,,8)
	cmd.Parameters.Append cmd.CreateParameter("@Result",200,2,20)
	
	cmd("@Title_Id") = Title_Id
	cmd("@Admin_Id") = Session("Player_Id")
	cmd("@Title_Model") = Title_Model
	cmd("@Title_Model_Text") = Title_Model_Text
	
	cmd.execute
	Result = cmd("@Result")
	
	Set cmd = Nothing
	Call End_Conn()
	
	Select Case Result
				
		Case "Move_OK"		
			
			Message = "No"
			Act = "top.End_Mask();top.Window_Box.style.display='none';top.location.reload();;"
			Call Error()
				
		Case "Move_Fail"
		
			Message = "该主题不存在！"
			Act = "top.End_Mask();top.Window_Box.style.display='none';top.location.reload();;"
			Call Error()
			
	End Select
	
End If

Sub Get_Input()

	Title_Id = Trim(Request("Id"))
	Title_Model = Trim(Request("Model"))
	
End Sub
%>