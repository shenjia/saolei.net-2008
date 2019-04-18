<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-11
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
<!--#include virtual="/Models/Include/ShowHide.asp"-->
</head>
<body onload="Window_Load();Player_Form.Player_Name.focus();" onMousemove="move()" topmargin=0 leftmargin=0 scroll=no>
<form name="Player_Form" action="Action/Register_Action.asp" method="post" target="Action">
<table id="Window_Table" border="0" cellspacing="1" cellpadding="0" bgcolor="#999999">
	<tr>
		<td bgcolor="#444444">
			<table width="500" border="0" cellspacing="0" cellpadding="0">
				<tr bgcolor="#555555">
					<td height="25" class="Highest" onmousedown="down=true;divtop=event.clientY;divleft=event.clientX;" onmouseup="down=false" onmouseout="down=false">　填写注册信息</td>
					<td width="20" height="25" align="center" class="Bold" onMouseOver="this.className='Signest';" onMouseOut="this.className='Bold';" style="cursor:pointer; " onClick="Cancel();">×</td>
			</tr>
			</table>
			<table width="500" border="0" cellspacing="10" cellpadding="0">
				<tr>
					<td colspan="3" class="Text">
录像标识文字： <span class="Signest"><%=Session("Player_Text")%></span><input name="Player_Text" type="hidden" value="<%=Session("Player_Text")%>"> <br>
登陆名称：
<input name="Player_Name" type="text" class="input-no" id="Player_Name" size="12" maxlength="12" onfocus="Hide('Check_Name');Show('For_Player_Name');" onBlur="Hide('For_Player_Name');Action.location='Action/Name_Action.asp?Name='+this.value"> 
<span id="Check_Name" class="Sign" style="display: none"></span>
<span id="For_Player_Name" class="High" style="display: none">&nbsp;※只支持英文和数字，3~12位，注册后不能更改</span> <br>
登陆密码：
<input name="Player_Password" type="password" class="input-no" size="12" maxlength="12" onfocus="Show('For_Player_Password')" onBlur="Hide('For_Player_Password')">
<span id="For_Player_Password" class="High" style="display: none">&nbsp;※最多12位字符</span> <br>
重复密码：
<input name="Player_Password_Confirm" type="password" class="input-no" size="12" maxlength="12" onfocus="Show('For_Player_Password_Confirm')" onBlur="Hide('For_Player_Password_Confirm')">
<span id="For_Player_Password_Confirm" class="High" style="display: none">&nbsp;※请重复输入密码</span> <br>
中文姓名：
<input name="Player_Name_Chinese" type="text" class="input-no" size="12" maxlength="12" onfocus="Show('For_Player_Name_Chinese')" onBlur="Hide('For_Player_Name_Chinese')">
<span id="For_Player_Name_Chinese" class="High" style="display: none">&nbsp;※请输入真实姓名，注册后不能更改</span> <br>
姓名拼音：
<input name="Player_Name_English" type="text" class="input-no" size="20" maxlength="30" onfocus="Show('For_Player_Name_English')" onBlur="Hide('For_Player_Name_English')">
<span id="For_Player_Name_English" class="High" style="display: none">&nbsp;※以空格分隔，首字母大写，如：<font class="Signest">Zhang Shen Jia</font></span> <br>
性　　别：
<select name="Player_Sex" class="input-no" onfocus="Show('For_Player_Sex')" onBlur="Hide('For_Player_Sex')">
  <option> </option>
  <option value="1" selected>男</option>
  <option value="0">女</option>
</select>
<span id="For_Player_Sex" class="High" style="display: none">&nbsp;※注册后不能更改</span> <br>
网　　名：
<input name="Player_Name_Net" type="text" class="input-no" size="12" maxlength="20" onfocus="Show('For_Player_Name_Net')" onBlur="Hide('For_Player_Name_Net')">
<span id="For_Player_Name_Net" class="High" style="display: none">&nbsp;※请输入网名，没有可不填</span> <br>
所在地区：
<select name="Player_Area" class="input-no">
  <option>北京</option>
  <option>上海</option>
  <option>天津</option>
  <option>重庆</option>
  <option>安徽</option>
  <option>福建</option>
  <option>甘肃</option>
  <option>广东</option>
  <option>广西</option>
  <option>贵州</option>
  <option>海南</option>
  <option>河北</option>
  <option>河南</option>
  <option>黑龙江</option>
  <option>湖北</option>
  <option>湖南</option>
  <option>吉林</option>
  <option>江苏</option>
  <option>江西</option>
  <option>辽宁</option>
  <option>内蒙古</option>
  <option>宁夏</option>
  <option>青海</option>
  <option>山东</option>
  <option>山西</option>
  <option>陕西</option>
  <option>四川</option>
  <option>西藏</option>
  <option>新疆</option>
  <option>云南</option>
  <option>浙江</option>
  <option>香港</option>
  <option>澳门</option>
  <option>台湾</option>
</select><br>
电子邮箱：
<input name="Player_Email" type="text" class="input-no" size="35" maxlength="50" onfocus="Show('For_Player_Email')" onBlur="Hide('For_Player_Email')">
<span id="For_Player_Email" class="High" style="display: none">&nbsp;※请输入电子邮箱，没有可不填</span> <br>
密码提示问题：
<input name="Player_Question" type="text" class="input-no" size="30" maxlength="50" onFocus="Show('For_Player_Question')" onBlur="Hide('For_Player_Question')">
<span id="For_Player_Question" class="High" style="display: none">&nbsp;※注册后不能更改，请认真填写。</span> <br>
密码提示答案：
<input name="Player_Answer" type="text" class="input-no" size="30" maxlength="50" onfocus="Show('For_Player_Answer')" onBlur="Hide('For_Player_Answer')">
  <span id="For_Player_Answer" class="High" style="display: none">&nbsp;※注册后不能更改，请认真填写。</span>
</td>
				</tr>
				<tr>
					<td width="170" class="Text">
						<table width="110" height="30" border="0" align="right" cellpadding="0" cellspacing="1" style="cursor:pointer; " onClick="location='/Player/Register_Text.asp';">
							<tr>
								<td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">返回上一步</td>
							</tr>
						</table>
					</td>
					<td width="120" class="Text">
						<table width="110" height="30" border="0" align="center" cellpadding="0" cellspacing="1" style="cursor:pointer; " onClick="Player_Form.submit();">
							<tr>
								<td align="center" bgcolor="#555555" class="Sign">完成注册</td>
							</tr>
						</table>
					</td>
					<td width="170" class="Text">
						<table width="80" height="30" border="0" align="left" cellpadding="0" cellspacing="1" style="cursor:pointer; " onClick="Cancel();">
							<tr>
								<td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">放弃注册</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</form>
</body>
</html>
<iframe name="Action" style="display: yes"></iframe>
<script language="javascript">
function KeyDown()
{ 
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
		Player_Form.Player_Name.blur();
		Player_Form.Player_Password.blur();
		Player_Form.Player_Password_Confirm.blur();
		Player_Form.Player_Name_Chinese.blur();
		Player_Form.Player_Name_English.blur();
		Player_Form.Player_Name_Net.blur();
		Player_Form.Player_Email.blur();
		Player_Form.Player_Question.blur();
		Player_Form.Player_Answer.blur();
		parent.End_Mask();
		parent.document.getElementById('Window_Box').style.display='none';
}
</script>
