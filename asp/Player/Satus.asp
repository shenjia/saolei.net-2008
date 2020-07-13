<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-17
'------------------------
Dim Player_Id
%>
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
<!--#include virtual="/Models/Include/Bar.asp"-->
<%
Call Get_Input()
Call Start_Conn()

Set cmd = Server.CreateObject("ADODB.Command")
Set cmd.ActiveConnection = Conn
cmd.CommandText = "dbo.Player_Satus"
cmd.CommandType = &H0004

cmd.Parameters.Append cmd.CreateParameter("@Player_Id",3)
cmd.Parameters.Append cmd.CreateParameter("@Player_Beg_3BVS_Score",5,2)
cmd.Parameters.Append cmd.CreateParameter("@Player_Int_Time_Score",5,2)
cmd.Parameters.Append cmd.CreateParameter("@Player_Int_3BVS_Score",5,2)
cmd.Parameters.Append cmd.CreateParameter("@Player_Exp_Time_Score",5,2)
cmd.Parameters.Append cmd.CreateParameter("@Player_Exp_3BVS_Score",5,2)
cmd.Parameters.Append cmd.CreateParameter("@Player_Sum_Time_Score",5,2)
cmd.Parameters.Append cmd.CreateParameter("@Player_Sum_3BVS_Score",5,2)
cmd.Parameters.Append cmd.CreateParameter("@Best_Beg_3BVS_Score",5,2)
cmd.Parameters.Append cmd.CreateParameter("@Best_Int_Time_Score",5,2)
cmd.Parameters.Append cmd.CreateParameter("@Best_Int_3BVS_Score",5,2)
cmd.Parameters.Append cmd.CreateParameter("@Best_Exp_Time_Score",5,2)
cmd.Parameters.Append cmd.CreateParameter("@Best_Exp_3BVS_Score",5,2)
cmd.Parameters.Append cmd.CreateParameter("@Best_Sum_Time_Score",5,2)
cmd.Parameters.Append cmd.CreateParameter("@Best_Sum_3BVS_Score",5,2)

cmd("@Player_Id") = Player_Id

cmd.execute

Player_Beg_3BVS = cmd("@Player_Beg_3BVS_Score")
Player_Int_Score = cmd("@Player_Int_Time_Score")
Player_Int_3BVS = cmd("@Player_Int_3BVS_Score")
Player_Exp_Score = cmd("@Player_Exp_Time_Score")
Player_Exp_3BVS = cmd("@Player_Exp_3BVS_Score")
Player_Sum_Score = cmd("@Player_Sum_Time_Score")
Player_Sum_3BVS = cmd("@Player_Sum_3BVS_Score")
Best_Beg_3BVS = cmd("@Best_Beg_3BVS_Score")
Best_Int_Score = cmd("@Best_Int_Time_Score")
Best_Int_3BVS = cmd("@Best_Int_3BVS_Score")
Best_Exp_Score = cmd("@Best_Exp_Time_Score")
Best_Exp_3BVS = cmd("@Best_Exp_3BVS_Score")
Best_Sum_Score = cmd("@Best_Sum_Time_Score")
Best_Sum_3BVS = cmd("@Best_Sum_3BVS_Score")

Set cmd = Nothing

Call End_Conn()

If isNull(Player_Int_Score) Then Player_Int_Score = 999.99
If isNull(Player_Exp_Score) Then Player_Exp_Score = 999.99
If isNull(Player_Sum_Score) Then Player_Sum_Score = 999.99
If Player_Int_Score = 999.99 Then Best_Int_Score = 0
If Player_Exp_Score = 999.99 Then Best_Exp_Score = 0
If Player_Sum_Score = 999.99 Then Best_Sum_Score = 0
If isNull(Player_Beg_3BVS) Then Player_Beg_3BVS = 0
If isNull(Player_Int_3BVS) Then Player_Int_3BVS = 0
If isNull(Player_Exp_3BVS) Then Player_Exp_3BVS = 0
If isNull(Player_Sum_3BVS) Then Player_Sum_3BVS = 0
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
-->
</style>
<link href="/Models/Css/2008.css" rel="stylesheet" type="text/css">
</head>
<body onLoad="parent.document.getElementById('Do').style.display='block';">
<table width="290" border="0" cellspacing="7" cellpadding="0">
	<tr>
	<td>
