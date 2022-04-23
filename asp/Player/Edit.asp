<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-31
'------------------------
Dim Player_Id
%>
<!--#include virtual="/Player/Check.asp"-->
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
<!--#include virtual="/Models/Common/Function.asp"-->
<%
Call Check_Master()
Call Get_Input()
Call Check_Input()

If Message = "No" And Check_Result <> "Fail" Then

	Call Start_Conn()
	
	SQL_Text = "Player_Read "&Player_Id
	rs.Open SQL_Text,Conn,3,1
	
	Player_Password = rs("Player_Password")
	Player_Name = rs("Player_Name")
	Player_Name_Chinese = rs("Player_Name_Chinese")
	Player_Name_English = rs("Player_Name_English")
	Player_Name_Net = rs("Player_Name_Net")
	Player_Area = rs("Player_Area")
	Player_Email = rs("Player_Email")
	Player_QQ = rs("Player_QQ")
	Player_Mouse = rs("Player_Mouse")
	Player_Pad = rs("Player_Pad")
	Player_Interest = rs("Player_Interest")
	Player_Year = CInt(rs("Player_Year"))
	Player_Month = CInt(rs("Player_Month"))
	Player_Text = rs("Player_Text")
	Player_Sex = rs("Player_Sex")
	Player_Image = rs("Player_Image")
	Player_Register_Time = rs("Player_Register_Time")
	Player_Login_Time = rs("Player_Login_Time")
	Player_IP = rs("Player_IP")
	Player_IsMaster = rs("Player_IsMaster")
	Player_Question = rs("Player_Question")
	Player_Answer = rs("Player_Answer")
	
	Call End_Conn()	
	
	If Player_Year = 0 Then Player_Year = 1980
	If Player_Month = 0 Then Player_Month = 1
	
	If Player_IsMaster And (Session("Player_Id") <> 1) Then
		Message = "您无权执行此操作！"
		Act = "parent.End_Mask();parent.document.getElementById('Window_Box').style.display='none';"
		Call Error()
	Else
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
	<link href="/Models/Css/2008.css?v=20220423" rel="stylesheet" type="text/css">
	<!--#include virtual="/Models/Include/Windows.asp"-->
	<!--#include virtual="/Models/Include/ShowHide.asp"-->
	</head>
	<body onload="Window_Load();" onMousemove="move()" topmargin=0 leftmargin=0 scroll=no>
	<form name="Player_Form" action="Action/Edit_Action.asp" method="post" target="Action">
	<table id="Window_Table" border="0" cellspacing="1" cellpadding="0" bgcolor="#999999">
		<tr>
			<td bgcolor="#444444">
				<table width="500" border="0" cellspacing="0" cellpadding="0">
					<tr bgcolor="#555555">
						<td height="25" class="Highest" onmousedown="down=true;divtop=event.clientY;divleft=event.clientX;" onmouseup="down=false" onmouseout="down=false">　编辑用户</td>
						<td width="20" height="25" align="center" class="Bold" onMouseOver="this.className='Signest';" onMouseOut="this.className='Bold';" style="cursor:pointer; " onClick="Cancel();">×</td>
				</tr>
				</table>
				<table width="500" border="0" cellspacing="10" cellpadding="0">
					<tr>
					  <td width="120" class="Text">
			<%
			If Player_Image Then
				%><img src="/Models/Images/Player/<%=Player_Id%>.jpg" border="1" align="absmiddle" style="border-color:#999999;"><%
			Else
				%><img src="/Models/Images/Player/No.jpg" border="1" align="absmiddle" style="border-color:#999999; cursor:pointer" onclick="top.Window('/Help/Image.asp');" title="如何上传照片？"><%
			End If%>
	</td><td width="170" class="Text">
						<span class="Sign"><%=Player_Name_Chinese%></span>(<%=Player_Name_English%>)
						<br>
	登录名称：<span class="High"><%=Player_Name%></span><br>
	登录密码：<span class="High"><%=Player_Password%></span><br>
	<input name="Player_Id" type="hidden" value="<%=Player_Id%>">
	</td>
			  <td width="170" class="Text">注册时间：<%=FormatDateTime(Player_Register_Time,1)%><br>
			    最近登录：<%=FormatDateTime(Player_Login_Time,1)%><br>
			    登录ＩＰ：<span class="Title"><%=Player_IP%></span></td>
			  </table>
	<table width="500" border="0" cellspacing="0" cellpadding="0">
	  <tr>
		<td height="1" bgcolor="#555555"></td>
	  </tr>
	</table>
	<table width="500" border="0" cellspacing="10" cellpadding="0">
	<tr>
	<td colspan="3" class="Text">
