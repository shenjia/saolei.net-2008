<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-11
'------------------------
Dim Player_Id
Dim Player_IsMine
%>
<!--#include virtual="/Models/Common/Error.asp"-->
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
<!--#include virtual="/Models/Common/Function.asp"-->
<!--#include virtual="/Models/Include/Order.asp"-->
<%
Call Get_Input()
Call Check_Input()

If Message = "No" Then

	Call Start_Conn()
	
	SQL_Text = "Player_Name "&Player_Id
	rs.Open SQL_Text,Conn,1,3
	
	Player_Name_Chinese = rs("Player_Name_Chinese")
	
	Call End_Conn()

	%>
	<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<META name="description" content="<%=Player_Name_Chinese%>的地盘">
	<META name="keywords" content="<%=Player_Name_Chinese%>,扫雷,地盘">
	<title><%=Player_Name_Chinese%>的地盘 - <%=HTML_Title%></title>
	<style type="Text/css">
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
	<link href="/Models/Css/2008.css?v=20220423" rel="stylesheet" type="Text/css">
	</head>
	<body onLoad="Top(8);">
	<!--#include virtual="/Models/Include/Top.asp"-->
	<table width="910" border="0" align="center" cellpadding="0" cellspacing="1">
	  <tr>
		<td width="604" height="500" valign="top">
			<table width="344" border="0" cellpadding="0" cellspacing="1" bgcolor="#444444">
			  <tr align="center" height="25">
				<td width="101" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" bgcolor="#333333" id="News_1" style="cursor:pointer " onClick="High('News_1');Low('News_2');Low('News_3');Low('News_4');News_Frame.location='/News/My.asp?Id=<%=Player_Id%>&Page=1&tmp='+Math.random();">进步历程</td>
				<td width="81" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" bgcolor="#333333" id="News_2" style="cursor:pointer " onClick="High('News_2');Low('News_1');Low('News_3');Low('News_4');News_Frame.location='/News/My_Beg.asp?Id=<%=Player_Id%>&Page=1&tmp='+Math.random();">初级</td>
				<td width="81" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" bgcolor="#333333" id="News_3" style="cursor:pointer " onClick="High('News_3');Low('News_2');Low('News_1');Low('News_4');News_Frame.location='/News/My_Int.asp?Id=<%=Player_Id%>&Page=1&tmp='+Math.random();">中级</td>
				<td width="81" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" bgcolor="#333333" id="News_4" style="cursor:pointer " onClick="High('News_4');Low('News_1');Low('News_2');Low('News_3');News_Frame.location='/News/My_Exp.asp?Id=<%=Player_Id%>&Page=1&tmp='+Math.random();">高级</td>
			  </tr>
			</table>
			<script language="javascript">High('News_1');</script>
		<table width="595" border="0" cellpadding="10" cellspacing="1" bgcolor="#666666">
		  <tr bgcolor="#333333">
			<td height="310" valign="top" class="Text">
				<div id="News" style="display:none ">
				<iframe name="News_Frame" frameborder="0" width="575" height="300" scrolling="no" src="/News/My.asp?Id=<%=Player_Id%>&Page=1"></iframe>
				</div>
			</td>
		  </tr>
		</table>
			<table width="604" border="0" cellpadding="0" cellspacing="0">
			  <tr height="15">
				<td></td>
			  </tr>
			</table>
			<table width="604" border="0" cellpadding="0" cellspacing="0">
			  <tr height="25">
				<td width="358">
			<table width="344" border="0" cellpadding="0" cellspacing="1" bgcolor="#444444">
			  <tr align="center" height="25">
				<td width="101" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" bgcolor="#333333" id="Video_1" style="cursor:pointer " onClick="High('Video_1');Low('Video_2');Low('Video_3');Low('Video_4');Order_Select('Order_1');Order_Blur('Order_4');Order_Hide('Order_2');Order_Hide('Order_3');File='My';Video_Frame.location='/Video/My.asp?Id=<%=Player_Id%>&Page=1&Order=Time&tmp='+Math.random();">最新录像</td>
				<td width="81" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" bgcolor="#333333" id="Video_2" style="cursor:pointer " onClick="High('Video_2');Low('Video_1');Low('Video_3');Low('Video_4');Order_Select('Order_1');Order_Blur('Order_2');Order_Blur('Order_3');Order_Blur('Order_5');Order_Show('Order_2');Order_Show('Order_3');Order_Show('Order_4');File='My_Beg';Video_Frame.location='/Video/My_Beg.asp?Id=<%=Player_Id%>&Page=1&Order=Time&tmp='+Math.random();">初级</td>
				<td width="81" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" bgcolor="#333333" id="Video_3" style="cursor:pointer " onClick="High('Video_3');Low('Video_2');Low('Video_1');Low('Video_4');Order_Select('Order_1');Order_Blur('Order_2');Order_Blur('Order_3');Order_Blur('Order_5');Order_Show('Order_2');Order_Show('Order_3');Order_Show('Order_4');File='My_Int';Video_Frame.location='/Video/My_Int.asp?Id=<%=Player_Id%>&Page=1&Order=Time&tmp='+Math.random();">中级</td>
				<td width="81" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" bgcolor="#333333" id="Video_4" style="cursor:pointer " onClick="High('Video_4');Low('Video_1');Low('Video_2');Low('Video_3');Order_Select('Order_1');Order_Blur('Order_2');Order_Blur('Order_3');Order_Blur('Order_5');Order_Show('Order_2');Order_Show('Order_3');Order_Show('Order_4');File='My_Exp';Video_Frame.location='/Video/My_Exp.asp?Id=<%=Player_Id%>&Page=1&Order=Time&tmp='+Math.random();">高级</td>
			  </tr>
			</table>
			<script language="javascript">High('Video_1');</script>
				</td>
				<td width="247" align="left" class="Text">排序方式：
				<span id="Order_1" class="Text" onClick="Order_Select('Order_1');Order_Blur('Order_2');Order_Blur('Order_3');Order_Blur('Order_4');Order_Blur('Order_5');Video_Frame.location='/Video/'+File+'.asp?Page=1&Order=Time';" style="cursor:pointer ">上传时间</span>
				<span id="Order_2" class="Text" onClick="Order_Select('Order_2');Order_Blur('Order_1');Order_Blur('Order_3');Order_Blur('Order_4');Order_Blur('Order_5');Video_Frame.location='/Video/'+File+'.asp?Page=1&Order=Score';" style="cursor:pointer ; display:none">成绩</span>
				<span id="Order_3" class="Text" onClick="Order_Select('Order_3');Order_Blur('Order_1');Order_Blur('Order_2');Order_Blur('Order_4');Order_Blur('Order_5');Video_Frame.location='/Video/'+File+'.asp?Page=1&Order=3BV';" style="cursor:pointer ; display:none">3BV</span>&nbsp;
				<span id="Order_4" class="Text" onClick="Order_Select('Order_4');Order_Blur('Order_1');Order_Blur('Order_2');Order_Blur('Order_3');Order_Blur('Order_5');Video_Frame.location='/Video/'+File+'.asp?Page=1&Order=3BVS';" style="cursor:pointer ; display:none">3BV/s</span>&nbsp;
				<span id="Order_5" class="Text" onClick="Order_Select('Order_5');Order_Blur('Order_1');Order_Blur('Order_2');Order_Blur('Order_3');Order_Blur('Order_4');Video_Frame.location='/Video/'+File+'.asp?Page=1&Order=Comment';" style="cursor:pointer ">评论</span>
			<script language="javascript">var File='My';Order_Select('Order_1');</script>
				</td>
			  </tr>
			</table>
		<table width="595" border="0" cellpadding="10" cellspacing="1" bgcolor="#666666">
		  <tr bgcolor="#333333">
			<td height="555" valign="top" class="Text">
				<div id="Video" style="display:none ">
				<iframe name="Video_Frame" frameborder="0" width="575" height="555" scrolling="no" src="/Video/My.asp?Id=<%=Player_Id%>&Page=1&Order=Time"></iframe>
				</div>
			</td>
		  </tr>
		</table>
		<td width="304" valign="top">
			<table border="0" cellpadding="0" cellspacing="1" bgcolor="#444444">
			  <tr align="center" height="25">
				<td width="100" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" bgcolor="#333333" id="Info_1" style="cursor:pointer " onClick="High('Info_1');Low('Info_2');Low('Info_3');Info_Frame.location='/Player/Info.asp?Id=<%=Player_Id%>'"><%If Player_IsMine Then%>我的信息<%Else%>个人信息<%End If%></td>
				<td width="100" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" bgcolor="#333333" id="Info_2" style="cursor:pointer " onClick="High('Info_2');Low('Info_1');Low('Info_3');Info_Frame.location='/Player/Satus.asp?Id=<%=Player_Id%>'">技术统计</td>
				<td width="100" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" bgcolor="#333333" id="Info_3" style="cursor:pointer " onClick="High('Info_3');Low('Info_2');Low('Info_1');Info_Frame.location='/Player/More.asp?Id=<%=Player_Id%>'">自我展示</td>
			  </tr>
			</table>
			<script language="javascript">High('Info_1');</script>
			<table width="303" border="0" cellpadding="5" cellspacing="1" bgcolor="#666666">
			  <tr bgcolor="#333333">
				<td height="195" valign="top" class="Text">
				<div id="Info" style="display:none ">
				<iframe name="Info_Frame" frameborder="0" width="280" height="175" scrolling="no" src="/Player/Info.asp?Id=<%=Player_Id%>"></iframe>
				</div>
				</td>
			  </tr>
			</table>
			<table width="303" border="0" cellpadding="0" cellspacing="0">
			  <tr height="15">
				<td></td>
			  </tr>
			</table>
			<table border="0" cellpadding="0" cellspacing="1" bgcolor="#444444">
			  <tr align="center" height="25">
			<%If Player_IsMine Then%>
				<td width="100" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" bgcolor="#333333" id="Do_1" style="cursor:pointer " onClick="High('Do_1');Low('Do_2');Low('Do_3');Do_Frame.location='/Player/Do.asp'">控制面板</td>
			<%End If%>
				<td width="100" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" bgcolor="#333333" id="Do_2" style="cursor:pointer " onClick="High('Do_2');Low('Do_1');Low('Do_3');Do_Frame.location='/Video/Satus.asp?Id=<%=Player_Id%>'">录像统计</td>
			<%If Session("Player_IsMaster") Then
				If Player_IsMine Then
					%><td width="100" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" bgcolor="#333333" id="Do_3" style="cursor:pointer " onClick="High('Do_3');Low('Do_1');Low('Do_2');Do_Frame.location='/Player/Do_Manage.asp'">管理面板</td><%
				Else
					%><td width="100" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" bgcolor="#333333" id="Do_3" style="cursor:pointer " onClick="High('Do_3');Low('Do_1');Low('Do_2');Do_Frame.location='/Player/Do_Manage_Other.asp?Id=<%=Player_Id%>'">管理面板</td><%
				End If
			End If
			%>
			  </tr>
			</table>
			<script language="javascript"><%If Player_IsMine Then%>High('Do_1');<%Else%>High('Do_2');<%End If%></script>
			<table width="303" border="0" cellpadding="5" cellspacing="1" bgcolor="#666666">
			  <tr bgcolor="#333333">
				<td height="125" valign="top" class="Text">
				<div id="Do" style="display:none ">
				<iframe name="Do_Frame" frameborder="0" width="280" height="115" scrolling="no" src="<%If Player_IsMine Then%>/Player/Do.asp<%Else%>/Video/Satus.asp?Id=<%=Player_Id%><%End If%>"></iframe>
				</div>
				</td>
			  </tr>
			</table>
			<table width="303" border="0" cellpadding="0" cellspacing="0">
			  <tr height="15">
				<td></td>
			  </tr>
			</table>
		<table border="0" cellpadding="0" cellspacing="1" bgcolor="#444444">
		  <tr align="center" height="25">
			<td width="100" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" bgcolor="#333333" id="History_1" style="cursor:pointer " onClick="High('History_1');Low('History_2');History_Frame.location='/Player/History_List.asp?Id=<%=Player_Id%>&Page=1'">扫雷历程</td>
			<%If Player_IsMine Then%>
			<td width="100" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" bgcolor="#333333" id="History_2" style="cursor:pointer " onClick="High('History_2');Low('History_1');History_Frame.location='/Player/History_Add.asp'">撰写历程</td>
			<%End If%>
		  </tr>
		</table>
		<script language="javascript">High('History_1');</script>
			<table width="303" border="0" cellpadding="10" cellspacing="1" bgcolor="#666666">
			  <tr bgcolor="#333333">
				<td height="300" valign="top" class="Text">
				<div id="History" style="display:none ">
				<iframe name="History_Frame" frameborder="0" width="280" height="280" scrolling="no" src="/Player/History_List.asp?Id=<%=Player_Id%>&Page=1"></iframe>
				</div>
				</td>
			  </tr>
			</table>
			<table width="303" border="0" cellpadding="0" cellspacing="0">
			  <tr height="15">
				<td></td>
			  </tr>
			</table>
		<table border="0" cellpadding="0" cellspacing="1" bgcolor="#444444">
		  <tr align="center" height="25">
			<td width="100" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" bgcolor="#333333" id="BBS_1" style="cursor:pointer " onClick="High('BBS_1');Low('BBS_2');BBS_Frame.location='/BBS/My_New.asp?Id=<%=Player_Id%>'">论坛新帖</td>
			<td width="100" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" bgcolor="#333333" id="BBS_2" style="cursor:pointer " onClick="High('BBS_2');Low('BBS_1');BBS_Frame.location='/BBS/My_Nice.asp?Id=<%=Player_Id%>'">论坛精华</td>
		  </tr>
		</table>
		<script language="javascript">High('BBS_1');</script>
		<table width="303" border="0" cellpadding="10" cellspacing="1" bgcolor="#666666">
		  <tr bgcolor="#333333">
			<td height="166" valign="top" class="Text">
			<div id="BBS" style="display:none ">
			<iframe name="BBS_Frame" frameborder="0" width="280" height="166" scrolling="no" src="/BBS/My_New.asp?Id=<%=Player_Id%>"></iframe>
			</div>
			</td>
		  </tr>
		</table>
		</td>
	  </tr>
	</table>
	<!--#include virtual="/Models/Include/Bottom.asp"-->
	</body>
	<iframe name="Action" width="0" height="0" style="display: none"></iframe>
	</html>
	<%
End If

Sub Get_Input()

	Player_Id = Session("Player_Id")
	If Request("Id") <> "" Then Player_Id = CInt(Request("Id"))

End Sub

Sub Check_Input()

	Message = "No"
	If Player_Id = "" Then Message = "未指定[用户ID],将返回到首页!"
	If Player_Id = Session("Player_Id") Then
		Player_IsMine = True
	Else
		Player_IsMine = False
	End If
	
	If Message <> "No" Then
		Act="Go"
		Link="/Main/Index.asp"
		Call Error()
	End If	
	
End Sub
%>