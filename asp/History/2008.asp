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
<script language="javascript">
function Init()
{
	h2008.className='Sign';
	h2007.className='High';
	h2006.className='High';	
}
</script>
</head>
<body onload="Window_Load();Init();" onMousemove="move()" topmargin=0 leftmargin=0 scroll=no>
<table id="Window_Table" border="0" cellspacing="1" cellpadding="0" bgcolor="#999999">
	<tr>
		<td bgcolor="#444444">
			<table width="300" border="0" cellspacing="0" cellpadding="0">
				<tr bgcolor="#555555">
					<td height="25" class="Highest" onmousedown="down=true;divtop=event.clientY;divleft=event.clientX;" onmouseup="down=false" onmouseout="down=false">　更新历史</td>
					<td width="20" height="25" align="center" class="Bold" onMouseOver="this.className='Signest';" onMouseOut="this.className='Bold';" style="cursor:pointer; " onClick="Cancel();">×</td>
			</tr>
			</table>
			<table width="300" border="0" cellspacing="10" cellpadding="0">
				<tr>
				  <td class="Text"><table width="280" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="77" class="Highest">2008.1.1</td>
                      <td width="203" class="Sign">2008新版推出！</td>
                    </tr>
                    <tr>
                      <td width="77" class="Highest">2008.1.21</td>
                      <td width="203" class="Text">添加 <span class="Sign">性别及照片</span> 属性</td>
                    </tr>
                    <tr>
                      <td width="77" class="Highest">2008.2.2</td>
                      <td width="203" class="Text">添加 <span class="Sign">论坛分类</span> 功能</td>
                    </tr>
                    <tr>
                      <td width="77" class="Highest">2008.2.24</td>
                      <td width="203" class="Text">添加 <span class="Sign">人气排行</span> 功能</td>
                    </tr>
                    <tr>
                      <td width="77" class="Highest">2008.4.23</td>
                      <td width="203" class="Text">添加 <span class="Sign">上传照片标示</span> 功能</td>
                    </tr>
                    <tr>
                      <td width="77" class="Highest"></td>
                      <td width="203" class="Text">添加 <span class="Sign">本日人气统计</span> 功能</td>
                    </tr>
                    <tr>
                      <td width="77" class="Highest">2008.7.28</td>
                      <td width="203" class="Text">添加 <span class="Sign">管理团队查看统计</span> 功能</td>
                    </tr>
                    <tr>
                      <td width="77" class="Highest"></td>
                      <td width="203" class="Text">添加 <span class="Sign">自动显示SUB整数</span> 功能</td>
                    </tr>
                  </table></td>
				</tr>
				<tr>
				  <td class="Text"><!--#include virtual="/History/Button.asp"--></td>
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