中文姓名：
<input name="Player_Name_Chinese" type="text" class="input-no" size="12" maxlength="12" onfocus="Show('For_Player_Name_Chinese')" onBlur="Hide('For_Player_Name_Chinese')" value="<%=Player_Name_Chinese%>">
<span id="For_Player_Name_Chinese" class="High" style="display: none">&nbsp;※请输入真实姓名，注册后不能更改</span>
	<%If Session("Player_Id") = 1 Then%>
  <input name="Player_IsMaster" id="Player_IsMaster" type="checkbox" value="1"<%If Player_IsMaster Then%> checked<%End If%>><label for="Player_IsMaster">管理员</label>
  <input name="Player_Image" id="Player_Image" type="checkbox" value="1"<%If Player_Image Then%> checked<%End If%>><label for="Player_Image">开通照片</label>
  <%End If%>
<br>
姓名拼音：
<input name="Player_Name_English" type="text" class="input-no" size="20" maxlength="30" onfocus="Show('For_Player_Name_English')" onBlur="Hide('For_Player_Name_English')" value="<%=Player_Name_English%>">
<span id="For_Player_Name_English" class="High" style="display: none">&nbsp;※以空格分隔，首字母大写，如：<font class="Signest">Zhang Shen Jia</font></span> <br>
网　　名：
<input name="Player_Name_Net" type="text" class="input-no" size="12" maxlength="20" onfocus="Show('For_Player_Name_Net')" onBlur="Hide('For_Player_Name_Net')" value="<%=Player_Name_Net%>">
<span id="For_Player_Name_Net" class="High" style="display: none">&nbsp;※请输入网名，没有可不填</span> <br>
性　　别：
<select name="Player_Sex" class="input-no" onfocus="Show('For_Player_Sex')" onBlur="Hide('For_Player_Sex')">
  <option value="1" <%If Player_Sex Then%>selected<%End If%>>男</option>
  <option value="0" <%If Not Player_Sex Then%>selected<%End If%>>女</option>
</select>
<span id="For_Player_Sex" class="High" style="display: none">&nbsp;※注册后不能更改</span> <br>
	所在地区：
	<select name="Player_Area" class="input-no">
	  <option <%If Player_Area = "北京" Then%>selected<%End If%>>北京</option>
	  <option <%If Player_Area = "上海" Then%>selected<%End If%>>上海</option>
	  <option <%If Player_Area = "天津" Then%>selected<%End If%>>天津</option>
	  <option <%If Player_Area = "重庆" Then%>selected<%End If%>>重庆</option>
	  <option <%If Player_Area = "安徽" Then%>selected<%End If%>>安徽</option>
	  <option <%If Player_Area = "福建" Then%>selected<%End If%>>福建</option>
	  <option <%If Player_Area = "甘肃" Then%>selected<%End If%>>甘肃</option>
	  <option <%If Player_Area = "广东" Then%>selected<%End If%>>广东</option>
	  <option <%If Player_Area = "广西" Then%>selected<%End If%>>广西</option>
	  <option <%If Player_Area = "贵州" Then%>selected<%End If%>>贵州</option>
	  <option <%If Player_Area = "海南" Then%>selected<%End If%>>海南</option>
	  <option <%If Player_Area = "河北" Then%>selected<%End If%>>河北</option>
	  <option <%If Player_Area = "河南" Then%>selected<%End If%>>河南</option>
	  <option <%If Player_Area = "黑龙江" Then%>selected<%End If%>>黑龙江</option>
	  <option <%If Player_Area = "湖北" Then%>selected<%End If%>>湖北</option>
	  <option <%If Player_Area = "湖南" Then%>selected<%End If%>>湖南</option>
	  <option <%If Player_Area = "吉林" Then%>selected<%End If%>>吉林</option>
	  <option <%If Player_Area = "江苏" Then%>selected<%End If%>>江苏</option>
	  <option <%If Player_Area = "江西" Then%>selected<%End If%>>江西</option>
	  <option <%If Player_Area = "辽宁" Then%>selected<%End If%>>辽宁</option>
	  <option <%If Player_Area = "内蒙古" Then%>selected<%End If%>>内蒙古</option>
	  <option <%If Player_Area = "宁夏" Then%>selected<%End If%>>宁夏</option>
	  <option <%If Player_Area = "青海" Then%>selected<%End If%>>青海</option>
	  <option <%If Player_Area = "山东" Then%>selected<%End If%>>山东</option>
	  <option <%If Player_Area = "山西" Then%>selected<%End If%>>山西</option>
	  <option <%If Player_Area = "陕西" Then%>selected<%End If%>>陕西</option>
	  <option <%If Player_Area = "四川" Then%>selected<%End If%>>四川</option>
	  <option <%If Player_Area = "西藏" Then%>selected<%End If%>>西藏</option>
	  <option <%If Player_Area = "新疆" Then%>selected<%End If%>>新疆</option>
	  <option <%If Player_Area = "云南" Then%>selected<%End If%>>云南</option>
	  <option <%If Player_Area = "浙江" Then%>selected<%End If%>>浙江</option>
	  <option <%If Player_Area = "香港" Then%>selected<%End If%>>香港</option>
	  <option <%If Player_Area = "澳门" Then%>selected<%End If%>>澳门</option>
	  <option <%If Player_Area = "台湾" Then%>selected<%End If%>>台湾</option>
	</select><br>
	
	  出生年月：
	  <select name="Player_Year" class="input-no">
	  <%
	  For Y = 1900 To Year(Now)%>
	  <option value="<%=Y%>"<%If Y = Player_Year Then%>selected<%End If%>><%=Y%>年</option>
	  <%Next%>
	  </select>
	  <select name="Player_Month" class="input-no">
	  <%
	  For M = 1 To 12%>
	  <option value="<%=M%>"<%If M = Player_Month Then%>selected<%End If%>><%=M%>月</option>
	  <%Next%>
	  </select>
	  <br>
	  电子邮箱：
	<input name="Player_Email" type="text" class="input-no" size="35" maxlength="50" onfocus="Show('For_Player_Email')" onBlur="Hide('For_Player_Email')" value="<%=Player_Email%>">
	<span id="For_Player_Email" class="High" style="display: none">&nbsp;※请输入电子邮箱，没有可不填</span><br>
	ＱＱ号码：
	<input name="Player_QQ" type="text" class="input-no" size="12" maxlength="12" onfocus="Show('For_Player_QQ')" onBlur="Hide('For_Player_QQ')" value="<%=Player_QQ%>">
	<span id="For_Player_QQ" class="High" style="display: none">※请输入QQ，没有可不填</span><br>
	我的鼠标：
	<input name="Player_Mouse" type="text" class="input-no" size="35" maxlength="50" onfocus="Show('For_Player_Mouse')" onBlur="Hide('For_Player_Mouse')" value="<%=Player_Mouse%>">
	<span id="For_Player_Mouse" class="High" style="display: none">&nbsp;※请输入鼠标型号，没有可不填</span>
	<br>
	我的鼠标垫：
	<input name="Player_Pad" type="text" class="input-no" size="35" maxlength="50" onfocus="Show('For_Player_Pad')" onBlur="Hide('For_Player_Pad')" value="<%=Player_Pad%>">
	<span id="For_Player_Pad" class="High" style="display: none">&nbsp;※请输入鼠标垫型号，没有可不填</span>
	<br>
	兴趣爱好：
	<input name="Player_Interest" type="text" class="input-no" size="50" maxlength="38" onfocus="Show('For_Player_Interest')" onBlur="Hide('For_Player_Interest')" value="<%=Player_Interest%>">
    <span id="For_Player_Interest" class="High" style="display: none">&nbsp;※40字内，可不填</span><br>