<table width="270" border="0" cellspacing="0" cellpadding="0">
  <tr class="Text" onMouseOver="Player_Beg_3BVS.className='High';Box_Beg_3BVS.style.background='#999999';Bar_Beg_3BVS.style.background='#999999';Best_Beg_3BVS.className='Counter';" onMouseOut="Player_Beg_3BVS.className='Text';Box_Beg_3BVS.style.background='#777777';Bar_Beg_3BVS.style.background='#777777';Best_Beg_3BVS.className='Counters';">
    <td id="Player_Beg_3BVS" width="66" align="left" valign="middle" class="Text">初级3BV/s</td>
    <td width="170" align="left" valign="middle">
	<%Call Bar("Beg_3BVS",Player_Beg_3BVS,Best_Beg_3BVS,160,10)%>
	</td>
    <td id="Best_Beg_3BVS" width="40" align="center" valign="middle" class="Counters"><%=FormatNumber(Player_Beg_3BVS,2,True)%></td>
  </tr>
  <tr class="Text" onMouseOver="Player_Int_Score.className='High';Box_Int_Score.style.background='#999999';Bar_Int_Score.style.background='#999999';Best_Int_Score.className='Counter';" onMouseOut="Player_Int_Score.className='Text';Box_Int_Score.style.background='#777777';Bar_Int_Score.style.background='#777777';Best_Int_Score.className='Counters';">
    <td id="Player_Int_Score" width="66" align="left" valign="middle" class="Text">中级成绩</td>
    <td width="170" align="left" valign="middle">
	<%Call Bar("Int_Score",Best_Int_Score,Player_Int_Score,160,10)%>
	</td>
    <td id="Best_Int_Score" width="40" align="center" valign="middle" class="Counters"><%=FormatNumber(Player_Int_Score,2,True)%></td>
  </tr>
  <tr class="Text" onMouseOver="Player_Int_3BVS.className='High';Box_Int_3BVS.style.background='#999999';Bar_Int_3BVS.style.background='#999999';Best_Int_3BVS.className='Counter';" onMouseOut="Player_Int_3BVS.className='Text';Box_Int_3BVS.style.background='#777777';Bar_Int_3BVS.style.background='#777777';Best_Int_3BVS.className='Counters';">
    <td id="Player_Int_3BVS" width="66" align="left" valign="middle" class="Text">中级3BV/s</td>
    <td width="170" align="left" valign="middle">
	<%Call Bar("Int_3BVS",Player_Int_3BVS,Best_Int_3BVS,160,10)%>
	</td>
    <td id="Best_Int_3BVS" width="40" align="center" valign="middle" class="Counters"><%=FormatNumber(Player_Int_3BVS,2,True)%></td>
  </tr>
  <tr class="Text" onMouseOver="Player_Exp_Score.className='High';Box_Exp_Score.style.background='#999999';Bar_Exp_Score.style.background='#999999';Best_Exp_Score.className='Counter';" onMouseOut="Player_Exp_Score.className='Text';Box_Exp_Score.style.background='#777777';Bar_Exp_Score.style.background='#777777';Best_Exp_Score.className='Counters';">
    <td id="Player_Exp_Score" width="66" align="left" valign="middle" class="Text">高级成绩</td>
    <td width="170" align="left" valign="middle">
	<%Call Bar("Exp_Score",Best_Exp_Score,Player_Exp_Score,160,10)%>
	</td>
    <td id="Best_Exp_Score" width="40" align="center" valign="middle" class="Counters"><%=FormatNumber(Player_Exp_Score,2,True)%></td>
  </tr>
  <tr class="Text" onMouseOver="Player_Exp_3BVS.className='High';Box_Exp_3BVS.style.background='#999999';Bar_Exp_3BVS.style.background='#999999';Best_Exp_3BVS.className='Counter';" onMouseOut="Player_Exp_3BVS.className='Text';Box_Exp_3BVS.style.background='#777777';Bar_Exp_3BVS.style.background='#777777';Best_Exp_3BVS.className='Counters';">
    <td id="Player_Exp_3BVS" width="66" align="left" valign="middle" class="Text">高级3BV/s</td>
    <td width="170" align="left" valign="middle">
	<%Call Bar("Exp_3BVS",Player_Exp_3BVS,Best_Exp_3BVS,160,10)%>
	</td>
    <td id="Best_Exp_3BVS" width="40" align="center" valign="middle" class="Counters"><%=FormatNumber(Player_Exp_3BVS,2,True)%></td>
  </tr>
  <tr class="Text" onMouseOver="Player_Sum_Score.className='High';Box_Sum_Score.style.background='#999999';Bar_Sum_Score.style.background='#999999';Best_Sum_Score.className='Counter';" onMouseOut="Player_Sum_Score.className='Text';Box_Sum_Score.style.background='#777777';Bar_Sum_Score.style.background='#777777';Best_Sum_Score.className='Counters';">
    <td id="Player_Sum_Score" width="66" align="left" valign="middle" class="Text">总计成绩</td>
    <td width="170" align="left" valign="middle">
	<%Call Bar("Sum_Score",Best_Sum_Score,Player_Sum_Score,160,10)%>
	</td>
    <td id="Best_Sum_Score" width="40" align="center" valign="middle" class="Counters"><%=FormatNumber(Player_Sum_Score,2,True)%></td>
  </tr>
  <tr class="Text" onMouseOver="Player_Sum_3BVS.className='High';Box_Sum_3BVS.style.background='#999999';Bar_Sum_3BVS.style.background='#999999';Best_Sum_3BVS.className='Counter';" onMouseOut="Player_Sum_3BVS.className='Text';Box_Sum_3BVS.style.background='#777777';Bar_Sum_3BVS.style.background='#777777';Best_Sum_3BVS.className='Counters';">
    <td id="Player_Sum_3BVS" width="66" align="left" valign="middle" class="Text">总计3BV/s</td>
    <td width="170" align="left" valign="middle">
	<%Call Bar("Sum_3BVS",Player_Sum_3BVS,Best_Sum_3BVS,160,10)%>
	</td>
    <td id="Best_Sum_3BVS" width="40" align="center" valign="middle" class="Counters"><%=FormatNumber(Player_Sum_3BVS,2,True)%></td>
  </tr>
</table>
  </td>
  </tr>
</table>
</body>
</html>
<%
Sub Get_Input()

	Player_Id = Request("Id")

End Sub
%>