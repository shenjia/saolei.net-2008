<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-17
'------------------------
%>
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
<!--#include virtual="/Models/Include/NoHtml.asp"-->
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
	.tbl {table-layout:fixed}
	.td {overflow:hidden;}
	-->
</style>
<link href="/Models/Css/2008.css?v=20220423" rel="stylesheet" type="text/css">
</head>	
<body onLoad="parent.document.getElementById('History').style.display='block';Scroll_Init();">
	<table width="290" border="0" cellspacing="5" cellpadding="0">
		<tr>
			<td width="260" valign="top" class="Text">
				<div id="Visible_Div" style="width:260px;height:280px;overflow:hidden;position:absolute;">
					<div id="Scroll_Div" style="position:absolute;left:0px;top:0px;overflow:visible;">
						<table id="Scroll_Table" width="255" class="tbl" border="0" cellspacing="0" cellpadding="0">
							<%
							Player_Id = CLng(Request("Id"))

							If Player_Id = Session("Player_Id") Then
								History_IsMine = True
							Else
							History_IsMine = False
						End If

						Call Start_Conn()

						SQL_Text = "History_List "&Player_Id
						rs.Open SQL_Text,Conn,3,1

						' <!-- ɾ���˱���ʱ�������ĺ����<span class="Text">���о��ô�Ϊ�� -->
						If Not rs.Eof Then

							Do While Not rs.Eof
								%><tr><td width="28%" class="td" valign="top" nowrap><div class="Title"><%=Year(rs("History_Time"))%>��<%=Month(rs("History_Time"))%>��</div></td>
									<td width="72%" class="td" valign="top"><div class="Text"><%=NoHtml(Replace(rs("History_Text"),"&lt;br&gt;","<br>"))%></div>
										<%If History_IsMine Or Session("Player_IsMaster") Then%><span class="Text">[<a href="History_Edit.asp?Id=<%=rs("History_Id")%>" class="High">�༭</a>]��<%End If%>
											<%If History_IsMine Or Session("Player_IsMaster") Then%><span class="Text">[<a href="javascript:;" onClick="if(confirm('ȷ��Ҫɾ���������̣�')) Action.location='Action/History_Del_Action.asp?Id=<%=rs("History_Id")%>';" class="High">ɾ��</a>]</span><%End If%>
											</td></tr><%
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
								<!-- ����������ť˫������ѡ��,�����ֻ��˲�����ð���¼�ȡ�������˵� -->
								<span id="Scroll_Up" onselectstart = "return false;" onmouseout="Scroll_Up_Out();" onmousemove="Scroll_Up_Move();" onmousedown="Scroll_Up_Down();" onmouseup="Scroll_Up_Up();" ontouchstart="Scroll_Up_Down();event.preventDefault();Check_Down_Classname();" ontouchmove="Scroll_Up_Move();" ontouchend="Scroll_Up_Up();" class="uButton">��</span>
							</td>
						</tr>
						<tr>
							<td height="225"></td>
						</tr>
						<tr>
							<td>
								<!-- ����������ť˫������ѡ��,�����ֻ��˲�����ð���¼�ȡ�������˵� -->
								<span id="Scroll_Down" onselectstart = "return false;" onmouseout="Scroll_Down_Out();" onmousemove="Scroll_Down_Move();" onmousedown="Scroll_Down_Down();" onmouseup="Scroll_Down_Up();" ontouchstart="Scroll_Down_Down();event.preventDefault();" ontouchmove="Scroll_Down_Move();" ontouchend="Scroll_Down_Up();" class="uButton">��</span>
							</td>
						</tr>
					</table>
				</td>
			</tr>
	</table>
<script type="text/javascript">
	var scrollInterval = 10; //��ʱ��ʱ����
	var scrollHeight = 280; //�߶ȣ�ע������޸����ֵ��table��ҲҪ��Ӧ���޸�
	var scrollDistance = 2; //�����ťʱÿ�ι����ľ���
	var upEnable = false;//��ǰ�Ƿ��ܹ�����
	var downEnable = false;//��ǰ�Ƿ��ܹ�����
	var scrollTimerUp=null;//�����ö�ʱ��
	var scrollTimerDown=null;//�����ö�ʱ��
	function Scroll_Init()
	{
		if(Scroll_Table.clientHeight>scrollHeight){
			Scroll_Down_Enable();
		}else{
			Scroll_Down_Unable();
		}
	}
	function Scroll_Up_Down(){
		if(!upEnable)return;//��ǰ���ɽ�����������

		clearInterval(scrollTimerUp);//�����ʱ��
		clearInterval(scrollTimerDown);

		scrollTimerUp=setInterval(function() {
				styelTop=parseInt(Scroll_Div.style.top);//top����ֵ
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
		if(!downEnable)return;//��ǰ���ɽ�����������

		let visibleDivHeight=parseInt(Visible_Div.style.height);//���Ӹ߶�
		let Scroll_DivHeight=parseInt(window.getComputedStyle(Scroll_Div).height);//�ɹ����߶�

		clearInterval(scrollTimerUp);//�����ʱ��
		clearInterval(scrollTimerDown);

		scrollTimerDown=setInterval(function() {
			styelTop=parseInt(Scroll_Div.style.top);//top����ֵ
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
			// ֻ�г�ʼ����ʱ��Ÿı���ʽ������ʱ�򲻸ı�Ŀǰ���ʱ��hButton��ʽ
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
		//�ֻ��˽�����ʽ�����⴦��
		if(Scroll_Down.className==='hButton'){
			Scroll_Down.className='eButton';
		}
	}
</script>
</body>
<iframe name="Action" style="display: none"></iframe>
</html>
