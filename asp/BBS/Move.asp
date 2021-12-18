<%
'------------------------
'Code:Zhang Shen Jia
'Date:2008-1-1
'------------------------
Title_Id = Request("Id")
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
<link href="/Models/Css/2008.css?v=20211218" rel="stylesheet" type="text/css">
<!--#include virtual="/Models/Include/Windows.asp"-->
</head>
<body onload="Window_Load();" onMousemove="move()" topmargin=0 leftmargin=0 scroll=no>
<table id="Window_Table" border="0" cellspacing="1" cellpadding="0" bgcolor="#999999">
	<tr>
		<td bgcolor="#444444">
			<table width="120" border="0" cellspacing="0" cellpadding="0">
				<tr bgcolor="#555555">
					<td height="25" class="Highest" onmousedown="down=true;divtop=event.clientY;divleft=event.clientX;" onmouseup="down=false" onmouseout="down=false">　移动主题</td>
					<td width="20" height="25" align="center" class="Bold" onMouseOver="this.className='Signest';" onMouseOut="this.className='Bold';" style="cursor:pointer; " onClick="Cancel();">×</td>
			</tr>
			</table>
			<table width="120" border="0" cellspacing="10" cellpadding="0">
				<tr>
				  <td class="Text">			
					<table width="100" border="0" cellspacing="0" cellpadding="0">
					<tr style="cursor: pointer " onMouseOver="List_1.className='Sign';this.style.background='#555555';" onMouseOut="List_1.className='Text';this.style.background='#444444';" onClick="Action.location='/BBS/Action/Move_Action.asp?Id=<%=Title_Id%>&Model=Notice';">
					<td id="List_1" class="Text" height="20" align="center">【公告】
					</td>
					</tr>
					</table>
			      </td>
				</tr>
				<tr>
				  <td class="Text">			
					<table width="100" border="0" cellspacing="0" cellpadding="0">
					<tr style="cursor: pointer " onMouseOver="List_2.className='Sign';this.style.background='#555555';" onMouseOut="List_2.className='Text';this.style.background='#444444';" onClick="Action.location='/BBS/Action/Move_Action.asp?Id=<%=Title_Id%>&Model=Skill';">
					<td id="List_2" class="Text" height="20" align="center">【技术】
					</td>
					</tr>
					</table>
			      </td>
				</tr>
				<tr>
				  <td class="Text">			
					<table width="100" border="0" cellspacing="0" cellpadding="0">
					<tr style="cursor: pointer " onMouseOver="List_3.className='Sign';this.style.background='#555555';" onMouseOut="List_3.className='Text';this.style.background='#444444';" onClick="Action.location='/BBS/Action/Move_Action.asp?Id=<%=Title_Id%>&Model=Other';">
					<td id="List_3" class="Text" height="20" align="center">【杂谈】
					</td>
					</tr>
					</table>
			      </td>
				</tr>
				<tr>
				  <td class="Text">			
					<table width="100" border="0" cellspacing="0" cellpadding="0">
					<tr style="cursor: pointer " onMouseOver="List_4.className='Sign';this.style.background='#555555';" onMouseOut="List_4.className='Text';this.style.background='#444444';" onClick="Action.location='/BBS/Action/Move_Action.asp?Id=<%=Title_Id%>&Model=Ask';">
					<td id="List_4" class="Text" height="20" align="center">【问答】
					</td>
					</tr>
					</table>
			      </td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<iframe name="Action" style="display: yes"></iframe>
</body>
</html>
<script language="javascript">
function KeyDown(e){     
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
