<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-13
'------------------------
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
			<table width="500" border="0" cellspacing="0" cellpadding="0">
				<tr bgcolor="#555555">
					<td height="25" class="Highest" onmousedown="down=true;divtop=event.clientY;divleft=event.clientX;" onmouseup="down=false" onmouseout="down=false">　扫雷术语介绍</td>
					<td width="20" height="25" align="center" class="Bold" onMouseOver="this.className='Signest';" onMouseOut="this.className='Bold';" style="cursor:pointer; " onClick="Cancel();">×</td>
			</tr>
			</table>
			<table width="500" border="0" cellspacing="10" cellpadding="0">
				<tr>
				  <td class="Text">					  <p class="Text"><SPAN 
                  class=Signest>3BV</SPAN>:&nbsp;<span class="High">Bechtel's&nbsp;Board&nbsp;Benchmark&nbsp;Value&nbsp;</span><BR>
				    每局将所有非雷的方块点开所需最少左键点击数，目前普遍用来评估局面难易程度的数据。<BR>
				    <SPAN 
                  class=Signest>3BV/s</SPAN>:&nbsp;<span class="High">3BV&nbsp;per&nbsp;second&nbsp;&nbsp;[&nbsp;3BV&nbsp;/&nbsp;(Time&nbsp;-&nbsp;1)&nbsp;]</span><BR>
				    一局内平均每秒钟完成的3BV值，是目前普遍用来评估玩家扫雷速度的数据。<BR>
				    <SPAN 
                  class=Signest>UPK</SPAN>:&nbsp;<span class="High">Unfair&nbsp;Prior&nbsp;Knowledge</span><BR>
				    可重新开始同一局的游戏模式，本模式保存的录象不能参与排名。<BR>
				    <SPAN 
                  class=Signest>IOE</SPAN>:<span class="High">&nbsp;Index&nbsp;of&nbsp;Efficiency&nbsp;&nbsp;[&nbsp;3BV&nbsp;/&nbsp;Total&nbsp;Clicks&nbsp;]</span><BR>
				    3BV与实际点击数的比率，是目前普遍用来评估玩家操作效率的数据。<BR>
				    <SPAN 
                  class=Signest>IOS</SPAN>:&nbsp;<span class="High">Index&nbsp;of&nbsp;Speed&nbsp;&nbsp;[&nbsp;log&nbsp;(Time&nbsp;-&nbsp;1)&nbsp;/&nbsp;log&nbsp;(3BV)&nbsp;]</span><BR>
				    时间的倒数与3BV的倒数之比率，与3BV/s作用相当。<BR>
				    <SPAN 
                  class=Signest>RQP</SPAN>:&nbsp;<span class="High">Rapport&nbsp;Qualité&nbsp;Prix&nbsp;&nbsp;[&nbsp;Time&nbsp;/&nbsp;(3BV/s)&nbsp;]</span><BR>
				    时间与3BV/s的比率，因加入了时间因素，比3BV/s更能说明扫雷速度。<BR>
				    <SPAN 
                  class=Signest>NF</SPAN>:&nbsp;<span class="High">No&nbsp;Flag</span><BR>
				    一种仅用左键点击完成游戏，不标雷的玩法。<BR>
				    <SPAN 
                  class=Signest>MB</SPAN>:&nbsp;<span class="High">Miss&nbsp;Block</span><BR>
				    整个局面都完成，但有一个方块因忽视而没有点开的情况。<BR>
				    <SPAN 
                  class=Signest>LC</SPAN>:&nbsp;<span class="High">Lose&nbsp;on&nbsp;the&nbsp;last&nbsp;click</span><BR>
				    打开最后一个方格时不幸踩雷。<BR>
				    <SPAN 
                  class=Signest>Sum</SPAN>:&nbsp;
				    初级、中级、高级成绩相加而得出的总成绩。<BR>
				    <SPAN 
                  class=Signest>Sub</SPAN>:&nbsp;
				    小于某数值，比如高级Sub50就说明高级成绩&lt;50。<BR>
				    <SPAN 
                  class=Signest>Sup</SPAN>:&nbsp;
				    大于某数值，比如高级3BV/S&nbsp;Sup4就说明高级3BV/S&gt;4。<br>
				  </p>
			      </td>
				</tr>
				<tr>
				  <td class="Text">
						<table width="180" height="30" border="0" align="center" cellpadding="0" cellspacing="1" style="cursor:pointer; " onClick="Cancel();">
							<tr>
								<td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">我明白了，多谢指教</td>
							</tr>
					</table>
				  </td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</body>
</html>
<iframe name="Action" style="display: none"></iframe>
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
