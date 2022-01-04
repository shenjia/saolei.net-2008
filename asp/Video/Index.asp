<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-25
'------------------------
%>
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
<!--#include virtual="/Models/Include/Order.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<META name="description" content="<%=Meta_Description%>">
<META name="keywords" content="<%=Meta_Keywords%>">
<title>录像<%=HTML_Title%></title>
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
<body onLoad="Top(3);">
<!--#include virtual="/Models/Include/Top.asp"-->
<table width="910" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr>
    <td width="604" height="500" valign="top">
	
			<table width="604" border="0" cellpadding="0" cellspacing="0">
			  <tr height="25">
				<td width="358">
			<table width="344" border="0" cellpadding="0" cellspacing="1" bgcolor="#444444">
			  <tr align="center" height="25">
				<td width="101" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" bgcolor="#333333" id="Video_1" style="cursor:pointer " onClick="High('Video_1');Low('Video_2');Low('Video_3');Low('Video_4');Order_Select('Order_1');Order_Blur('Order_4');Order_Hide('Order_2');Order_Hide('Order_3');Order_Hide('Order_4');File='Video_All';Video_Frame.location='/Video/Video_All.asp?Page=1&Order=Time&tmp='+Math.random();">最新录像</td>
				<td width="81" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" bgcolor="#333333" id="Video_2" style="cursor:pointer " onClick="High('Video_2');Low('Video_1');Low('Video_3');Low('Video_4');Order_Select('Order_1');Order_Blur('Order_2');Order_Blur('Order_3');Order_Blur('Order_5');Order_Show('Order_2');Order_Show('Order_3');Order_Show('Order_4');File='Video_Beg';Video_Frame.location='/Video/Video_Beg.asp?Page=1&Order=Time&tmp='+Math.random();">初级</td>
				<td width="81" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" bgcolor="#333333" id="Video_3" style="cursor:pointer " onClick="High('Video_3');Low('Video_2');Low('Video_1');Low('Video_4');Order_Select('Order_1');Order_Blur('Order_2');Order_Blur('Order_3');Order_Blur('Order_5');Order_Show('Order_2');Order_Show('Order_3');Order_Show('Order_4');File='Video_Int';Video_Frame.location='/Video/Video_Int.asp?Page=1&Order=Time&tmp='+Math.random();">中级</td>
				<td width="81" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" bgcolor="#333333" id="Video_4" style="cursor:pointer " onClick="High('Video_4');Low('Video_1');Low('Video_2');Low('Video_3');Order_Select('Order_1');Order_Blur('Order_2');Order_Blur('Order_3');Order_Blur('Order_5');Order_Show('Order_2');Order_Show('Order_3');Order_Show('Order_4');File='Video_Exp';Video_Frame.location='/Video/Video_Exp.asp?Page=1&Order=Time&tmp='+Math.random();">高级</td>
			  </tr>
			</table>
			<script language="javascript">High('Video_1');</script>
				</td>
				<td width="247" align="left" class="Text">排序：
				<span id="Order_1" class="Text" onClick="Order_Select('Order_1');Order_Blur('Order_2');Order_Blur('Order_3');Order_Blur('Order_4');Order_Blur('Order_5');Video_Frame.location='/Video/'+File+'.asp?Page=1&Order=Time';" style="cursor:pointer ">上传时间</span>
				<span id="Order_2" class="Text" onClick="Order_Select('Order_2');Order_Blur('Order_1');Order_Blur('Order_3');Order_Blur('Order_4');Order_Blur('Order_5');Video_Frame.location='/Video/'+File+'.asp?Page=1&Order=Score';" style="cursor:pointer ; display:none">成绩</span>
				<span id="Order_3" class="Text" onClick="Order_Select('Order_3');Order_Blur('Order_1');Order_Blur('Order_2');Order_Blur('Order_4');Order_Blur('Order_5');Video_Frame.location='/Video/'+File+'.asp?Page=1&Order=3BV';" style="cursor:pointer ; display:none">3BV</span>&nbsp;
				<span id="Order_4" class="Text" onClick="Order_Select('Order_4');Order_Blur('Order_1');Order_Blur('Order_2');Order_Blur('Order_3');Order_Blur('Order_5');Video_Frame.location='/Video/'+File+'.asp?Page=1&Order=3BVS';" style="cursor:pointer ; display:none">3BV/s</span>&nbsp;
				<span id="Order_5" class="Text" onClick="Order_Select('Order_5');Order_Blur('Order_1');Order_Blur('Order_2');Order_Blur('Order_3');Order_Blur('Order_4');Video_Frame.location='/Video/'+File+'.asp?Page=1&Order=Comment';" style="cursor:pointer ">评论</span>
			<script language="javascript">var File='Video_All';Order_Select('Order_1');</script>
				</td>
			  </tr>
			</table>
		<table width="595" border="0" cellpadding="10" cellspacing="1" bgcolor="#666666">
		  <tr bgcolor="#333333">
			<td height="555" valign="top" class="Text">
				<div id="Video" style="display:none ">
				<iframe name="Video_Frame" frameborder="0" width="575" height="555" scrolling="no" src="/Video/Video_All.asp?Page=1&Order=Time"></iframe>
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
			<td width="100" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" bgcolor="#333333" id="Hot_1" style="cursor:pointer " onClick="High('Hot_1');World_Frame.location='/Video/Video_Hot.asp';">热评录像</td>
		  </tr>
		</table>
		<script language="javascript">High('Hot_1');</script>
		<table width="303" border="0" cellpadding="10" cellspacing="1" bgcolor="#666666">
		  <tr bgcolor="#333333">
			<td height="315" valign="top" class="Text">
			<div id="Hot" style="display:none ">
			<iframe name="Hot_Frame" frameborder="0" width="280" height="315" scrolling="no" src="/Video/Video_Hot.asp"></iframe>
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