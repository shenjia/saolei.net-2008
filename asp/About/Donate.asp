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
					<td height="25" class="Highest" onmousedown="down=true;divtop=event.clientY;divleft=event.clientX;" onmouseup="down=false" onmouseout="down=false">　提供赞助</td>
					<td width="20" height="25" align="center" class="Bold" onMouseOver="this.className='Signest';" onMouseOut="this.className='Bold';" style="cursor:pointer; " onClick="Cancel();">×</td>
			</tr>
			</table>
			<table width="426" border="0" cellspacing="10" cellpadding="0">
				<tr>
				  <td class="Text">
<p>本站一直由站长张砷镓进行独立维护。希望有经济能力的雷友对本站进行赞助，使本站能维持运行，并不断发展。</p>
<p>支付宝帐号：<span class="Sign">137516@qq.com</span></p>
<span class="Title">【赞助用途】</span>
<p>
1、服务器租赁及域名等基本费用<br>
2、比赛奖金<br>
3、外包程序开发<br>
</p>

<span class="Title">【注意事项】</span>
<p>
1、赞助应在不影响生活质量的情况下，量力而行。建议在校学生在工作后再进行赞助！<br>
2、请在付款说明中注明“扫雷网+用户ID”（如：<span class="Sign">扫雷网 54</span>），否则款项将流失，无法计入赞助。<br>
3、日后本站推出收费项目（如VIP会员）时，将对赞助用户充值对应的金额，如果不填写ID则视为匿名赞助，放弃日后等额充值的权利。<br>
4、请不要将赞助金额发布在论坛或QQ群中，如需核实款项请和站长张砷镓联系。
</p>
</td>
				</tr>
				<tr>
				  <td class="Text">
				  <table width="406" border="0" cellspacing="0" cellpadding="0">
					  <tr>
						<td width="161">
							<table width="150" height="30" border="0" align="right" cellpadding="0" cellspacing="1" style="cursor:pointer; " onClick="window.open('https://www.alipay.com')">
								<tr>
									<td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';"><img src="/Models/Images/alipay.jpg" style="vertical-align:middle"/> <span class="Sign">去支付宝付款</span></td>
								</tr>
						  </table>
						</td>
						<td width="161">
							<table width="150" height="30" border="0" align="left" cellpadding="0" cellspacing="1" style="cursor:pointer; " onClick="Cancel();">
								<tr>
									<td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">以后再说</td>
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
