<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-12
'------------------------
Dim Player_Name
Dim Player_Password
%>
<!--#include virtual="/Models/Common/Error.asp"-->
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
	cmd.CommandText = "dbo.Player_Login"
	cmd.CommandType = &H0004
	
	cmd.Parameters.Append cmd.CreateParameter("@Player_Name",200,,12)
	cmd.Parameters.Append cmd.CreateParameter("@Player_Password",200,,12)
	cmd.Parameters.Append cmd.CreateParameter("@Player_IP",200,,15)
	cmd.Parameters.Append cmd.CreateParameter("@Player_Id",3,2)
	cmd.Parameters.Append cmd.CreateParameter("@Player_Name_Chinese",200,2,12)
	cmd.Parameters.Append cmd.CreateParameter("@Player_Name_English",200,2,20)
	cmd.Parameters.Append cmd.CreateParameter("@Player_Login_Time",135,2)
	cmd.Parameters.Append cmd.CreateParameter("@Player_IsMaster",3,2)
	cmd.Parameters.Append cmd.CreateParameter("@Player_Area",200,2,12)
	cmd.Parameters.Append cmd.CreateParameter("@Player_Sex",3,2)
	cmd.Parameters.Append cmd.CreateParameter("@Player_Rank",3,2)
	cmd.Parameters.Append cmd.CreateParameter("@Result",200,2,20)
	
	cmd("@Player_Name") = Player_Name
	cmd("@Player_Password") = Player_Password
	cmd("@Player_IP") = Request.ServerVariables("REMOTE_ADDR")
	
	cmd.execute
	
	Result = cmd("@Result")
	
	Select Case Result
	
		Case "Login_Ok"
			
			Session("Player_Id") = CInt(cmd("@Player_Id"))
			Session("Player_Name") = Player_Name
			Session("Player_Name_Chinese") = cmd("@Player_Name_Chinese")
			Session("Player_Name_English") = cmd("@Player_Name_English")
			Session("Player_Login_Time") = cmd("@Player_Login_Time")
			Session("Player_IsMaster") = cmd("@Player_IsMaster")
			Session("Player_Area") = cmd("@Player_Area")
			Session("Player_Sex") = cmd("@Player_Sex")
			Session("Player_Rank") = cmd("@Player_Rank")
			If Session("Player_Sex") Then
				Session("Player_Sex_Text") = "GG"
			Else
				Session("Player_Sex_Text") = "mm"
			End If
			
			Set cmd = Nothing
			Call End_Conn()
			
			If IsNumeric(Session("Player_Rank")) Then Session("Player_Rank") = CInt(Session("Player_Rank"))
			If IsNumeric(Session("Player_Old_Rank")) Then Session("Player_Old_Rank") = CInt(Session("Player_Old_Rank"))

			Response.Cookies("Saolei.net")("Player_Name") = Session("Player_Name")
			Response.Cookies("Saolei.net")("Player_Name_Chinese") = Session("Player_Name_Chinese")
			Response.Cookies("Saolei.net")("Player_Password") = Player_Password
			Response.Cookies("Saolei.net").Expires = Date()+365
			
			Message = "No"
			Act = "top.location=top.location"
			Call Error()
			
		Case "Login_Fail_Exist"			
		
			Set cmd = Nothing
			Call End_Conn()
		
			Message = "登陆名称不存在!"
			Act = "No"
			Call Error()
			
		Case "Login_Fail_Password"			
		
			Set cmd = Nothing
			Call End_Conn()
		
			Message = "登陆密码错误!"
			Act = "No"
			Call Error()
			
		Case "Login_Fail_Live"			
		
			Set cmd = Nothing
			Call End_Conn()
		
			Message = "此用户已被封停,可能违规或录象受到置疑,请速与管理员(qq137516)联系!"
			Act="top.location=top.location"
			Call Error()
				
	End Select
	
End If

Sub Get_Input()

	Player_Name = Request.Form("Player_Name")
	Player_Password = Request.Form("Player_Password")

End Sub

Sub Check_Input()

	Message = "No"
	If Check_Str(Player_Password) Then Message = "您在[登陆密码]中输入了非法字符!"
	If Player_Password = "" Then Message = "请输入[登陆密码]!"
	If Check_Express(Player_Name,"^\w{3,12}$") Then Message = "您输入的[登陆名称]不合法!"
	If Player_Name = "" Then Message = "请输入[登陆名称]!"
	
	If Message <> "No" Then
		Act="No"
		Call Error()
	End If	
	
End Sub
%>