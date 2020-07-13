<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-12
'------------------------
%>
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
<%
Call Start_Conn()

Set cmd = Server.CreateObject("ADODB.Command")
Set cmd.ActiveConnection = Conn
cmd.CommandText = "dbo.Satus"
cmd.CommandType = &H0004

cmd.Parameters.Append cmd.CreateParameter("@Player_Number",3,2)
cmd.Parameters.Append cmd.CreateParameter("@Player_Number_GG",3,2)
cmd.Parameters.Append cmd.CreateParameter("@Player_Number_MM",3,2)
cmd.Parameters.Append cmd.CreateParameter("@Rank_Number",3,2)
cmd.Parameters.Append cmd.CreateParameter("@Rank_Number_GG",3,2)
cmd.Parameters.Append cmd.CreateParameter("@Rank_Number_MM",3,2)
cmd.Parameters.Append cmd.CreateParameter("@Rank_Month_Number",3,2)
cmd.Parameters.Append cmd.CreateParameter("@Rank_Month_Number_GG",3,2)
cmd.Parameters.Append cmd.CreateParameter("@Rank_Month_Number_MM",3,2)
cmd.Parameters.Append cmd.CreateParameter("@Video_Number",3,2)
cmd.Parameters.Append cmd.CreateParameter("@Video_Today",3,2)
cmd.Parameters.Append cmd.CreateParameter("@Title_Number",3,2)
cmd.Parameters.Append cmd.CreateParameter("@Title_Today",3,2)
cmd.Parameters.Append cmd.CreateParameter("@Avg_Beg",5,2)
cmd.Parameters.Append cmd.CreateParameter("@Avg_Int",5,2)
cmd.Parameters.Append cmd.CreateParameter("@Avg_Exp",5,2)
cmd.Parameters.Append cmd.CreateParameter("@Counter",3,2)
cmd.Parameters.Append cmd.CreateParameter("@Counter_Today",3,2)

cmd.execute

Player_Number = cmd("@Player_Number")
Player_Number_GG = cmd("@Player_Number_GG")
Player_Number_MM = cmd("@Player_Number_MM")
Rank_Number = cmd("@Rank_Number")
Rank_Number_GG = cmd("@Rank_Number_GG")
Rank_Number_MM = cmd("@Rank_Number_MM")
Rank_Month_Number = cmd("@Rank_Month_Number")
Rank_Month_Number_GG = cmd("@Rank_Month_Number_GG")
Rank_Month_Number_MM = cmd("@Rank_Month_Number_MM")
Video_Number = cmd("@Video_Number")
Video_Today = cmd("@Video_Today")
Title_Number = cmd("@Title_Number")
Title_Today = cmd("@Title_Today")
Avg_Beg = cmd("@Avg_Beg")
Avg_Int = cmd("@Avg_Int")
Avg_Exp = cmd("@Avg_Exp")
Avg_Sum = Avg_Beg+Avg_Int+Avg_Exp
Counter = cmd("@Counter")
Counter_Today = cmd("@Counter_Today")

Set cmd = Nothing

Call End_Conn()
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
body {
	margin-left: 5px;
	margin-top: 5px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #333333;
}
-->
</style>
<link href="/Models/Css/2008.css" rel="stylesheet" type="text/css">
</head>
<body onLoad="parent.Info.style.display='';">
<table width="280" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="1"></td>
    <td width="164" class="Text">
	雷界排行人数：<span class="Signest"><%=Rank_Number%></span>&nbsp;位<br>
	雷界众生总数：<span class="Title"><%=Player_Number%></span>&nbsp;位<br>
	雷界本月新人：<span class="Signest"><%=Rank_Month_Number%></span>&nbsp;位<br>
	上传录像总数：<span class="Title"><%=Video_Number%></span>&nbsp;个<br>
	论坛主题总数：<span class="Title"><%=Title_Number%></span>&nbsp;篇<br>
	雷界人气统计：<span class="Title"><%=Counter%></span>&nbsp;次	<br>
	</td>
    <td width="115" valign="top" class="Text">
	<span class="Counter">GG:</span>&nbsp;<span class="Title"><%=Rank_Number_GG%></span> <span class="Counter">mm: </span><span class="Title"><%=Rank_Number_MM%></span> <br>
    <span class="Counter">GG:</span>&nbsp;<span class="Title"><%=Player_Number_GG%></span> <span class="Counter">mm: </span><span class="Title"><%=Player_Number_MM%></span><br>
	<span class="Counter">GG:</span>&nbsp;<span class="Title"><%=Rank_Month_Number_GG%></span> <span class="Counter">mm: </span><span class="Title"><%=Rank_Month_Number_MM%></span> <br>
    本日更新：<span class="Signest"><%=Video_Today%></span>&nbsp;个 <br>
    本日更新：<span class="Signest"><%=Title_Today%></span>&nbsp;篇<br>
    本日人气：<span class="Title"><%=Counter_Today%></span>&nbsp;次</td>
  </tr>
  <tr>
    <td></td>
    <td colspan="2" class="Text">	雷界平均成绩：<span class="Beg"><%=FormatNumber(Avg_Beg,2)%></span>&nbsp;+&nbsp;<span class="Int"><%=FormatNumber(Avg_Int,2)%></span>&nbsp;+&nbsp;<span class="Exp"><%=FormatNumber(Avg_Exp,2)%></span>&nbsp;=&nbsp;<span class="Signest"><%=FormatNumber(Avg_Sum,2)%></span> <br>
	</td>
  </tr>
</table>
</body>
</html>
