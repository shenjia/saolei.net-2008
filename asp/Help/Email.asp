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
<link href="/Models/Css/2008.css" rel="stylesheet" type="text/css">
<!--#include virtual="/Models/Include/Windows.asp"-->
</head>
<body onload="Window_Load();" onMousemove="move()" topmargin=0 leftmargin=0 scroll=no>
<table id="Window_Table" border="0" cellspacing="1" cellpadding="0" bgcolor="#999999">
	<tr>
		<td bgcolor="#444444">
			<table width="370" border="0" cellspacing="0" cellpadding="0">
				<tr bgcolor="#555555">
					<td height="25" class="Highest" onmousedown="down=true;divtop=event.clientY;divleft=event.clientX;" onmouseup="down=false" onmouseout="down=false">　A mail to Damien </td>
					<td width="20" height="25" align="center" class="Bold" onMouseOver="this.className='Signest';" onMouseOut="this.className='Bold';" style="cursor:pointer; " onClick="Cancel();">×</td>
			</tr>
			</table>
			<table width="370" border="0" cellspacing="10" cellpadding="0">
				<tr>
				  <td class="Text">
						<table width="350" height="30" border="0" align="center" cellpadding="10" cellspacing="1">
							<tr>
								<td align="left" bgcolor="#555555" class="High"><span class="High">标题： </span><span class="Text">I'm a new player from China...</span> <br>
                                  <span class="High">正文：</span> <span class="Text">Hello, Damien!<br>
                                  　　　　　 My name is </span><span class="Sign">Zhang Shen Jia</span><span class="Text">, I come from <br>
                                  　　　  </span><span class="Sign">China - Shaanxi</span><span class="Text"> ,Here is my score:)</span><br>
                    附件：<span class="Title"> Beg(2007-1-23).mvf</span><br>
                    　　　 <span class="Title">Int(2007-8-7).mvf</span><br>
                    　　　 <span class="Title">Exp(2007-10-23).mvf </span></td>
							</tr>
					</table>
			      </td>
				</tr>
			</table>
			<table width="370" border="0" cellspacing="0" cellpadding="0">
				<tr><td height="1" bgcolor="#555555"></td></tr>
			</table>
			<table width="370" border="0" cellspacing="10" cellpadding="0">
				<tr>
				  <td class="Text"><span class="Title">要点：</span>1、说明自己的姓名、所在地区<br>
                    <span class="Title">　　　</span>2、附件包括初级、中级、高级三个录像<br>
                    <span class="Title">　　　</span>3、录像名包括该录像生成的时间<br>
                    <span class="Sign">鄙人英语不精，还望达人能给出更好的示范信，谢谢:)　by 张砷镓</span></td>
			  </tr>
				<tr>
				  <td class="Text">
						<table width="180" height="30" border="0" align="center" cellpadding="0" cellspacing="1" style="cursor:pointer; " onClick="Cancel();">
							<tr>
								<td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">我知道Mail怎么写了</td>
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
