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
					<td height="25" class="Highest" onmousedown="down=true;divtop=event.clientY;divleft=event.clientX;" onmouseup="down=false" onmouseout="down=false">　论坛管理条例</td>
					<td width="20" height="25" align="center" class="Bold" onMouseOver="this.className='Signest';" onMouseOut="this.className='Bold';" style="cursor:pointer; " onClick="Cancel();">×</td>
			</tr>
			</table>
			<table width="500" border="0" cellspacing="10" cellpadding="0">
				<tr>
				  <td class="Text">					  <p class="Text"><span class="Title">宗旨<br>
                  </span>　　本论坛设立的宗旨是为国内扫雷玩家互相交流创造条件，促进沟通和水平进步。<br>
　　原则上不限制讨论范围，提倡扫雷话题。<br>
				  </p>
			        <table width="420" border="0" align="center" cellpadding="10" cellspacing="0">
                      <tr>
                        <td width="180" bgcolor="#555555" class="Text"><span class="Title">欢迎讨论的主题<br>
                        </span> ※ 扫雷心得体会<br>
※ 扫雷理论探索<br>
※ 扫雷问题研究<br>
※ 扫雷历程<br>
※ 扫雷新闻<br>
※ 扫雷人物故事<br>
※ 扫雷周边及其附属游戏。</td>
                        <td width="1"></td>
                        <td width="180" bgcolor="#555555" class="Text"><span class="Title">不欢迎讨论的主题</span><br>
※ 无任何意义<br>
※ 带有政治和宗教色彩<br>
※ 包含色情、YY等内容<br>
※ 包含广告、病毒等内容<br>
※ 包含违法内容<br>
※ 敏感话题<br>
※ 诽谤、诋毁、人身攻击</td>
                      </tr>
                    </table>
			        <p class="Text">
  <span class="Title">管理办法</span><br>
  　　※ 对符合以上规定的优秀主题，将加入精华或进行加亮。<br>
  　　※ 对不符合以上规定的主题和回复，将直接删除。情况恶劣时可封停直至删除用户。<br>
  <span class="Sign">　　扫雷网管理团队保留对以上条例的最终解释权。</span><br>
				      </p></td>
				</tr>
				<tr>
				  <td class="Text">
						<table width="180" height="30" border="0" align="center" cellpadding="0" cellspacing="1" style="cursor:pointer; " onClick="Cancel();">
							<tr>
								<td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">明白了，我一定遵守</td>
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
