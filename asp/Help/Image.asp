<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-30
'------------------------
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
<link href="/Models/Css/2008.css?v=20220423" rel="stylesheet" type="text/css">
<!--#include virtual="/Models/Include/Windows.asp"-->
</head>
<body onload="Window_Load();" onMousemove="move()" topmargin=0 leftmargin=0 scroll=no>
<table id="Window_Table" border="0" cellspacing="1" cellpadding="0" bgcolor="#999999">
	<tr>
		<td bgcolor="#444444">
			<table width="370" border="0" cellspacing="0" cellpadding="0">
				<tr bgcolor="#555555">
					<td height="25" class="Highest" onmousedown="down=true;divtop=event.clientY;divleft=event.clientX;" onmouseup="down=false" onmouseout="down=false">　怎样上传我的照片？</td>
					<td width="20" height="25" align="center" class="Bold" onMouseOver="this.className='Signest';" onMouseOut="this.className='Bold';" style="cursor:pointer; " onClick="Cancel();">×</td>
			</tr>
			</table>
			<table width="370" border="0" cellspacing="10" cellpadding="0">
				<tr>
				  <td class="Text">					  <p class="Text">1、选择自己最满意的一张生活照片，越清晰越好，如图：<br>
				    　&nbsp;<img src="/Models/Images/Player/Example/1.JPG" style="width: 243px;height: 210px;"> <span class="Title">zhaopian.jpg				    </span><br>
				    2、将头部部分剪切出来，特别注意要在头部周围预留一些空间，不要做成大头状，然后编辑成<span class="Sign">100x100</span>像素，存成<span class="Sign">JPG</span>格式：<br>
				    　&nbsp;<img src="/Models/Images/Player/Example/2.JPG">				    <span class="Title">id1.jpg</span><br>
				    3、将编辑好的照片连同自己的<span class="Signest">Id</span>发邮件到<a href="mailto:zhangshenjia@qq.com" target="_blank" class="Sign">zhangshenjia@qq.com</a><br>                  
				  <table width="350" height="30" border="0" align="center" cellpadding="10" cellspacing="1">
							<tr>
							  <td align="left" bgcolor="#555555" class="High"><span class="High">标题：</span><span class="Text">申请开通照片</span><br>
                                  正文： <span class="Text">站长你好，我申请开通照片功能，我的Id是</span><span class="Signest">1</span><span class="Text">，谢谢！</span><br>
                    <span class="High">附件：</span> <span class="Title">id1.jpg</span></td>
							</tr>
					</table>
				  </p>
			      </td>
				</tr>
				<tr>
				  <td class="Text">
						<table width="180" height="30" border="0" align="center" cellpadding="0" cellspacing="1" style="cursor:pointer; " onClick="Cancel();">
							<tr>
								<td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">我明白怎么上传照片了</td>
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
