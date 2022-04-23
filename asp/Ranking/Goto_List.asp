<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% Response.Charset = "utf-8" %>
<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-25
'------------------------
Dim Goto_Name
Dim Goto_Rank
%>
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
<!--#include virtual="/Models/Common/Error.asp"-->
<!--#include virtual="/Models/Common/Function.asp"-->
<%
Call Get_Input()
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
	  <form name="Goto_Form" action="Action/Goto_Check_Action.asp" method="post" target="Action">
	<tr>
		<td bgcolor="#444444">
			<table width="220" border="0" cellspacing="0" cellpadding="0">
				<tr bgcolor="#555555">
					<td height="25" class="Highest" onmousedown="down=true;divtop=event.clientY;divleft=event.clientX;" onmouseup="down=false" onmouseout="down=false">　查找定位</td>
					<td width="20" height="25" align="center" class="Bold" onMouseOver="this.className='Signest';" onMouseOut="this.className='Bold';" style="cursor:pointer; " onClick="Cancel();">×</td>
			</tr>
			</table>
			<table width="220" border="0" cellspacing="10" cellpadding="0">
					<td valign="top" class="Text">
		<table width="200" border="0" cellspacing="0" cellpadding="0">
		<%	
		Call Start_Conn()
		
		SQL_Text = "Ranking_Goto_List '"&Goto_Name&"'"
		rs.Open SQL_Text,Conn,3,1
				
		If Not rs.Eof Then
		
			Do While Not rs.Eof
				If rs("Player_IsHero") Then
					Rank_Text="<span class=World1>【神界】</span>"
				Else
					Rank_Text="<span class=World2>【人界】</span>"
				End If
				If rs("Player_Sex") Then
					Player_Sex_Text = "GG"
				Else
					Player_Sex_Text = "mm"
				End If
				%><tr style="cursor: pointer " onMouseOver="this.style.background='#555555';" onMouseOut="this.style.background='#444444';" onClick="Action.location='/Ranking/Action/Goto_Action.asp?Id=<%=rs("Player_Id")%>&Rank=<%=Goto_Rank%>';">
				<td class="Text" height="20">
				<%=Rank_Text%><span class="Texts">[</span><span class="<%=rs("Player_Title")%>"><%=rs("Player_Title")%></span><span class="Texts">]</span> <span class="High"><%=rs("Player_Name_Chinese")%></span>
				<span class="Title"><%=rs("Player_Area")%></span><span class="Counter"><%=Player_Sex_Text%></span>				
				</td></tr><%
				rs.MoveNext
			Loop		
		Else
			%><tr>
			<td class="Sign" height="20">没有找到符合条件的雷友！</td>
			<td>
			<table width="40" height="30" border="0" align="center" cellpadding="0" cellspacing="1" style="cursor:pointer; " onClick="location='/Ranking/Goto.asp';">
				<tr>
					<td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">重试</td>
				</tr>
			</table>
			</td></tr><%
		End If
		
		Call End_Conn()
		%>
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
		top.document.getElementById('Window_Box').style.display='none';
}
</script>
<%
Sub Get_Input()

	Goto_Name = Trim(URLDecode(Request("Name")))
	Goto_Rank = Trim(Request("Rank"))

End Sub
%>