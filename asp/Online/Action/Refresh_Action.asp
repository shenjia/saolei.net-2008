<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-31
'------------------------
%>
<!--#include virtual="/Player/Check.asp"-->
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
<!--#include virtual="/Models/Common/Function.asp"-->
<%
	Call Start_Conn()
	
	SQL_Text = "Online_Refresh "
	rs.Open SQL_Text,Conn,3,1
		
		Do While Not rs.Eof
			response.Write(rs("table_id")&",")
			response.Write(rs("player_id")&",")
			response.Write(rs("player_score")&",")
			response.Write(rs("player_time")&"<br>")
			%><%
			rs.MoveNext
		Loop	
		Call End_Conn()	
		
%>