<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-26
'------------------------
%>
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
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
		background-color: #333333;
	}
	-->
</style>
<link href="/Models/Css/2008.css?v=20211218" rel="stylesheet" type="text/css">
</head>
<body onLoad="parent.document.getElementById('Hero').style.display='block';Scroll_Init();">
	<table width="290" border="0" cellspacing="5" cellpadding="0">
		<tr>
			<td width="260" valign="top" class="Text">
				<div id="Visible_Div" style="width:260px;height:280px;overflow:hidden;position:absolute;">
					<div id="Scroll_Div" style="position:absolute;left:0px;top:0px;overflow:visible;">
						<table id="Scroll_Table" width="255" class="tbl" border="0" cellspacing="0" cellpadding="0">
							<%
							Call Start_Conn()

							SQL_Text = "Hero_List"
							rs.Open SQL_Text,Conn,3,1

							If Not rs.Eof Then

								Do While Not rs.Eof
									%>
									<tr onMouseOver="this.style.background='#444444';" onMouseOut="this.style.background='#333333';">
										<td width="155" class="Text" valign="top"><span class="Texts">[</span><span onClick="top.Window('/Help/Title.asp');" class="<%=rs("Player_Title")%>" title="点击查看称号说明"><%=rs("Player_Title")%></span><span class="Texts">]</span> <a href="javascript:;" onClick="top.Window('/Player/Show.asp?Id=<%=rs("Player_Id")%>');" class="High" title="点击查看个人信息"><%=rs("Player_Name_Chinese")%></a>(高级<%=FormatNumber(rs("Player_Exp_Time_Score"),2)%>)</td>
<td width="100" class="Text" valign="top"><%=FormatDateTime(rs("Player_Hero_Time"),1)%></td></tr><%
rs.MoveNext
Loop		

End If

Call End_Conn()
%>
</table>
</div>
</div>
</td>
<td width="20" align="center" valign="top">	<table width="20" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td>
			<!-- 设置上拉按钮双击不可选中,兼容手机端并屏蔽冒泡事件取消长按菜单 -->
								<span id="Scroll_Up" onselectstart = "return false;" onmouseout="Scroll_Up_Out();" onmousemove="Scroll_Up_Move();" onmousedown="Scroll_Up_Down();" onmouseup="Scroll_Up_Up();" ontouchstart="Scroll_Up_Down();event.preventDefault();Check_Down_Classname();" ontouchmove="Scroll_Up_Move();" ontouchend="Scroll_Up_Up();" class="uButton">▲</span>
		</td>
	</tr>
	<tr>
		<td height="245"></td>
	</tr>
	<tr>
		<td>
			<!-- 设置下拉按钮双击不可选中,兼容手机端并屏蔽冒泡事件取消长按菜单 -->
								<span id="Scroll_Down" onselectstart = "return false;" onmouseout="Scroll_Down_Out();" onmousemove="Scroll_Down_Move();" onmousedown="Scroll_Down_Down();" onmouseup="Scroll_Down_Up();" ontouchstart="Scroll_Down_Down();event.preventDefault();" ontouchmove="Scroll_Down_Move();" ontouchend="Scroll_Down_Up();" class="uButton">▼</span>
		</td>
	</tr>
</table>
</td>
</tr>
</table>
<script type="text/javascript">
	var scrollInterval = 10; //定时器时间间隔
	var scrollHeight = 280; //高度，注意如果修改这个值，table中也要相应的修改
	var scrollDistance = 2; //点击按钮时每次滚动的距离
	var upEnable = false;//当前是否能够上拉
	var downEnable = false;//当前是否能够下拉
	var scrollTimerUp=null;//上拉用定时器
	var scrollTimerDown=null;//下拉用定时器
	function Scroll_Init()
	{
		if(Scroll_Table.clientHeight>scrollHeight){
			Scroll_Down_Enable();
		}else{
			Scroll_Down_Unable();
		}
	}
	function Scroll_Up_Down(){
		if(!upEnable)return;//当前不可进行上拉操作

		clearInterval(scrollTimerUp);//清除定时器
		clearInterval(scrollTimerDown);

		scrollTimerUp=setInterval(function() {
				styelTop=parseInt(Scroll_Div.style.top);//top属性值
				if(styelTop+scrollDistance<0){
					Scroll_Div.style.top=styelTop+scrollDistance;
					Scroll_Down_Enable();
				}else{
					Scroll_Div.style.top=0;
					Scroll_Up_Unable();
					clearInterval(scrollTimerUp);
				}
			}, scrollInterval);
	}
	function Scroll_Down_Down(){
		if(!downEnable)return;//当前不可进行下拉操作

		let visibleDivHeight=parseInt(Visible_Div.style.height);//可视高度
		let Scroll_DivHeight=parseInt(window.getComputedStyle(Scroll_Div).height);//可滚动高度

		clearInterval(scrollTimerUp);//清除定时器
		clearInterval(scrollTimerDown);

		scrollTimerDown=setInterval(function() {
			styelTop=parseInt(Scroll_Div.style.top);//top属性值
			if(visibleDivHeight-styelTop+scrollDistance<Scroll_DivHeight){
				Scroll_Div.style.top=styelTop-scrollDistance;
				Scroll_Up_Enable();
				Scroll_Down_Enable();
			}else if(Scroll_DivHeight>visibleDivHeight){
				Scroll_Div.style.top=visibleDivHeight-Scroll_DivHeight;
				Scroll_Down_Unable();
				Scroll_Up_Enable();
				clearInterval(scrollTimerDown);
			}
		}, scrollInterval);
	}
	function Scroll_Down_Move(){
		if(downEnable){
			Scroll_Down.className='hButton';
		}
	}
	function Scroll_Down_Out(){
		clearInterval(scrollTimerDown);
		if(downEnable){
			Scroll_Down.className='eButton';
		}else{
			Scroll_Down.className='uButton';
		}
	}
	function Scroll_Up_Move(){
		if(upEnable){
			Scroll_Up.className='hButton';
		}
	}
	function Scroll_Up_Out(){
		clearInterval(scrollTimerUp);
		if(upEnable){
			Scroll_Up.className='eButton';
		}else{
			Scroll_Up.className='uButton';
		}
	}
	function Scroll_Down_Unable(){
		downEnable=false;
		Scroll_Down.className='uButton';
	}
	function Scroll_Down_Enable(){
		downEnable=true;
		if(Scroll_Down.className==='uButton'){
			// 只有初始化的时候才改变样式，其他时候不改变目前点击时的hButton样式
			Scroll_Down.className='eButton';
		}
	}
	function Scroll_Up_Unable(){
		upEnable=false;
		Scroll_Up.className='uButton';
	}
	function Scroll_Up_Enable(){
		upEnable=true;
		Scroll_Up.className='eButton';
	}
	function Scroll_Up_Up(){
		clearInterval(scrollTimerUp);
	}
	function Scroll_Down_Up(){
		clearInterval(scrollTimerDown);
	}
	function Check_Down_Classname() {
		//手机端进行样式的特殊处理
		if(Scroll_Down.className==='hButton'){
			Scroll_Down.className='eButton';
		}
	}
</script>
</body>
<iframe name="Action" style="display: none"></iframe>
</html>
