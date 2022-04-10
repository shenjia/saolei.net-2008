<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-11
'------------------------
Dim Video_Id
Dim Video_Model
Dim Video_IsNoFrag
Dim Video_Score
Dim Video_3BV
Dim Video_Type
%>
<!--#include virtual="/Player/Check.asp"-->
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
<!--#include virtual="/Models/Common/Function.asp"-->
<!--#include virtual="/Models/Include/upload_5xsoft.inc"-->
<%
Call Check()

set upload=new upload_5xsoft
set file=upload.file("Video")

Video_Id = upload.form("Video_Id")
Video_Model = upload.form("Video_Model")
Video_IsNoFrag = upload.form("Video_IsNoFrag")
Video_Score = upload.form("Video_Score")
Video_3BV = upload.form("Video_3BV")
Video_Type = LCase(Right(file.fileName,3))

Call Check_Input()

Session("Upload_Video_Model") = Video_Model
Session("Upload_Video_Score") = Video_Score

If Video_Type <> "avf" And Video_Type <> "mvf" And Video_Type <> "rmv" Then
	Video_Type = "avf"
End If

If Video_Type = "avf" Or Video_Type = "rmv" Then
	Video_Score = Video_Score + 1
End If

If Video_IsNoFrag = "1" Then 
	Video_IsNoFrag = 1
Else
	Video_IsNoFrag = 0
End If

Video_3BV = CInt(Video_3BV)

If Message = "No" And Check_Result <> "Fail" Then

	Video_Path = "/Video/Mvf/"&Session("Player_Id")&"/"&Session("Player_Name_English")&"_"&Video_Model&"_"&Video_Score&"(3bv"&Video_3BV&")."&Video_Type
	Video_Path = Replace(Video_Path,vbcr,"")
	Video_Path = Replace(Video_Path,vblf,"")
	'response.Write(Server.mappath(Video_Path))

	Call Start_Conn()
	
	Set cmd = Server.CreateObject("ADODB.Command")
	Set cmd.ActiveConnection = Conn
	cmd.CommandText = "dbo.Video_Upload"
	cmd.CommandType = &H0004
	
	cmd.Parameters.Append cmd.CreateParameter("@Player_Id",3)
	cmd.Parameters.Append cmd.CreateParameter("@Video_Model",200,,3)
	cmd.Parameters.Append cmd.CreateParameter("@Video_Score",5)
	cmd.Parameters.Append cmd.CreateParameter("@Video_3BV",3)
	cmd.Parameters.Append cmd.CreateParameter("@Video_Path",200,,100)
	cmd.Parameters.Append cmd.CreateParameter("@Video_IsNoFrag",3)
	cmd.Parameters.Append cmd.CreateParameter("@Result",200,2,20)
	
	cmd("@Player_Id") = Session("Player_Id")
	cmd("@Video_Model") = Video_Model
	cmd("@Video_Score") = Video_Score
	cmd("@Video_3BV") = Video_3BV
	cmd("@Video_Path") = Video_Path
	cmd("@Video_IsNoFrag") = Video_IsNoFrag
	
	cmd.execute
	
	Result = cmd("@Result")
	Set cmd = Nothing
	Call End_Conn()
	
	Select Case Result
	
		Case "Upload_OK"

			Set fso = CreateObject("Scripting.FileSystemObject")
			If Not fso.FolderExists(Server.MapPath("/Video/Mvf/"&Session("Player_Id"))) Then fso.CreateFolder(Server.MapPath("/Video/Mvf/"&Session("Player_Id")))

			Video_Path = "/Video/Mvf/"&Session("Player_Id")&"/"&Session("Player_Name_English")&"_"&Video_Model&"_"&Video_Score&"(3bv"&Video_3BV&")."&Video_Type
			file.SaveAs Server.mappath(Video_Path)
			set file=nothing
			set upload=nothing	

			Call Start_Conn()
			
			Set cmd = Server.CreateObject("ADODB.Command")
			Set cmd.ActiveConnection = Conn
			cmd.CommandText = "dbo.Video_Change"
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
			
			If Result = "Change_OK" Then
				Set fso = CreateObject("Scripting.FileSystemObject")
				fso.DeleteFile(Server.MapPath(Video_Path))
			End If

			Act = "Parent_Go"
			Link = "/Video/Upload_OK.asp"
			Call Error()
			
		Case "Upload_Fail_User"
		
			Message = "此用户不存在!"
			Act = "No"
			Call Error()
			
		Case "Upload_Fail_Exist"
		
			Message = "此录象已存在!"
			Act = "No"
			Call Error()
			
	End Select


End If

Sub Check_Input()

	Message = "No"
	
	If Not IsNumeric(Video_Score) Then
		Message = "您输入的[录象时间成绩]不合法!"
	Else 
		If Video_Score <= 0 Or Video_Score >999.99 Then Message = "您输入的[录象时间成绩]不合法!"
	End If
	If Video_Score = "" Then Message = "请输入[录象时间成绩]!"
	If Not IsNumeric(Video_3BV) Then
		Message = "您输入的[录像3BV值]不合法!"
	Else 
		If ( Video_Model = "Beg" And ( Video_3BV < 2  Or Video_3BV > 54 ) ) Or ( Video_Model = "Int" And ( Video_3BV < 25 Or Video_3BV > 216 ) ) Or ( Video_Model = "Exp" And ( Video_3BV < 95 Or Video_3BV > 381 ) )  Then Message = "您输入的[录像3BV值]不合法!"
	End If
	If Video_3BV = "" Then Message = "请输入[录像3BV值]!"
	if file.FileStart = 0 Or file.FileName = "" Then Message = "请选择要上传的录象文件!"
	If Video_Type = "mvf" Then Message = "很抱歉，本站已停止对mvf录像的支持！"

	If Message <> "No" Then
		Act="No"
		Call Error()
	End If	
	
End Sub
%>