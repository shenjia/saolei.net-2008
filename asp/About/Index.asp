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
			<table width="426" border="0" cellspacing="0" cellpadding="0">
				<tr bgcolor="#555555">
					<td height="25" class="Highest" onmousedown="down=true;divtop=event.clientY;divleft=event.clientX;" onmouseup="down=false" onmouseout="down=false">�����ڱ�վ</td>
					<td width="20" height="25" align="center" class="Bold" onMouseOver="this.className='Signest';" onMouseOut="this.className='Bold';" style="cursor:pointer; " onClick="Cancel();">��</td>
			</tr>
			</table>
			<table width="426" border="0" cellspacing="10" cellpadding="0">
				<tr>
				  <td class="Text">����ɨ�ף�һ��򵥶��ָ��ӵ��߼�������Ϸ.<br>
����˵�������Ϊ�������ף�ԭ��򵥡�˵�临������Ϊ�򵥵�������Ե�����ϳɸ��ָ�����Ȥ����״��ɨ�׾������Թ����������ͬ����������󣬻����ı����������������޼����ա����ֺ���ͨ��ҵ������������������������Ժ�����ַ���Ч�ʵ������Ϸ��ɨ���Ǽ������ٶȽ��ܽ�ϵ���Ϸ��ÿһ�ε���߶�����ϲ�úͷ�˼��ȥӭ����һ��ͻ�ơ�<br>
������Ϸ�����������Ƕ��й��Ƽ�¼���˷ܣ�Ҳ�й�ʹʧ�þֵľ�ɥ���������壬����νʤ������ �ܲ��٣� �������õ���̬����������Ϸ֮���㻹�ܸ��򵽸��࡭��<br>
������վּ��Ϊ���ڹ�������ṩһ������ѧϰ�Ŀռ䣬���ٹ¾���ս��������ȡ�����̣�������ߣ�û����ã�ֻ�и��á���Ҫ��Խ����Զ���Լ���<br>
������վ�Ĵ���ʼ��2006��10�£��ܵ���<span class="Signest"> Damien Moore </span>����<a href="https://minesweepergame.com/" target="_blank" class="Sign">��������</a>���������������� <span class="Signest">birdy</span> �����Ĺ�������Ϊ��㡣��վ�õ���&nbsp;<span class="Signest">[M.S]�ڽ���</span> <br>
�����峤<span class="Sign"> ���� </span>�Ĵ���Э�����ڴ˶��������˱�ʾ��ֿ�ĸ�л��</td>
				</tr>
				<tr>
				  <td class="Text">
				  <table width="406" border="0" cellspacing="0" cellpadding="0">
					  <tr>
						<td width="161">
							<table width="150" height="30" border="0" align="right" cellpadding="0" cellspacing="1" style="cursor:pointer; " onClick="parent.Window('/About/Donate.asp')">
								<tr>
									<td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';"><span class="Sign">�ṩ����</span></td>
								</tr>
						  </table>
						</td>
						<td width="143">
							<table width="120" height="30" border="0" align="center" cellpadding="0" cellspacing="1" style="cursor:pointer; " onClick="location='/History/2008.asp';">
								<tr>
									<td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">�鿴��վ������ʷ</td>
								</tr>
							</table>
						</td>
						<td width="102">
							<table width="80" height="30" border="0" align="left" cellpadding="0" cellspacing="1" style="cursor:pointer; " onClick="Cancel();">
								<tr>
									<td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">��֪����</td>
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
