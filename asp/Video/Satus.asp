<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-15
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
cmd.CommandText = "dbo.Video_Satus"
cmd.CommandType = &H0004

cmd.Parameters.Append cmd.CreateParameter("@Player_Id",3)
cmd.Parameters.Append cmd.CreateParameter("@Video_Number_Beg",3,2)
cmd.Parameters.Append cmd.CreateParameter("@Video_Number_Int",3,2)
cmd.Parameters.Append cmd.CreateParameter("@Video_Number_Exp",3,2)

cmd("@Player_Id") = Player_Id

cmd.execute

Video_Number_Beg = cmd("@Video_Number_Beg")
Video_Number_Int = cmd("@Video_Number_Int")
Video_Number_Exp = cmd("@Video_Number_Exp")

Set cmd = Nothing

Call End_Conn()
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
<link href="/Models/Css/2008.css?v=20220423" rel="stylesheet" type="text/css">
</head>
<body onLoad="parent.document.getElementById('Do').style.display='block';">
<table width="290" border="0" cellspacing="10" cellpadding="0">
  <tr class="Text" onMouseOver="Beg.className='High';Box_Beg.style.background='#999999';Bar_Beg.style.background='#999999';Beg_Number.className='Counter';" onMouseOut="Beg.className='Text';Box_Beg.style.background='#777777';Bar_Beg.style.background='#777777';Beg_Number.className='Counters';">
    <td id="Beg" width="50" align="left" valign="middle" class="Text">初级录像</td>
    <td width="180" align="left" valign="middle">
	<%Call Bar("Beg",Video_Number_Beg,500,180,20)%>
	</td>
    <td id="Beg_Number" width="22" align="left" valign="middle" class="Counters"><%=Video_Number_Beg%></td>
  </tr>
  <tr class="Text" onMouseOver="Int.className='High';Box_Int.style.background='#999999';Bar_Int.style.background='#999999';Int_Number.className='Counter';" onMouseOut="Int.className='Text';Box_Int.style.background='#777777';Bar_Int.style.background='#777777';Int_Number.className='Counters';">
    <td id="Int" width="50" align="left" valign="middle" class="Text">中级录像</td>
    <td width="180" align="left" valign="middle">
	<%Call Bar("Int",Video_Number_Int,500,180,20)%>
	</td>
    <td id="Int_Number" width="22" align="left" valign="middle" class="Counters"><%=Video_Number_Int%></td>
  </tr>
  <tr class="Text" onMouseOver="Exp.className='High';Box_Exp.style.background='#999999';Bar_Exp.style.background='#999999';Exp_Number.className='Counter';" onMouseOut="Exp.className='Text';Box_Exp.style.background='#777777';Bar_Exp.style.background='#777777';Exp_Number.className='Counters';">
    <td id="Exp" width="50" align="left" valign="middle" class="Text">高级录像</td>
    <td width="180" align="left" valign="middle">
	<%Call Bar("Exp",Video_Number_Exp,500,180,20)%>
	</td>
    <td id="Exp_Number" width="22" align="left" valign="middle" class="Counters"><%=Video_Number_Exp%></td>
  </tr>
</table>
</body>
</html>
<%
Sub Get_Input()

	Player_Id = Request("Id")

End Sub
%>