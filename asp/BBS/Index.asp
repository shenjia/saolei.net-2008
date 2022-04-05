<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-31
'------------------------
%>
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
<!--#include virtual="/Models/Include/Order.asp"-->
<!--#include virtual="/Models/Include/ShowHide.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<META name="description" content="<%=Meta_Description%>">
<META name="keywords" content="<%=Meta_Keywords%>">
<title>论坛<%=HTML_Title%></title>
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
<link href="/Models/Css/2008.css?v=20220104" rel="stylesheet" type="text/css">
</head>
<body onLoad="Top(5);">
<!--#include virtual="/Models/Include/Top.asp"-->
<table width="910" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr>
    <td width="604" height="500" valign="top">
	
			<table width="604" border="0" cellpadding="0" cellspacing="0">
			  <tr height="25">
				<td width="423">
			<table border="0" cellpadding="0" cellspacing="1" bgcolor="#444444">
			  <tr align="center" height="25">
				<td width="66" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" bgcolor="#333333" id="BBS_0" style="cursor:pointer " onClick="High('BBS_0');Low('BBS_1');Low('BBS_2');Low('BBS_3');Low('BBS_4');Low('BBS_5');Order_Select('Order_1');Order_Blur('Order_2');File='BBS_All';BBS_Frame.location='/BBS/BBS_All.asp?Page=1&Order=Reply&Nice=0&tmp='+Math.random();">论坛</td>
				<td width="66" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" bgcolor="#333333" id="BBS_1" style="cursor:pointer " onClick="High('BBS_1');Low('BBS_0');Low('BBS_2');Low('BBS_3');Low('BBS_4');Low('BBS_5');Order_Select('Order_1');Order_Blur('Order_2');File='BBS_Notice';BBS_Frame.location='/BBS/BBS_Notice.asp?Page=1&Order=Reply&Nice=0&tmp='+Math.random();">公告</td>
				<td width="66" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" bgcolor="#333333" id="BBS_2" style="cursor:pointer " onClick="High('BBS_2');Low('BBS_0');Low('BBS_1');Low('BBS_3');Low('BBS_4');Low('BBS_5');Order_Select('Order_1');Order_Blur('Order_2');File='BBS_Skill';BBS_Frame.location='/BBS/BBS_Skill.asp?Page=1&Order=Reply&Nice=0&tmp='+Math.random();">技术</td>
				<td width="66" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" bgcolor="#333333" id="BBS_3" style="cursor:pointer " onClick="High('BBS_3');Low('BBS_0');Low('BBS_2');Low('BBS_1');Low('BBS_4');Low('BBS_5');Order_Select('Order_1');Order_Blur('Order_2');File='BBS_Other';BBS_Frame.location='/BBS/BBS_Other.asp?Page=1&Order=Reply&Nice=0&tmp='+Math.random();">杂谈</td>
				<td width="66" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" bgcolor="#333333" id="BBS_4" style="cursor:pointer " onClick="High('BBS_4');Low('BBS_0');Low('BBS_1');Low('BBS_2');Low('BBS_3');Low('BBS_5');Order_Select('Order_1');Order_Blur('Order_2');File='BBS_Ask';BBS_Frame.location='/BBS/BBS_Ask.asp?Page=1&Order=Reply&Nice=0&tmp='+Math.random();">问答</td>
				<%If Session("Player_Id")<>"" Then%>
				<td width="81" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" bgcolor="#333333" id="BBS_5" style="cursor:pointer " onClick="High('BBS_5');Low('BBS_1');Low('BBS_2');Low('BBS_3');Low('BBS_4');Order_Select('Order_1');Order_Blur('Order_2');File='BBS_My';BBS_Frame.location='/BBS/BBS_My.asp?Page=1&Order=Reply&Nice=0&tmp='+Math.random();">我的主题</td>
				<%End If%>
			  </tr>
			</table>
			<script language="javascript">High('BBS_0');</script>
				</td>
				<td width="180" align="left" class="Text">排序方式：
				<span id="Order_1" class="Text" onClick="Order_Select('Order_2');Order_Blur('Order_1');BBS_Frame.location='/BBS/'+File+'.asp?Page=1&Order=Reply';" style="cursor:pointer ">回复时间</span>
				<span id="Order_2" class="Text" onClick="Order_Select('Order_1');Order_Blur('Order_2');BBS_Frame.location='/BBS/'+File+'.asp?Page=1&Order=Post';" style="cursor:pointer ">发表时间</span>
			<script language="javascript">var File='BBS_All';Order_Select('Order_1');</script>
				</td>
			  </tr>
			</table>
		<table width="595" border="0" cellpadding="10" cellspacing="1" bgcolor="#666666">
		  <tr bgcolor="#333333">
			<td height="555" valign="top" class="Text">
				<div id="BBS" style="display:none ">
				<iframe name="BBS_Frame" frameborder="0" width="575" height="555" scrolling="no" src="/BBS/BBS_All.asp?Page=1&Order=Reply&Nice=0"></iframe>
				</div>
			</td>
		  </tr>
		</table>
	<table width="604" border="0" cellpadding="0" cellspacing="0">
			  <tr height="1">
				<td></td>
			  </tr>
	  </table>
	</td>
    <td width="304" valign="top">
		<table border="0" cellpadding="0" cellspacing="0" width="304">
		<tr><td>
		<table border="0" cellpadding="0" cellspacing="1" bgcolor="#444444">
		  <tr align="center" height="25">
			<%If Session("Player_Id") <> "" Then%>
			<td width="100" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" bgcolor="#333333" id="Info_1" style="cursor:pointer " onClick="High('Info_1');Low('Info_2');Low('Info_3');Info_Frame.location='/Player/Main.asp'">个人信息</td>
			<%End If%>
			<td width="100" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" bgcolor="#333333" id="Info_2" style="cursor:pointer " onClick="High('Info_2');Low('Info_1');Low('Info_3');Info_Frame.location='/Player/Star.asp'">每日一星</td>
			<td width="100" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" bgcolor="#333333" id="Info_3" style="cursor:pointer " onClick="High('Info_3');Low('Info_1');Low('Info_2');Info_Frame.location='/Main/Satus.asp'">雷界统计</td>
		  </tr>
		</table>
		<script language="javascript"><%If Session("Player_Id") <> "" Then%>High('Info_1');<%Else%>High('Info_2');<%End If%></script>
		<%If Session("Player_Id") = "" Then%>
		</td><td width="100" class="High" align="center"><a href="javascript:;" class="Text" onClick="Window('/Help/Star.asp');">如何评选?</a>
		<%End If%>
		</td></tr></table>
		<script language="javascript"><%If Session("Player_Id") <> "" Then%>High('Info_1');<%Else%>High('Info_2');<%End If%></script>
		<table width="303" border="0" cellpadding="5" cellspacing="1" bgcolor="#666666">
		  <tr bgcolor="#333333">
			<td height="195" valign="top" class="Text">
			<div id="Info" style="display:none ">
			<iframe name="Info_Frame" frameborder="0" width="280" height="175" scrolling="no" src="<%If Session("Player_Id") = "" Then%>/Player/Star.asp<%Else%>/Player/Main.asp<%End If%>"></iframe>
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
			<td width="100" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" bgcolor="#333333" id="Hot_1" style="cursor:pointer " onClick="High('Hot_1');World_Frame.location='/BBS/BBS_Hot.asp';">热议主题</td>
		  </tr>
		</table>
		<script language="javascript">High('Hot_1');</script>
		<table width="303" border="0" cellpadding="10" cellspacing="1" bgcolor="#666666">
		  <tr bgcolor="#333333">
			<td height="315" valign="top" class="Text">
			<div id="Hot" style="display:none ">
			<iframe name="Hot_Frame" frameborder="0" width="280" height="315" scrolling="no" src="/BBS/BBS_Hot.asp"></iframe>
			</div>
			</td>
		  </tr>
		</table>
	</td>
  </tr>
</table>
<!--#include virtual="/Models/Include/Bottom_Ad.asp"-->
</body>
<iframe name="Action" width="0" height="0" style="display: none"></iframe>
</html>
