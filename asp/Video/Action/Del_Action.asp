<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-17
'------------------------
Dim Video_Id
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
	cmd.CommandText = "dbo.Video_Del"
	cmd.CommandType = &H0004
	
	cmd.Parameters.Append cmd.CreateParameter("@Video_Id",3)
	cmd.Parameters.Append cmd.CreateParameter("@Player_Id",3)
	cmd.Parameters.Append cmd.CreateParameter("@Video_Path",200,2,100)
	cmd.Parameters.Append cmd.CreateParameter("@Result",200,2,20)
	
	cmd("@Video_Id") = Video_Id
	cmd("@Player_Id") = Session("Player_Id")
	
	cmd.execute
	
	Result = cmd("@Result")
	Video_Path = cmd("@Video_Path")
	Set cmd = Nothing
	Call End_Conn()
	
	
	Select Case Result
	
		Case "Del_OK"
		
			Set fso = CreateObject("Scripting.FileSystemObjectxxx")
		
			fso.DeleteFile(Server.MapPath(Video_Path))
			
			If Err <> 0 Then
				Set fso = Nothing
				Message = "错误：" & Err.Descripting
				Act = "top.End_Mask();top.Window_Box.style.display='none';top.location.reload();"
				Call Error()
			Else
				Set fso = Nothing
				Message = "No"
				Act = "top.End_Mask();top.Window_Box.style.display='none';top.location.reload();"
				Call Error()
			End If
	
		Case "Del_Fail_Exist"
		
			Message = "此录象不存在!"
			Act = "No"
			Call Error()
	
		Case "Del_Fail_Power"
		
			Message = "不能删除非自己上传的录象!"
			Act = "No"
			Call Error()
			
		Case "Del_Fail_Check"
		
			Message = "不能删除审核通过的录像!"
			Act = "No"
			Call Error()
			
	End Select

End If

Sub Get_Input()

	Video_Id = Request("Id")

End Sub

Sub Check_Input()

	Message = "No"
	
	If Video_Id <> "" And Check_Express(Video_Id,"\d{1,8}") Then Message = "您指定的[录象ID]不合法!"
	
	If Message <> "No" Then
		Act="Back"
		Call Error()
	End If	
	
End Sub
%>