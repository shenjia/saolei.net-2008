<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-31
'------------------------
Dim Player_Id
Dim Player_IsMaster
Dim Player_Image
Dim Player_Name_Chinese
Dim Player_Name_English	
Dim Player_Name_Net
Dim Player_Sex
Dim Player_Area
Dim Player_Year
Dim Player_Month
Dim Player_Email
Dim Player_QQ
Dim Player_Mouse
Dim Player_Pad
Dim Player_Interest
Dim Player_Text
Dim Player_Question
Dim Player_Answer
%>
<!--#include virtual="/Player/Check.asp"-->
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
<!--#include virtual="/Models/Common/Function.asp"-->
<%
Call Check_Master()
Call Get_Input()
Call Check_Input()

If Message = "No" And Check_Result <> "Fail" Then

	Call Start_Conn()
	
	Set cmd = Server.CreateObject("ADODB.Command")
	Set cmd.ActiveConnection = Conn
	cmd.CommandText = "dbo.Player_Edit"
	cmd.CommandType = &H0004
	
	cmd.Parameters.Append cmd.CreateParameter("@Player_Id",3)
	cmd.Parameters.Append cmd.CreateParameter("@Player_Name_Chinese",200,,12)
	cmd.Parameters.Append cmd.CreateParameter("@Player_Name_English",200,,20)
	cmd.Parameters.Append cmd.CreateParameter("@Player_Name_Net",200,,12)
	cmd.Parameters.Append cmd.CreateParameter("@Player_Sex",3)
	cmd.Parameters.Append cmd.CreateParameter("@Player_Area",200,,12)
	cmd.Parameters.Append cmd.CreateParameter("@Player_Year",3)
	cmd.Parameters.Append cmd.CreateParameter("@Player_Month",3)
	cmd.Parameters.Append cmd.CreateParameter("@Player_Email",200,,50)
	cmd.Parameters.Append cmd.CreateParameter("@Player_QQ",200,,12)
	cmd.Parameters.Append cmd.CreateParameter("@Player_Mouse",200,,25)
	cmd.Parameters.Append cmd.CreateParameter("@Player_Pad",200,,25)
	cmd.Parameters.Append cmd.CreateParameter("@Player_Interest",200,,500)
	cmd.Parameters.Append cmd.CreateParameter("@Player_Text",200,,50)
	cmd.Parameters.Append cmd.CreateParameter("@Player_Question",200,,50)
	cmd.Parameters.Append cmd.CreateParameter("@Player_Answer",200,,50)
	cmd.Parameters.Append cmd.CreateParameter("@Player_IsMaster",3)
	cmd.Parameters.Append cmd.CreateParameter("@Player_Image",3)
	cmd.Parameters.Append cmd.CreateParameter("@Result",200,2,20)
	
	cmd("@Player_Id") = Player_Id
	cmd("@Player_Name_Chinese") = Player_Name_Chinese
	cmd("@Player_Name_English") = Player_Name_English
	cmd("@Player_Name_Net") = Player_Name_Net
	cmd("@Player_Sex") = Player_Sex
	cmd("@Player_Area") = Player_Area
	cmd("@Player_Year") = Player_Sex
	cmd("@Player_Month") = Player_Month
	cmd("@Player_Email") = Player_Email
	cmd("@Player_QQ") = Player_QQ
	cmd("@Player_Mouse") = Player_Mouse
	cmd("@Player_Pad") = Player_Pad
	cmd("@Player_Interest") = Player_Interest
	cmd("@Player_Text") = Player_Text
	cmd("@Player_Question") = Player_Question
	cmd("@Player_Answer") = Player_Answer
	cmd("@Player_IsMaster") = Player_IsMaster
	cmd("@Player_Image") = Player_Image
	
	cmd.execute
	
	Result = cmd("@Result")
	Set cmd = Nothing
	Call End_Conn()
	
	Select Case Result
	
		Case "Edit_OK"

			Message = "编辑用户成功!"
			Act="top.location=top.location"
			Call Error()
			
		Case "Edit_Fail"
		
			Message = "此用户不存在!"
			Act = "No"
			Call Error()
			
	End Select

End If

Sub Get_Input()

	Player_Id = Request.Form("Player_Id")
	Player_IsMaster = Request.Form("Player_IsMaster")
	Player_Image = Request.Form("Player_Image")
	Player_Name_Chinese = Request.Form("Player_Name_Chinese")
	Player_Name_English	 = Request.Form("Player_Name_English")
	Player_Name_Net = Request.Form("Player_Name_Net")
	Player_Sex = Request.Form("Player_Sex")
	Player_Area = Request.Form("Player_Area")
	Player_Year = Request.Form("Player_Year")
	Player_Month = Request.Form("Player_Month")
	Player_Email = Request.Form("Player_Email")
	Player_QQ = Request.Form("Player_QQ")
	Player_Mouse = Request.Form("Player_Mouse")
	Player_Pad = Request.Form("Player_Pad")
	Player_Interest = Request.Form("Player_Interest")
	Player_Text = Request.Form("Player_Text")
	Player_Question = Request.Form("Player_Question")
	Player_Answer = Request.Form("Player_Answer")
	If Player_IsMaster = "" Then Player_IsMaster = 0
	If Player_Image = "" Then Player_Image = 0

End Sub

Sub Check_Input()

	Message = "No"
	

	If Check_Str(Player_Answer) Then Message = "您在[密码提问答案]中输入了非法字符!"
	If Player_Answer = "" Then Message = "请输入[密码提问答案]!"
	If Check_Str(Player_Question) Then Message = "您在[密码提示问题]中输入了非法字符!"
	If Player_Question = "" Then Message = "请输入[密码提示问题]!"
	If Check_Str(Player_Text) Then Message = "您在[录象标识文字]中输入了非法字符!"
	If Player_Text = "" Then Message = "请输入[录象标识文字]!"
	If Check_Str(Player_Name_Net) Then Message = "您在[网名]中输入了非法字符!"
	If Check_Express(Player_Name_English,"^(\w|\s){3,20}$") Then Message = "您输入的[姓名拼音]中存在非英文字符!"
	If Check_Express(Player_Name_English,"^([A-Z][a-z]{0,10}\s*){1,4}$") Then Message = "您输入的[姓名拼音]格式不合法,请参考示范拼音!"
	If Player_Name_English = "" Then Message = "请输入[姓名拼音]!"
	If Check_Express(Player_Name_Chinese,"^([\u4E00-\u9FA5]{2,12})$") Then Message = "您输入的[中文姓名]不合法!"
	If Player_Name_Chinese = "" Then Message = "请输入[中文姓名]!"
	
	If Message <> "No" Then
		Act="No"
		Call Error()
	End If	
	
End Sub
%>