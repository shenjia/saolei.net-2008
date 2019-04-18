<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
<%
Call Start_Conn()

SQL_Text="select Video_Id,Video_Score,Video_3BV,Video_Path,Video_Model,Video_Player,(select Player_Name_English from Player where Player_Id=Video_Player) as Video_Player_Name from Video where video_move=0 order by video_id"

rs.Open SQL_Text,Conn,1,3

Set fso = CreateObject("Scripting.FileSystemObject")

Set cmd = Server.CreateObject("ADODB.Command")
Set cmd.ActiveConnection = Conn
cmd.CommandText = "dbo.Video_Move"
cmd.CommandType = &H0004

cmd.Parameters.Append cmd.CreateParameter("@Video_Id",3)
cmd.Parameters.Append cmd.CreateParameter("@Video_Path",200,,100)

Do While not rs.Eof

	Video_Path = "/Video/Mvf/"&rs("Video_Player")&"/"&rs("Video_Player_Name")&"_"&rs("Video_Model")&"_"&FormatNumber(rs("Video_Score"),2)&"(3bv"&rs("Video_3BV")&").mvf"
	response.Write(Server.MapPath(rs("Video_Path"))&"<br>")
	call fso.MoveFile(Server.MapPath(rs("Video_Path")),Server.MapPath(Video_Path))
	cmd("@Video_Id") = rs("Video_Id")
	cmd("@Video_Path") = Video_Path
	cmd.execute
	rs.Movenext
	
Loop

rs.Close

Call End_Conn()

%>