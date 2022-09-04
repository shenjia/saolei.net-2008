<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-11
'------------------------
%>
<!--#include virtual="/Player/Check.asp"-->
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
<!--#include virtual="/Models/Include/Bar.asp"-->
<%
Call Check()

Call Start_Conn()

Set cmd = Server.CreateObject("ADODB.Command")
Set cmd.ActiveConnection = Conn
cmd.CommandText = "dbo.Video_Satus"
cmd.CommandType = &H0004

cmd.Parameters.Append cmd.CreateParameter("@Player_Id",3)
cmd.Parameters.Append cmd.CreateParameter("@Video_Number_Beg",3,2)
cmd.Parameters.Append cmd.CreateParameter("@Video_Number_Int",3,2)
cmd.Parameters.Append cmd.CreateParameter("@Video_Number_Exp",3,2)

cmd("@Player_Id") = Session("Player_Id")

cmd.execute

Video_Number_Beg = cmd("@Video_Number_Beg")
Video_Number_Int = cmd("@Video_Number_Int")
Video_Number_Exp = cmd("@Video_Number_Exp")
Video_Number_All = Video_Number_Beg + Video_Number_Int + Video_Number_Exp

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
	background-color: #444444;
}
-->
</style>
<link href="/Models/Css/2008.css?v=20220423" rel="stylesheet" type="text/css">
<!--#include virtual="/Models/Include/Windows.asp"-->
</head>
<body onload="Window_Load();" onMousemove="move()" topmargin=0 leftmargin=0 scroll=no>
<table id="Window_Table" border="0" cellspacing="1" cellpadding="0" bgcolor="#999999">
	<tr>
		<td bgcolor="#444444">
			<table width="380" border="0" cellspacing="0" cellpadding="0">
				<tr bgcolor="#555555">
					<td height="25" class="Highest" onmousedown="down=true;divtop=event.clientY;divleft=event.clientX;" onmouseup="down=false" onmouseout="down=false">　请选择录像级别</td>
					<td width="20" height="25" align="center" class="Bold" onMouseOver="this.className='Signest';" onMouseOut="this.className='Bold';" style="cursor:pointer; " onClick="Cancel();">×</td>
			</tr>
			</table>
			<table width="380" border="0" cellspacing="10" cellpadding="0">
			  <tr class="Text" onMouseOver="Beg.className='High';Box_Beg.style.background='#999999';Bar_Beg.style.background='#999999';Beg_Number.className='Counter';" onMouseOut="Beg.className='Text';Box_Beg.style.background='#777777';Bar_Beg.style.background='#777777';Beg_Number.className='Counters';">
				<td id="Beg" width="100" align="left" valign="middle" class="Text">
				<table width="100" height="20" border="0" align="left" cellpadding="0" cellspacing="0" style="cursor:pointer; " onClick="Action.location='Action/Upload_Check_Action.asp?Model=Beg';">
				<tr>
				<td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">初级录像</td>
				</tr>
				</table>
				</td>
				<td width="208" align="left" valign="middle">
				<%Call Bar("Beg",Video_Number_Beg,Video_Number_All,208,20)%>
				</td>
				<td id="Beg_Number" width="30" align="left" valign="middle" class="Counters"><%=Video_Number_Beg%></td>
			  </tr>
			  <tr class="Text" onMouseOver="Int.className='High';Box_Int.style.background='#999999';Bar_Int.style.background='#999999';Int_Number.className='Counter';" onMouseOut="Int.className='Text';Box_Int.style.background='#777777';Bar_Int.style.background='#777777';Int_Number.className='Counters';">
				<td id="Int" width="100" align="left" valign="middle" class="Text">
				<table width="100" height="20" border="0" align="left" cellpadding="0" cellspacing="0" style="cursor:pointer; " onClick="Action.location='Action/Upload_Check_Action.asp?Model=Int';">
				<tr>
				<td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">中级录像</td>
				</tr>
				</table>
				</td>
				<td width="208" align="left" valign="middle">
				<%Call Bar("Int",Video_Number_Int,Video_Number_All,208,20)%>
				</td>
				<td id="Int_Number" width="30" align="left" valign="middle" class="Counters"><%=Video_Number_Int%></td>
			  </tr>
			  <tr class="Text" onMouseOver="Exp.className='High';Box_Exp.style.background='#999999';Bar_Exp.style.background='#999999';Exp_Number.className='Counter';" onMouseOut="Exp.className='Text';Box_Exp.style.background='#777777';Bar_Exp.style.background='#777777';Exp_Number.className='Counters';">
				<td id="Exp" width="100" align="left" valign="middle" class="Text">
				<table width="100" height="20" border="0" align="left" cellpadding="0" cellspacing="0" style="cursor:pointer; " onClick="Action.location='Action/Upload_Check_Action.asp?Model=Exp';">
				<tr>
				<td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">高级录像</td>
				</tr>
				</table>
				</td>
				<td width="208" align="left" valign="middle">
				<%Call Bar("Exp",Video_Number_Exp,Video_Number_All,208,20)%>
				</td>
				<td id="Exp_Number" width="30" align="left" valign="middle" class="Counters"><%=Video_Number_Exp%></td>
			  </tr>
		  </table>
		</td>
	</tr>
</table>
</body>
</html>
<iframe name="Action" style="display: none"></iframe>
<script language="javascript">
function KeyDown()
{ 
	var keyCode;
	try{ 
		   keyCode=event.keyCode;
	 } 
	 catch(a){
		   keyCode=KeyDown.arguments[0].keyCode; 
	 } 
	switch(keyCode)
	{
		case 27:
		Cancel();      
		break;
	}
}		
document.onkeydown=KeyDown; 
document.onkeypress=KeyDown;

function Cancel()
{
		parent.End_Mask();
		parent.document.getElementById('Window_Box').style.display='none';
}
</script>
