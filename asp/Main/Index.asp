<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-11
'------------------------
%>
<!--#include virtual="/Models/Common/Const.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<META name="description" content="<%=Meta_Description%>">
<META name="keywords" content="<%=Meta_Keywords%>">
<title><%=Index_Title%></title>
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
<link href="/Models/Css/2008.css" rel="stylesheet" type="text/css">
</head>
<body onLoad="Top(1);">
<!--#include virtual="/Models/Include/Top.asp"-->
<table width="910" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr>
    <td width="604" height="500" valign="top">
		<table width="263" border="0" cellpadding="0" cellspacing="1" bgcolor="#444444">
		  <tr align="center" height="25">
			<td width="101" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" bgcolor="#333333" id="News_1" style="cursor:pointer " onClick="High('News_1');Low('News_2');Low('News_3');News_Frame.location='/News/Index.asp?Page=1'">雷界快讯</td>
			<td width="81" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" bgcolor="#333333" id="News_2" style="cursor:pointer " onClick="High('News_2');Low('News_1');Low('News_3');News_Frame.location='/News/Man.asp?Page=1'">人界</td>
			<td width="81" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" bgcolor="#333333" id="News_3" style="cursor:pointer " onClick="High('News_3');Low('News_2');Low('News_1');News_Frame.location='/News/Hero.asp?Page=1'">神界</td>
		  </tr>
		</table>
		<script language="javascript">High('News_1');</script>
		<table width="595" border="0" cellpadding="10" cellspacing="1" bgcolor="#666666">
		  <tr bgcolor="#333333">
			<td height="310" valign="top" class="Text">
				<div id="News" style="display:none ">
				<iframe name="News_Frame" frameborder="0" width="575" height="300" scrolling="no" src="/News/Index.asp?Page=1"></iframe>
				</div>
			</td>
		  </tr>
		</table>
		<table width="604" border="0" cellpadding="0" cellspacing="0">
		  <tr height="15">
			<td></td>
		  </tr>
		</table>
		<table width="263" border="0" cellpadding="0" cellspacing="1" bgcolor="#444444">
		  <tr align="center" height="25">
			<td width="101" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" bgcolor="#333333" id="Video_1" style="cursor:pointer " onClick="High('Video_1');Low('Video_2');Low('Video_3');Video_Frame.location='/Video/New_Index.asp?Page=1'">最新录像</td>
			<td width="81" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" bgcolor="#333333" id="Video_2" style="cursor:pointer " onClick="High('Video_2');Low('Video_1');Low('Video_3');Video_Frame.location='/Video/New_Man.asp?Page=1'">人界</td>
			<td width="81" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" bgcolor="#333333" id="Video_3" style="cursor:pointer " onClick="High('Video_3');Low('Video_2');Low('Video_1');Video_Frame.location='/Video/New_Hero.asp?Page=1'">神界</td>
		  </tr>
		</table>
		<script language="javascript">High('Video_1');</script>
		<table width="595" border="0" cellpadding="10" cellspacing="1" bgcolor="#666666">
		  <tr bgcolor="#333333">
			<td height="555" valign="top" class="Text">
				<div id="Video" style="display:none ">
				<iframe name="Video_Frame" frameborder="0" width="575" height="555" scrolling="no" src="/Video/New_Index.asp?Page=1"></iframe>
				</div>
			</td>
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
		<table border="0" cellpadding="0" cellspacing="0" width="304">
		<tr><td>
		<table border="0" cellpadding="0" cellspacing="1" bgcolor="#444444">
		  <tr align="center" height="25">
			<td width="100" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" bgcolor="#333333" id="BBS_1" style="cursor:pointer " onClick="High('BBS_1');Low('BBS_2');BBS_Frame.location='/BBS/Index_New.asp?Page=1'">论坛新帖</td>
			<td width="100" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" bgcolor="#333333" id="BBS_2" style="cursor:pointer " onClick="High('BBS_2');Low('BBS_1');BBS_Frame.location='/BBS/Index_Nice.asp?Page=1'">论坛精华</td>
		  </tr>
		</table>
		</td>
		<td width="100" class="High" align="center"><a href="/BBS/Title.asp?Id=1187" class="Text" target="_blank">加入QQ群!</a></td>
		</tr></table>
		<script language="javascript">High('BBS_1');</script>
		<table width="303" border="0" cellpadding="10" cellspacing="1" bgcolor="#666666">
		  <tr bgcolor="#333333">
			<td height="107" valign="top" class="Text">
			<div id="BBS" style="display:none ">
			<iframe name="BBS_Frame" frameborder="0" width="280" height="107" scrolling="no" src="/BBS/Index_New.asp?Page=1"></iframe>
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
			<td width="100" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" bgcolor="#333333" id="Top10_1" style="cursor:pointer " onClick="High('Top10_1');Low('Top10_2');Low('Top10_3');Top10_Frame.location='/Ranking/Top10_Hero.asp'">神界TOP10</td>
			<td width="100" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" bgcolor="#333333" id="Top10_2" style="cursor:pointer " onClick="High('Top10_2');Low('Top10_1');Low('Top10_3');Top10_Frame.location='/Ranking/Top10_Man.asp'">人界TOP10</td>
			<td width="100" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" bgcolor="#333333" id="Top10_3" style="cursor:pointer " onClick="High('Top10_3');Low('Top10_2');Low('Top10_1');Top10_Frame.location='/Ranking/Top10_Grow.asp'">进步TOP10</td>
		  </tr>
		</table>
		<script language="javascript">High('Top10_1');</script>
		<table width="303" border="0" cellpadding="10" cellspacing="1" bgcolor="#666666">
		  <tr bgcolor="#333333">
			<td height="290" valign="top" class="Text">
			<div id="Top10" style="display:none ">
			<iframe name="Top10_Frame" frameborder="0" width="280" height="270" scrolling="no" src="/Ranking/Top10_Hero.asp"></iframe>
			</div>
			</td>
		  </tr>
		</table>
		<table width="303" border="0" cellpadding="0" cellspacing="0">
		  <tr height="15">
			<td></td>
		  </tr>
		</table>
		<table border="0" cellpadding="0" cellspacing="0">
		<tr><td>
		<table border="0" cellpadding="0" cellspacing="1" bgcolor="#444444">
		  <tr align="center" height="25">
			<td width="100" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" bgcolor="#333333" id="Help_1" style="cursor:pointer " onClick="High('Help_1');Help_Frame.location='/Help/List.asp'">常见问题</td>
		  </tr>
		</table>
		</td>
		<td width="100" class="High" align="center"><a href="/BBS/Index.asp" class="Text" target="_blank">我有其他问题!</a></td>
		</tr></table>
		<script language="javascript">High('Help_1');</script>
		<table width="303" border="0" cellpadding="5" cellspacing="1" bgcolor="#666666">
		  <tr bgcolor="#333333">
			<td height="195" valign="top" class="Text">
			<div id="Help" style="display:none ">
			<iframe name="Help_Frame" frameborder="0" width="280" height="175" scrolling="no" src="/Help/List.asp"></iframe>
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

