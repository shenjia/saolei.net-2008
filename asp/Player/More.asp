<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-17
'------------------------
Dim Player_Id
%>
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
<!--#include virtual="/Models/Include/NoHtml.asp"-->
<%
Call Get_Input()
Call Start_Conn()

Set cmd = Server.CreateObject("ADODB.Command")
Set cmd.ActiveConnection = Conn
cmd.CommandText = "dbo.Player_More"
cmd.CommandType = &H0004

cmd.Parameters.Append cmd.CreateParameter("@Player_Id",3)
cmd.Parameters.Append cmd.CreateParameter("@Player_Name_Chinese",200,2,12)
cmd.Parameters.Append cmd.CreateParameter("@Player_Name_English",200,2,20)
cmd.Parameters.Append cmd.CreateParameter("@Player_Name_Net",200,2,20)
cmd.Parameters.Append cmd.CreateParameter("@Player_Area",200,2,12)
cmd.Parameters.Append cmd.CreateParameter("@Player_Sex",3,2)
cmd.Parameters.Append cmd.CreateParameter("@Player_Year",3,2)
cmd.Parameters.Append cmd.CreateParameter("@Player_Month",3,2)
cmd.Parameters.Append cmd.CreateParameter("@Player_Email",200,2,50)
cmd.Parameters.Append cmd.CreateParameter("@Player_QQ",200,2,12)
cmd.Parameters.Append cmd.CreateParameter("@Player_Mouse",200,2,25)
cmd.Parameters.Append cmd.CreateParameter("@Player_Pad",200,2,25)
cmd.Parameters.Append cmd.CreateParameter("@Player_Interest",200,2,500)

cmd("@Player_Id") = Player_Id
cmd.execute

Player_Name_Chinese = cmd("@Player_Name_Chinese")
Player_Name_English = cmd("@Player_Name_English")
Player_Name_Net = cmd("@Player_Name_Net")
Player_Area = cmd("@Player_Area")
Player_Sex = cmd("@Player_Sex")
Player_Year = cmd("@Player_Year")
Player_Month = cmd("@Player_Month")
Player_Email = cmd("@Player_Email")
Player_QQ = cmd("@Player_QQ")
Player_Mouse = cmd("@Player_Mouse")
Player_Pad = cmd("@Player_Pad")
Player_Interest = cmd("@Player_Interest")

Set cmd = Nothing
Call End_Conn()

If Player_Name_Net = "" Then Player_Name_Net = "无"
If Player_Email = "" Then Player_Email = "无"
If Player_QQ = "" Then Player_QQ = "无"
If Player_Mouse = "" Then Player_Mouse = "杂牌"
If Player_Pad = "" Then Player_Pad = "杂牌"
If Player_Interest = "" Then Player_Interest = "无"

If Player_Sex Then
	Player_Sex_Text = "GG"
Else
	Player_Sex_Text = "mm"
End If
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #333333;
}
.tbl {table-layout:fixed}
.td {overflow:hidden;}
-->
</style>
<link href="/Models/Css/2008.css" rel="stylesheet" type="text/css">
</head>
<body onLoad="parent.document.getElementById('Info').style.display='block';">
<table width="280" border="0" cellspacing="5" cellpadding="0" class="tbl">
  <tr>
    <td class="Text">
	<span class="Sign"><%=Player_Name_Chinese%></span>(<%=Player_Name_English%>)　<span class="Title"><%=Player_Area%></span><span class="Counter"><%=Player_Sex_Text%></span>&nbsp;
	<%If Player_Year > 0 Then%><span class="Title"><%=Player_Year%></span>年<span class="Title"><%=Player_Month%></span>月生<%End If%><br>
	网名：<%=Player_Name_Net%>　ＱＱ：<%=Player_QQ%><br>
	Email：<span class="Sign"><%=NoHtml(Player_Email)%></span><br>
	鼠标：<span class="Title"><%=NoHtml(Player_Mouse)%></span><br>
	鼠标垫：<span class="Title"><%=NoHtml(Player_Pad)%></span><br>
	</div>
	  <div class="Text">
	    兴趣爱好：<%=NoHtml(Player_Interest)%>
	        </div></td>
  </tr>
</table>
</body>
</html>
<%
Sub Get_Input()

	Player_Id = Request("Id")

End Sub
%>
