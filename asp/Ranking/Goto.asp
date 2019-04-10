<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-25
'------------------------
%>
<%
If Request("Rank") <> "" Then Session("Goto_Rank") = Request("Rank")
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
<link href="/Models/Css/2008.css" rel="stylesheet" type="text/css">
<!--#include virtual="/Models/Include/Windows.asp"-->
</head>
<body onload="Window_Load();Goto_Form.Goto_Name.select();" onMousemove="move()" topmargin=0 leftmargin=0 scroll=no>
<table id="Window_Table" border="0" cellspacing="1" cellpadding="0" bgcolor="#999999">
	  <form name="Goto_Form" action="Action/Goto_Check_Action.asp" method="post" target="Action">
	<tr>
		<td bgcolor="#444444">
			<table width="200" border="0" cellspacing="0" cellpadding="0">
				<tr bgcolor="#555555">
					<td height="25" class="Highest" onmousedown="down=true;divtop=event.clientY;divleft=event.clientX;" onmouseup="down=false" onmouseout="down=false">　查找定位</td>
					<td width="20" height="25" align="center" class="Bold" onMouseOver="this.className='Signest';" onMouseOut="this.className='Bold';" style="cursor:pointer; " onClick="Cancel();">×</td>
			</tr>
			</table>
			<table width="200" border="0" cellspacing="10" cellpadding="0">
					<td colspan="2" valign="top" class="Text">按姓名查找：
					  <input name="Goto_Name" type="text" class="input-no" size="12" maxlength="12" value="<%=Session("Player_Name_Chinese")%>" onClick="Goto_Form.Goto_Id.value='';">
					  <br>
					  按ＩＤ查找：
					  <input name="Goto_Id" type="text" class="input-no" size="5" maxlength="5" onClick="Goto_Form.Goto_Name.value='';">
					  <input name="Goto_Rank" type="hidden" value="<%=Session("Goto_Rank")%>"></td>
					</tr>
				<tr>
				  <td colspan="2" align="right" class="Text">
					<table width="180" border="0" align="center" cellpadding="0" cellspacing="0">
					  <tr>
						<td width="155">
							<table width="80" height="30" border="0" align="center" cellpadding="0" cellspacing="1" style="cursor:pointer; " onClick="Goto_Form.submit();">
								<tr>
									<td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">查找定位</td>
								</tr>
							</table>
						</td>
						<td width="150">
							<table width="50" height="30" border="0" align="center" cellpadding="0" cellspacing="1" style="cursor:pointer; " onClick="Cancel();">
								<tr>
									<td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">放弃</td>
								</tr>
							</table>
						</td>
					  </tr>
					</table>
				  
				  </td>
				</tr>
			</table>
		</td>
	</tr>
	</form>
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
		top.End_Mask();
		top.Window_Box.style.display='none';
}
</script>
