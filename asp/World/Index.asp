<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-25
'------------------------
%>
<!--#include virtual="/Models/Common/Const.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<META name="description" content="<%=Meta_Description%>">
<META name="keywords" content="<%=Meta_Keywords%>">
<title>雷界<%=HTML_Title%></title>
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
<link href="/Models/Css/2008.css?v=20220423" rel="stylesheet" type="text/css">
</head>
<body onLoad="Top(4);">
<!--#include virtual="/Models/Include/Top.asp"-->
<table width="910" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr>
    <td width="604" height="500" valign="top">
			<table border="0" cellpadding="0" cellspacing="1" bgcolor="#444444">
			  <tr align="center" height="25">
				<td width="100" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" bgcolor="#333333" id="World_1" style="cursor:pointer " onClick="High('World_1');World_Frame.location='/World/World.asp';">雷界众生</td>
			  </tr>
			</table>
			<script language="javascript">High('World_1');</script>
		<table width="595" border="0" cellpadding="10" cellspacing="1" bgcolor="#666666">
		  <tr bgcolor="#333333">
			<td height="535" valign="top" class="Text">
				<div id="World" style="display:none ">
				<iframe name="World_Frame" frameborder="0" width="575" height="535" scrolling="no" src="/World/World.asp"></iframe>
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
			<td width="100" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" bgcolor="#333333" id="Hero_1" style="cursor:pointer " onClick="High('Hero_1');World_Frame.location='/World/Hero.asp';">封神榜</td>
		  </tr>
		</table>
		<script language="javascript">High('Hero_1');</script>
		<table width="303" border="0" cellpadding="10" cellspacing="1" bgcolor="#666666">
		  <tr bgcolor="#333333">
			<td height="295" valign="top" class="Text">
			<div id="Hero" style="display:none ">
			<iframe name="Hero_Frame" frameborder="0" width="280" height="295" scrolling="no" src="/World/Hero.asp"></iframe>
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