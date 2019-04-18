<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-11
'------------------------
Dim Conn
Dim rs

Public Sub Start_Conn()

	On Error Resume Next
	Set Conn = Server.CreateObject("ADODB.CONNECTION")
	Conn.ConnectionTimeOut = 2
	If Err.Number <> 0 Then
		Err.Clear
		Set Conn = Nothing
		Response.Write "数据库连接失败,请检查是否安装了数据库软件!"
		Response.End
	Else
		Set rs = Server.CreateObject("ADODB.RECORDSET")
		If Err.Number <> 0 Then
			Err.Clear
			Set Conn = Nothing
			Response.Write "打开数据库失败"
			Response.End
		Else
			Conn.CommandTimeout = 1000
			Conn.Open CONST_DATABASE_CONN
			If Err.number <> 0 Then
Response.Write Err.Description
				Err.Clear
				Set Conn = Nothing
				Response.Write "数据库连接失败,请检查数据库是否存在!"
				Response.End
			End If
		End If
	End If
End Sub

Public Sub End_Conn()

	On Error Resume Next	
	Conn.Close	
	If Err.Number <> 0 Then
		Err.Clear
		Response.Write "数据库连接关闭失败!"
		Response.End
	End If
	Set rs = Nothing
	Set Conn = Nothing

End Sub
%>