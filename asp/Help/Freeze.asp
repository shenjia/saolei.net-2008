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
			<table width="500" border="0" cellspacing="0" cellpadding="0">
				<tr bgcolor="#555555">
					<td height="25" class="Highest" onmousedown="down=true;divtop=event.clientY;divleft=event.clientX;" onmouseup="down=false" onmouseout="down=false">　为什么录像会被冻结？</td>
					<td width="20" height="25" align="center" class="Bold" onMouseOver="this.className='Signest';" onMouseOut="this.className='Bold';" style="cursor:pointer; " onClick="Cancel();">×</td>
			</tr>
			</table>
			<table width="500" border="0" cellspacing="10" cellpadding="0">
				<tr>
				  <td class="Text">					  <p class="Text"><span class="High">1、上传的录像没有设置录像标识文字</span><br>
				      <span class="Bold">例：</span>标识文字为软件默认的<span class="Sign"> Your name here...Press F5</span>，这样无法判定录像的归属。<br>
				      <span class="High">2、上传的录像标识文字与用户注册的录像标识文字不符</span><br>
				      <span class="Bold">例：</span>用户注册的标识为 <span class="Sign">Zhang San</span>，而录像的标识文字为 <span class="Sign">Li Si </span>。<br>
				    <span class="High">3、上传时填写的录像数据和录像实际数据不符</span><br>
                    <span class="Bold">例：</span>上传高级录像时误选成初级录像，或录像是<span class="Sign">98.45</span>秒，上传时填写成<span class="Sign">98.00</span>秒。<br>
				    <span class="High">4、录像非Classical Mode模式</span><br>
				    <span class="Bold">例：</span>上传了<span class="Sign"> UPK Mode</span> 或者 <span class="Sign">Density Mode</span> 模式的录像。<br>
				    <span class="High">5、录像存在BUG</span><br>
				    <span class="Bold">例：</span>录像完成后仍有未打开的方块，或者<span class="Sign"></span>每次播放显示的完成时间都不同。<br>
				    <span class="High">6、录像无法打开
				    </span><br>
				    <span class="Bold">例：</span>错传了其他文件或者上传了损坏的录像文件。<br>
				    <span class="Text">本次录像被冻结的原因已经通过短信提交给上传者本人，</span><span class="Sign">本录像将于三日内自动删除。</span><br>
				    <span class="Sign">如果是数据填写错误请先保存录像，再删除录像并从新上传。其他原因请直接删除录像。</span><br>
				  </p>
			      </td>
				</tr>
				<tr>
				  <td class="Text">
						<table width="180" height="30" border="0" align="center" cellpadding="0" cellspacing="1" style="cursor:pointer; " onClick="Cancel();">
							<tr>
								<td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">明白了，我要继续看录像</td>
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
	history.go(-1);
}
</script>
