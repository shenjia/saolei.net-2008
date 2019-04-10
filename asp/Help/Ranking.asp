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
			<table width="560" border="0" cellspacing="0" cellpadding="0">
				<tr bgcolor="#555555">
					<td height="25" class="Highest" onmousedown="down=true;divtop=event.clientY;divleft=event.clientX;" onmouseup="down=false" onmouseout="down=false">　如何加入排行</td>
					<td width="20" height="25" align="center" class="Bold" onMouseOver="this.className='Signest';" onMouseOut="this.className='Bold';" style="cursor:pointer; " onClick="Cancel();">×</td>
			</tr>
			</table>
			<table width="560" border="0" cellspacing="10" cellpadding="0">
				<tr>
				  <td colspan="2" class="Text">					  <p class="Text"><span class="Title">下载并安装扫雷软件<br>
                  </span>　请先下载 <a href="/Download/Minesweeper_Clone_0.97.exe" class="Sign">Minesweeper Clone 0.97</a> 并安装。本软件为英文版，中文说明<a href="/Help/Clone.asp" target="_blank" class="Sign"> 请点这里</a>。<br>
　安装完后运行进入游戏，如果遇到问题，<a href="/Help/Question.asp" class="Sign">请点这里</a>。<br>
<span class="Title">设置录像标识文字<br>
</span> 　进入游戏后按 <span class="Highest">F5</span> ， 可进入设置界面。<br>
　在 <span class="Sign">Auto recording</span> 选项卡最下面可设置 <span class="Sign">Text for videos</span>，即录像标识文字。<br>
<span class="High">　录像标识文字只能使用英文</span>，推荐使用姓名拼音附加地区拼音，例如：<span class="Signest">Wang Wei (Shan Xi)</span> 。 <br>
　如果您注册时不慎填错了录像标识文字，可与管理员联系进行更改。<br>
　如果您上传了成绩后想更改录像标识文字，必须放弃已有的成绩。<br>
<span class="Title">保存扫雷录像</span><br>
　完成游戏后在 <span class="Sign">Game</span> 菜单中选择 <span class="Sign">Save video</span>，即可将游戏过程保存为 <span class="Signest">mvf </span>录像。<br>
<span class="Title">查看录像数据</span><br>
　在 <span class="Sign">Option</span> 菜单中勾选 <span class="Sign">Show counter window </span>，即可在播放录像和每局结束后查看统计数据。<br>
　在 <span class="Sign">Option</span> 菜单中勾选 <span class="Sign">Show 3BV stats </span>，即可查看<span class="Signest"> 3BV </span>数值。<br>
<span class="Title">上传扫雷录像</span><br>
　登陆中国扫雷网，点击导航栏的 <span class="Sign">上传录像</span> 。<br>
 　选择录像级别，输入完成游戏的时间(精确到2位小数)和3BV值，选择录像文件，开始上传。<span class="High"></span><span class="High"><br>
</span>　经审核后的录像将计入个人扫雷成绩，系统将自动取各级别的最短时间和最高3BV/S作为纪录保存。<br>
<span class="High"> 　当初/中/高三个级别的时间和3BV/S成绩都有纪录后，系统自动将您纳入国内扫雷排行。</span><br>
				  </p>
			      </td>
				</tr>
				<tr>
				  <td width="277" class="Text">
						<table width="180" height="30" border="0" align="right" cellpadding="0" cellspacing="1" style="cursor:pointer; " onClick="Cancel();">
							<tr>
								<td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">我明白怎么加入排行了</td>
							</tr>
					</table>
				  </td>
				  <td width="253" class="Text"><table width="120" height="30" border="0" align="left" cellpadding="0" cellspacing="1" style="cursor:pointer; " onClick="top.location='/BBS/Index.asp';">
                    <tr>
                      <td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">我有问题想问</td>
                    </tr>
                  </table></td>
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
