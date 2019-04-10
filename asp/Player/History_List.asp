<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-17
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
.tbl {table-layout:fixed}
.td {overflow:hidden;}
-->
</style>
<link href="/Models/Css/2008.css" rel="stylesheet" type="text/css">
</head>	
<body onLoad="parent.document.getElementById('History').style.display='block';Scroll_Init();">
<table width="290" border="0" cellspacing="5" cellpadding="0">
  <tr>
    <td width="260" valign="top" class="Text">
	<div style="width:100%;height:280px;overflow:hidden;position:absolute;">
	<div id="Scroll_Div" style="position:absolute;left:0px;top:0px;overflow:visible;">
	<table id="Scroll_Table" width="255" class="tbl" border="0" cellspacing="0" cellpadding="0">
	<%
	Player_Id = CInt(Request("Id"))
	
	If Player_Id = Session("Player_Id") Then
		History_IsMine = True
	Else
		History_IsMine = False
	End If

	Call Start_Conn()
	
	SQL_Text = "History_List "&Player_Id
	rs.Open SQL_Text,Conn,3,1
			
	If Not rs.Eof Then
	
		Do While Not rs.Eof
			%><tr><td width="28%" class="td" valign="top" nowrap><div class="Title"><%=Year(rs("History_Time"))%>年<%=Month(rs("History_Time"))%>月</div></td>
			<td width="72%" class="td" valign="top"><div class="Text"><%=Replace(rs("History_Text"),vbcrlf,"<br>")%></div><span class="Text">
			<%If History_IsMine Or Session("Player_IsMaster") Then%><span class="Text">[<a href="History_Edit.asp?Id=<%=rs("History_Id")%>" class="High">编辑</a>]　<%End If%>
			<%If History_IsMine Or Session("Player_IsMaster") Then%><span class="Text">[<a href="javascript:;" onClick="if(confirm('确定要删除此条历程？')) Action.location='Action/History_Del_Action.asp?Id=<%=rs("History_Id")%>';" class="High">删除</a>]</span><%End If%>
			</td></tr><%
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
		<td height="225"></td>
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
