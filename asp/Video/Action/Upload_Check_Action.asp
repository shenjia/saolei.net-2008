<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-16
'------------------------
Dim Video_Model
%>
<!--#include virtual="/Player/Check.asp"-->
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
<!--#include virtual="/Models/Common/Function.asp"-->
<%
Call Check()
Call Get_Input()

If Check_Result <> "Fail" Then

	Call Start_Conn()
	
	Set cmd = Server.CreateObject("ADODB.Command")
	Set cmd.ActiveConnection = Conn
	cmd.CommandText = "dbo.Video_Upload_Check"
	cmd.CommandType = &H0004
	
	cmd.Parameters.Append cmd.CreateParameter("@Player_Id",3)
	cmd.Parameters.Append cmd.CreateParameter("@Video_Model",200,,3)
	cmd.Parameters.Append cmd.CreateParameter("@Result",200,2,20)
	
	cmd("@Player_Id") = Session("Player_Id")
	cmd("@Video_Model") = Video_Model
	
	cmd.execute
	
	Result = cmd("@Result")
	Set cmd = Nothing
	Call End_Conn()
	
	Select Case Result
	
		Case "Check_OK"
			
			Message = "No"
			Act = "parent.location='/Video/Upload_Input.asp?Model="&Video_Model&"';"
			Call Error()
			
		Case "Check_Fail"			
		
			Message = "No"
			Act = "parent.location='/Video/Upload_Select.asp?Model="&Video_Model&"';"
			Call Error()
				
	End Select

End If

Sub Get_Input()

	Video_Model = Request("Model")

End Sub
%>