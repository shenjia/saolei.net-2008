<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-17
'------------------------
Response.Buffer = True
Dim Areas(100)
Dim Hero(500)
Dim Video(200)
Dim Man(10000)
%>
<!--#include virtual="/Player/Check.asp"-->
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
<!--#include virtual="/Models/Include/Bar.asp"-->
<%
Act = "Top_Go"
Call Check_Master()

If Check_Result <> "Fail" Then
	
	%>
	<script language="javascript">
	function o(Name,Width)
	{
		parent.document.getElementById('Bar_'+Name).width=Width;
	}
	parent.document.getElementById('Ranking').innerHTML='正在刷新神界排行...';</script>
	<%Response.Flush()
	
	Call Start_Conn()
	
	SQL_Text="exec Ranking_Hero_List"
	
	rs.Open SQL_Text,Conn,1,3
	
	Hero_Number = CInt(rs("Hero_Number"))

	For I = 1 To Hero_Number
	
		Hero(I) = rs("Player_Id")
		rs.Movenext
		
	Next
	
	rs.Close
	
	Set cmd = Server.CreateObject("ADODB.Command")
	Set cmd.ActiveConnection = Conn
	cmd.CommandText = "dbo.Ranking_Refresh"
	cmd.CommandType = &H0004
	
	cmd.Parameters.Append cmd.CreateParameter("@Player_Id",3)
	cmd.Parameters.Append cmd.CreateParameter("@Player_Rank",3)
	
	For I = 1 To Hero_Number

		cmd("@Player_Id")=Hero(I)
		cmd("@Player_Rank")=I
		cmd.execute
		Call Bar_Go("Refresh",1,Hero_Number,340)

	Next 
	
	Call End_Conn()
	
	Call Bar_Reset("Refresh")

	%><script>parent.document.getElementById('Ranking').innerHTML='正在刷新人界排行...';</script>
	<%Response.Flush()
	
	Call Start_Conn()
	
	SQL_Text="exec Ranking_Man_List"
	
	rs.Open SQL_Text,Conn,1,3
	
	Man_Number = CInt(rs("Man_Number"))
	
	For I = 1 To Man_Number
	
		Man(I) = rs("Player_Id")
		rs.Movenext
		
	Next
	
	rs.Close
	
	Set cmd = Server.CreateObject("ADODB.Command")
	Set cmd.ActiveConnection = Conn
	cmd.CommandText = "dbo.Ranking_Refresh"
	cmd.CommandType = &H0004
	
	cmd.Parameters.Append cmd.CreateParameter("@Player_Id",3)
	cmd.Parameters.Append cmd.CreateParameter("@Player_Rank",3)
	
	For I = 1 To Man_Number

		cmd("@Player_Id")=Man(I)
		cmd("@Player_Rank")=I
		cmd.execute
		Call Bar_Go("Refresh",1,Man_Number,340)

	Next 
	
	Call End_Conn()
	
	Call Start_Conn()
	
	Set cmd = Server.CreateObject("ADODB.Command")
	Set cmd.ActiveConnection = Conn
	cmd.CommandText = "dbo.Ranking_Refresh_End"
	cmd.CommandType = &H0004
	
	cmd.Parameters.Append cmd.CreateParameter("@Hero_Number",3)
	
	cmd("@Hero_Number")=Hero_Number
	cmd.execute
		
	Call End_Conn()
	
	Call Bar_Reset("Refresh")

	%><script>parent.document.getElementById('Ranking').innerHTML='正在刷新地区排行...';</script>
	<%Response.Flush()
	
	Call Start_Conn()
	
	SQL_Text="exec Ranking_Area_List"
	
	rs.Open SQL_Text,Conn,1,3
	
	Area_Number = CInt(rs("Area_Number"))
	
	For I = 1 To Area_Number
	
		Areas(I) = rs("Area_Name")
		rs.Movenext
		
	Next
	
	rs.Close
	
	Set cmd = Server.CreateObject("ADODB.Command")
	Set cmd.ActiveConnection = Conn
	cmd.CommandText = "dbo.Ranking_Area_Refresh"
	cmd.CommandType = &H0004
	
	cmd.Parameters.Append cmd.CreateParameter("@Area_Name",200,,10)
	
	For I = 1 To Area_Number

		cmd("@Area_Name")=Areas(I)
		cmd.execute
		Call Bar_Go("Refresh",1,Area_Number,340)

	Next 

	Call End_Conn()
	
	Call Bar_Reset("Refresh")

	%><script>parent.document.getElementById('Ranking').innerHTML='正在删除过期冻结录像...';</script>
	<%Response.Flush()
	
	Call Start_Conn()
	
	SQL_Text="exec Video_Del_List"
	
	rs.Open SQL_Text,Conn,1,3
	
	If Not rs.Eof Then
	
		Video_Number = CInt(rs("Video_Number"))
		
		For I = 1 To Video_Number
		
			Video(I) = rs("Video_Id")
			rs.Movenext
			
		Next
		
		rs.Close
		
		On Error Resume Next
		
		Set cmd = Server.CreateObject("ADODB.Command")
		Set cmd.ActiveConnection = Conn
		cmd.CommandText = "dbo.Video_Del_Refresh"
		cmd.CommandType = &H0004
		
		cmd.Parameters.Append cmd.CreateParameter("@Video_Id",3)
		cmd.Parameters.Append cmd.CreateParameter("@Video_Path",200,2,100)
		cmd.Parameters.Append cmd.CreateParameter("@Result",200,2,20)
		
		Set fso = CreateObject("Scripting.FileSystemObject")
	
		For I = 1 To Video_Number
	
			cmd("@Video_Id")=Video(I)
			cmd.execute
			fso.DeleteFile(Server.MapPath(cmd("@Video_Path")))
			Call Bar_Go("Refresh",1,Video_Number,340)
	
		Next 
		
	End If
	
	Call Bar_Go("Refresh",100,100,340)

	Call End_Conn()
	%><script>	
	parent.document.getElementById('Ranking').innerHTML='刷新排行完成!!!';
	var handle;
	handle=setTimeout("Cancel()",1000);
	function Cancel()
	{
			top.End_Mask();
			top.document.getElementById('Window_Box').style.display='none';
			top.location=top.location;
	}
	</script>
	<%Response.Flush()
	
End If
%>