录像标识文字：	
<input name="Player_Text" type="text" class="input-no" size="45" maxlength="50" value="<%=Player_Text%>"><br>
密码提示问题：
<input name="Player_Question" type="text" class="input-no" size="30" maxlength="50" onFocus="Show('For_Player_Question')" onBlur="Hide('For_Player_Question')" value="<%=Player_Question%>">
<span id="For_Player_Question" class="High" style="display: none">&nbsp;※注册后不能更改，请认真填写。</span> <br>
密码提示答案：
<input name="Player_Answer" type="text" class="input-no" size="30" maxlength="50" onfocus="Show('For_Player_Answer')" onBlur="Hide('For_Player_Answer')" value="<%=Player_Answer%>">
  <span id="For_Player_Answer" class="High" style="display: none">&nbsp;※注册后不能更改，请认真填写。</span>
	</td>
		  </tr>
					<tr>
						<td width="170" class="Text">
							<table width="110" height="30" border="0" align="right" cellpadding="0" cellspacing="1" style="cursor:pointer; " onClick="Player_Form.submit();">
								<tr>
									<td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">提交修改</td>
								</tr>
							</table>
						</td>
						<td width="120" class="Text">
							<table width="110" height="30" border="0" align="center" cellpadding="0" cellspacing="1" style="cursor:pointer; " onClick="Player_Form.reset();">
								<tr>
									<td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">恢复原样</td>
								</tr>
							</table>
						</td>
						<td width="170" class="Text">
							<table width="80" height="30" border="0" align="left" cellpadding="0" cellspacing="1" style="cursor:pointer; " onClick="Cancel();">
								<tr>
									<td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">放弃修改</td>
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
			case 13:
			Player_Form.submit();
			break;
			case 27:
			Cancel();      
			break;
		}
	}		
	document.onkeydown=KeyDown; 
	document.onkeypress=KeyDown;

	function Cancel()
	{
			Player_Form.Player_Email.blur();
			Player_Form.Player_QQ.blur();
			Player_Form.Player_Mouse.blur();
			Player_Form.Player_Pad.blur();
			Player_Form.Player_Interest.blur();
			
			parent.End_Mask();
			parent.document.getElementById('Window_Box').style.display='none';
	}
	</script>
	<%
	End If
End If

Sub Get_Input()

	Player_Id = Request("Id")

End Sub

Sub Check_Input()

	Message = "No"
	
	If Player_Id <> "" And Check_Express(Player_Id,"\d{1,6}") Then Message = "您指定的[ID]不合法!"
	
	If Message <> "No" Then
		Act="No"
		Call Error()
	End If	
	
End Sub
%>
