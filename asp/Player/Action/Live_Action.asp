<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-31
'------------------------
Dim Player_Id
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
	
	SQL_Text = "Player_Read "&Player_Id
	rs.Open SQL_Text,Conn,1,3

	Player_IsMaster = rs("Player_IsMaster")	
	Player_IsLive = rs("Player_IsLive")	
		
	Call End_Conn()
	
	If Player_IsMaster And Session("Player_Id") <> "1" Then
		If Player_IsLive Then
			Action = "封停"
		Else
			Action = "激活"
		End If
		Message = "你无权"&Action&"此用户！"
		Act = "Back"
		Call Error()
		
	Else	

		Call Start_Conn()
	
		Set cmd = Server.CreateObject("ADODB.Command")
		Set cmd.ActiveConnection = Conn
		cmd.CommandText = "dbo.Player_Live"
		cmd.CommandType = &H0004
		
		cmd.Parameters.Append cmd.CreateParameter("@Player_Id",200,,6)
		cmd.Parameters.Append cmd.CreateParameter("@Admin_Id",3)
		cmd.Parameters.Append cmd.CreateParameter("@Result",200,2,20)
		
		cmd("@Player_Id") = Player_Id
		cmd("@Admin_Id") = Session("Player_Id")
		
		cmd.execute
		
		Result = cmd("@Result")
		Set cmd = Nothing
		Call End_Conn()
		
		Select Case Result
		
			Case "Live_On"
	
				Message = "激活用户成功!"
				Act="top.location=top.location"
				Call Error()
		
			Case "Live_Off"
	
				Message = "封停用户成功!"
				Act="top.location=top.location"
				Call Error()
				
			Case "Live_Fail"
			
				Message = "此用户不存在!"
				Act = "No"
				Call Error()
				
		End Select

	End If

End If

Sub Get_Input()

	Player_Id = Request("Id")

End Sub

Sub Check_Input()

	Message = "No"
	
	If Player_Id <> "" And Check_Express(Player_Id,"\d{1,6}") Then Message = "您指定的[用户ID]不合法!"
	
	If Message <> "No" Then
		Act="Back"
		Call Error()
	End If	
	
End Sub
%>