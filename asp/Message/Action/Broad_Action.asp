<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-17
'------------------------
Response.Buffer = True
Dim Player(20000)
%>
<!--#include virtual="/Player/Check.asp"-->
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
<!--#include virtual="/Models/Include/Bar.asp"-->
<%
Act = "Top_Go"
Call Check_Master()

If Check_Result <> "Fail" Then
	
	%><script>
	function o(Name,Width)
	{
		parent.document.getElementById('Bar_'+Name).width=Width;
	}
	parent.document.all.Broad.innerText='正在进行消息广播...';</script>
	<%Response.Flush()
	
	Call Start_Conn()
	
	SQL_Text="exec Player_List"
	
	rs.Open SQL_Text,Conn,1,3
	
	Player_Number = CInt(rs("Player_Number"))

	For I = 1 To Player_Number
	
		Player(I) = rs("Player_Id")
		rs.Movenext
		
	Next
	
	rs.Close
	
	Message_Text = Request("Message_Text")
	
	Set cmd = Server.CreateObject("ADODB.Command")
	Set cmd.ActiveConnection = Conn
	cmd.CommandText = "dbo.Message_Send"
	cmd.CommandType = &H0004
	
	cmd.Parameters.Append cmd.CreateParameter("@Message_To",3)
	cmd.Parameters.Append cmd.CreateParameter("@Message_From",3)
	cmd.Parameters.Append cmd.CreateParameter("@Message_Text",200,,500)
	cmd.Parameters.Append cmd.CreateParameter("@Result",200,2,20)
	
	For I = 1 To Player_Number

		cmd("@Message_To") = Player(I)
		cmd("@Message_From")=Session("Player_Id")
		cmd("@Message_Text") = Message_Text
		cmd.execute
		Call Bar_Go("Broad",1,Player_Number,340)

	Next 
	
	Call End_Conn()
	
	%><script>	
	parent.document.all.Broad.innerText='消息广播完成!!!';
	var handle;
	handle=setTimeout("Cancel()",1000);
	function Cancel()
	{
			top.End_Mask();
			top.document.getElementById('Window_Box').style.display='none';
	}
	</script>
	<%Response.Flush()
	
End If
%>