<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-13
'------------------------
Dim Player_Name
%>
<!--#include virtual="/Models/Common/Error.asp"-->
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
<!--#include virtual="/Models/Common/Function.asp"-->
<%
Call Get_Input()

If Player_Name<>"" And Not Check_Express(Player_Name,"^\w{3,12}$") Then 
	
	Call Start_Conn()
	
	Set cmd = Server.CreateObject("ADODB.Command")
	Set cmd.ActiveConnection = Conn
	cmd.CommandText = "dbo.Player_Name_Check"
	cmd.CommandType = &H0004
	
	cmd.Parameters.Append cmd.CreateParameter("@Player_Name",200,,12)
	cmd.Parameters.Append cmd.CreateParameter("@Result",200,2,20)
	
	cmd("@Player_Name") = Player_Name
	
	cmd.execute
	
	Result = cmd("@Result")
	Set cmd = Nothing
	Call End_Conn()
	
	Select Case Result
	
		Case "Check_OK"
			
			Message = "No"
			Act = "parent.document.all.Check_Name.innerHTML='<b>√<b>';parent.document.all.Check_Name.style.display='';"
			Call Error()
			
		Case "Check_Fail"			
		
			Message = "No"
			Act = "parent.document.all.Check_Name.innerHTML='&nbsp;登录名称已被使用,请更换!';parent.document.all.Check_Name.style.display='';"
			Call Error()
				
	End Select
	
End If

Sub Get_Input()

	Player_Name = Request("Name")

End Sub
%>