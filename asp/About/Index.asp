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
			<table width="426" border="0" cellspacing="0" cellpadding="0">
				<tr bgcolor="#555555">
					<td height="25" class="Highest" onmousedown="down=true;divtop=event.clientY;divleft=event.clientX;" onmouseup="down=false" onmouseout="down=false">　关于本站</td>
					<td width="20" height="25" align="center" class="Bold" onMouseOver="this.className='Signest';" onMouseOut="this.className='Bold';" style="cursor:pointer; " onClick="Cancel();">×</td>
			</tr>
			</table>
			<table width="426" border="0" cellspacing="10" cellpadding="0">
				<tr>
				  <td class="Text">　　扫雷，一款简单而又复杂的逻辑推理游戏.<br>
　　说其简单是因为上手容易，原理简单。说其复杂是因为简单的推理可以叠加组合成各种复杂有趣的形状。扫雷就象走迷宫，各有巧妙不同，或箭步如梭，或如履薄冰，或彷徨其中无疾而终。高手和普通玩家的区别就在于他们总是能用相对合理的手法高效率的完成游戏。扫雷是技术与速度紧密结合的游戏，每一次的提高都带来喜悦和反思，去迎接下一次突破。<br>
　　游戏如人生，我们都有过破纪录的兴奋，也有过痛失好局的沮丧。世事如棋，正所谓胜不骄， 败不馁， 保持良好的心态，或许在游戏之外你还能感悟到更多……<br>
　　本站旨在为国内广大雷友提供一个互相学习的空间，不再孤军奋战，让我们取长补短，不断提高，没有最好，只有更好。需要超越的永远是自己！<br>
　　本站的创意始于2006年10月，受到了<span class="Signest"> Damien Moore </span>所做国际排行的启发，并以雷友 <span class="Signest">birdy</span> 所做的国内排行为起点。建站得到了&nbsp;<span class="Signest">[M.S]挖金团</span> <br>
家族族长<span class="Sign"> 纯白 </span>的大力协助，在此对以上友人表示真挚的感谢！</td>
				</tr>
				<tr>
				  <td class="Text">
				  <table width="406" border="0" cellspacing="0" cellpadding="0">
					  <tr>
						<td width="161">
							<table width="150" height="30" border="0" align="right" cellpadding="0" cellspacing="1" style="cursor:pointer; " onClick="parent.Window('/About/Donate.asp')">
								<tr>
									<td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';"><span class="Sign">提供赞助</span></td>
								</tr>
						  </table>
						</td>
						<td width="143">
							<table width="120" height="30" border="0" align="center" cellpadding="0" cellspacing="1" style="cursor:pointer; " onClick="location='/History/2008.asp';">
								<tr>
									<td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">查看本站更新历史</td>
								</tr>
							</table>
						</td>
						<td width="102">
							<table width="80" height="30" border="0" align="left" cellpadding="0" cellspacing="1" style="cursor:pointer; " onClick="Cancel();">
								<tr>
									<td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">我知道了</td>
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
