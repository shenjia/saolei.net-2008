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
<link href="/Models/Css/2008.css?v=20220104" rel="stylesheet" type="text/css">
<!--#include virtual="/Models/Include/Windows.asp"-->
</head>
<body onload="Window_Load();" onMousemove="move()" topmargin=0 leftmargin=0 scroll=no>
<table id="Window_Table" border="0" cellspacing="1" cellpadding="0" bgcolor="#999999">
	<tr>
		<td bgcolor="#444444">
			<table width="270" border="0" cellspacing="0" cellpadding="0">
				<tr bgcolor="#555555">
					<td height="25" class="Highest" onmousedown="down=true;divtop=event.clientY;divleft=event.clientX;" onmouseup="down=false" onmouseout="down=false">　雷界称号说明</td>
					<td width="20" height="25" align="center" class="Bold" onMouseOver="this.className='Signest';" onMouseOut="this.className='Bold';" style="cursor:pointer; " onClick="Cancel();">×</td>
			</tr>
			</table>
			<table width="270" border="0" cellspacing="10" cellpadding="0">
				<tr>
				  <td class="Text">					  <p class="Text"><span class="Title">【神界】</span><br>
				      <span class="Texts">　
				    [</span><span class="雷帝">雷帝</span><span class="Texts">] 雷界排行第一人<br>
				    　				    [</span><span class="雷圣">雷圣</span><span class="Texts">] 高级纪录为 </span><span class="Title">50秒 </span><span class="Texts">以下<br>
				    　
				    [</span><span class="雷神">雷神</span><span class="Texts">] 高级纪录为 </span><span class="Title">50 </span><span class="Texts">～</span><span class="Title"> 60秒</span><span class="Texts"> 的</span><span class="Counter"> GG</span><span class="Texts"><br>
				    　				    [</span><span class="雷仙">雷仙</span><span class="Texts">] 高级纪录为 <span class="Title">50 </span>～<span class="Title"> 60秒</span> 的</span><span class="Counter"> mm</span><span class="Texts"><br>
				    </span>
	                <span class="Title">【人界】 </span><br>
	              <span class="Texts">　
	              [</span><span class="状元">状元</span><span class="Texts">] 高级纪录为 </span><span class="Title">60</span><span class="Texts"> ～ </span><span class="Title">61秒</span><span class="Texts"><br>	              　
	              [</span><span class="榜眼">榜眼</span><span class="Texts">] 高级纪录为 </span><span class="Title">61</span><span class="Texts"> ～ </span><span class="Title">63秒</span> </span><span class="Texts"><br>
	              　
	              [</span><span class="探花">探花</span><span class="Texts">] 高级纪录为 </span><span class="Title">63</span><span class="Texts"> ～ </span><span class="Title"></span><span class="Title">66秒</span><span class="Texts"><br>
	              　
	              [</span><span class="进士">进士</span><span class="Texts">] 高级纪录为 </span><span class="Title">66</span><span class="Texts"> ～ </span><span class="Title"></span><span class="Title">70秒</span><span class="Texts"><br>
	              　
	              [</span><span class="举人">举人</span><span class="Texts">] 高级纪录为 </span><span class="Title">70</span><span class="Texts"> ～ </span><span class="Title"></span><span class="Title">80秒</span><span class="Texts"><br>
	              　	              [</span><span class="秀才">秀才</span><span class="Texts">] 高级纪录为 </span><span class="Title">80</span><span class="Texts"> ～ </span><span class="Title"></span><span class="Title">90秒</span><span class="Texts"><br>
	              　 [</span><span class="书生">书生</span><span class="Texts">] 高级纪录为 </span><span class="Title">90</span><span class="Texts"> ～ </span><span class="Title"></span><span class="Title">100秒</span><span class="Texts"><br>
	              　 [</span><span class="童生">童生</span><span class="Texts">] 高级纪录为 </span><span class="Title">100秒</span><span class="Texts"> 以上<br>
	              　 [</span><span class="布衣">布衣</span><span class="Texts">] 未加入排行 </span><br>
				  </p>
			      </td>
				</tr>
				<tr>
				  <td class="Text">
						<table width="180" height="30" border="0" align="center" cellpadding="0" cellspacing="1" style="cursor:pointer; " onClick="Cancel();">
							<tr>
								<td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">明白了，我一定继续努力</td>
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
