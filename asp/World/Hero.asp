<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-26
'------------------------
%>
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
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
<body onLoad="parent.document.getElementById('Hero').style.display='block';Scroll_Init();">
<table width="290" border="0" cellspacing="5" cellpadding="0">
  <tr>
    <td width="260" valign="top" class="Text">
	<div style="width:100%;height:280px;overflow:hidden;position:absolute;">
	<div id="Scroll_Div" style="position:absolute;left:0px;top:0px;overflow:visible;">
	<table id="Scroll_Table" width="255" class="tbl" border="0" cellspacing="0" cellpadding="0">
	<%
	Call Start_Conn()
	
	SQL_Text = "Hero_List"
	rs.Open SQL_Text,Conn,3,1
			
	If Not rs.Eof Then
	
		Do While Not rs.Eof
			%>
			<tr onMouseOver="this.style.background='#444444';" onMouseOut="this.style.background='#333333';">
			<td width="155" class="Text" valign="top"><span class="Texts">[</span><span onClick="top.Window('/Help/Title.asp');" class="<%=rs("Player_Title")%>" title="点击查看称号说明"><%=rs("Player_Title")%></span><span class="Texts">]</span> <a href="javascript:;" onClick="top.Window('/Player/Show.asp?Id=<%=rs("Player_Id")%>');" class="High" title="点击查看个人信息"><%=rs("Player_Name_Chinese")%></a>(高级<%=FormatNumber(rs("Player_Exp_Time_Score"),2)%>)</td>
			<td width="100" class="Text" valign="top"><%=FormatDateTime(rs("Player_Hero_Time"),1)%></td></tr><%
			rs.MoveNext
		Loop		
		
	End If
	
	Call End_Conn()
	%>
	</table>
	</div>
	</div>
	</td>
	<td width="20" align="center" valign="top">	<table width="20" border="0" cellspacing="0" cellpadding="0">
	  <tr>
		<td>
		<span id="Scroll_Up" class="uButton">▲</span>
		</td>
	  </tr>
	  <tr>
		<td height="245"></td>
	  </tr>
	  <tr>
		<td>
		<span id="Scroll_Down" class="uButton">▼</span>
		</td>
	  </tr>
	</table>
  </td>
  </tr>
</table>
<script language="javascript">
var scrollInterval = 10;
var scrollHeight = 280; //高度，注意如果修改这个值，table中也要相应的修改
var scrollTimer;
function Scroll_Init()
{
	if(Scroll_Table.clientHeight>scrollHeight){Down_Enable();}else{Down_Unable();}
}
function uncScroll(oBtn, nStep)
{
	var h = Scroll_Div.clientHeight;
	if (h <= scrollHeight)
	{
		return;
	}
	Scroll_Div.style.pixelTop += nStep;
	if (Scroll_Div.style.pixelTop > 0)
	{
		Up_Unable();
		Scroll_Div.style.pixelTop = 0;
	}
	if (Scroll_Div.style.pixelTop+h < scrollHeight)
	{
		Down_Unable();
		Scroll_Div.style.pixelTop = scrollHeight - h;
	}
}
function Down_Enable()
{
 Scroll_Down.className='eButton';
 Scroll_Down.onMouseOver=new function(){Scroll_Down.className='hButton';}
 Scroll_Down.onMouseOut=new function(){Scroll_Down.className='eButton';}
}
function Down_Unable()
{
 Scroll_Down.className='uButton';
 Scroll_Down.onMouseOver=new function(){}
 Scroll_Down.onMouseOut=new function(){}
}
function Up_Enable()
{
 Scroll_Up.className='eButton';
 Scroll_Up.onMouseOver=new function(){Scroll_Up.className='hButton';}
 Scroll_Up.onMouseOut=new function(){Scroll_Up.className='eButton';}
}
function Up_Unable()
{
 Scroll_Up.className='uButton';
 Scroll_Up.onMouseOver=new function(){}
 Scroll_Up.onMouseOut=new function(){}
}
</script>
<script for="Scroll_Up" event="ondragstart">
  return false;
</script>
<script for="Scroll_Up" event="onmousedown">
  scrollBtn = this;
  scrollTimer = setInterval("uncScroll(scrollBtn, 2)", scrollInterval);
</script>
<script for="Scroll_Up" event="onmouseup">
  Down_Enable();
  clearInterval(scrollTimer);
</script>
<script for="Scroll_Down" event="ondragstart">
  return false;
</script>
<script for="Scroll_Down" event="onmousedown">
  scrollBtn = this;
  scrollTimer = setInterval("uncScroll(scrollBtn, -2)", scrollInterval);
</script>
<script for="Scroll_Down" event="onmouseup">
  Up_Enable();
  clearInterval(scrollTimer);
</script>
</body>
<iframe name="Action" style="display: none"></iframe>
</html>
