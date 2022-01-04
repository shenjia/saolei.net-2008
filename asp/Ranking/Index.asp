<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-21
'------------------------
%>
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
<!--#include virtual="/Models/Include/ShowHide.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<META name="description" content="<%=Meta_Description%>">
<META name="keywords" content="<%=Meta_Keywords%>">
<title>排行榜<%=HTML_Title%></title>
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
<body onLoad="Top(2);">
<!--#include virtual="/Models/Include/Top.asp"-->
<table width="910" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr>
    <td width="604" height="500" valign="top">
	<table width="604" border="0" cellpadding="0" cellspacing="0">
	  <tr height="25">
	  <td width="525">
		<table border="0" cellpadding="0" cellspacing="1" bgcolor="#444444">
		  <tr align="center" height="25">
			<td width="100" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" bgcolor="#333333" id="Ranking_1" style="cursor:pointer " onClick="High('Ranking_1');Low('Ranking_2');Low('Ranking_3');Low('Ranking_4');Low('Ranking_5');Low('Ranking_6');Low('Ranking_7');Show('Searchs');Rank='All';Ranking_Frame.location='/Ranking/Ranking_All.asp?Page=1&By=Player_Sum_Time_Score'">雷界排行</td>
			<td width="66" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" bgcolor="#333333" id="Ranking_2" style="cursor:pointer " onClick="High('Ranking_2');Low('Ranking_1');Low('Ranking_3');Low('Ranking_4');Low('Ranking_5');Low('Ranking_6');Low('Ranking_7');Show('Searchs');Rank='Man';Ranking_Frame.location='/Ranking/Ranking_Man.asp?Page=1&By=Player_Sum_Time_Score'">人界</td>
			<td width="66" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" bgcolor="#333333" id="Ranking_3" style="cursor:pointer " onClick="High('Ranking_3');Low('Ranking_2');Low('Ranking_1');Low('Ranking_4');Low('Ranking_5');Low('Ranking_6');Low('Ranking_7');Show('Searchs');Rank='Hero';Ranking_Frame.location='/Ranking/Ranking_Hero.asp?Page=1&By=Player_Sum_Time_Score'">神界</td>
			<td width="66" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" bgcolor="#333333" id="Ranking_4" style="cursor:pointer " onClick="High('Ranking_4');Low('Ranking_2');Low('Ranking_1');Low('Ranking_3');Low('Ranking_5');Low('Ranking_6');Low('Ranking_7');Show('Searchs');Rank='NF';Ranking_Frame.location='/Ranking/Ranking_NF.asp?Page=1&By=Player_Sum_Time_Score_NF'">NF</td>
			<td width="66" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" bgcolor="#333333" id="Ranking_5" style="cursor:pointer " onClick="High('Ranking_5');Low('Ranking_2');Low('Ranking_1');Low('Ranking_3');Low('Ranking_4');Low('Ranking_6');Low('Ranking_7');Hide('Searchs');Rank='Grow';Ranking_Frame.location='/Ranking/Ranking_Grow.asp?Page=1'">进步</td>
			<td width="66" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" bgcolor="#333333" id="Ranking_6" style="cursor:pointer " onClick="High('Ranking_6');Low('Ranking_2');Low('Ranking_1');Low('Ranking_3');Low('Ranking_4');Low('Ranking_5');Low('Ranking_7');Hide('Searchs');Ranking_Frame.location='/Ranking/Ranking_Area.asp?Page=1&By=Area_Power'">地区</td>
			<td width="66" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" bgcolor="#333333" id="Ranking_7" style="cursor:pointer " onClick="High('Ranking_7');Low('Ranking_2');Low('Ranking_1');Low('Ranking_3');Low('Ranking_4');Low('Ranking_5');Low('Ranking_6');Show('Searchs');Rank='Click';Ranking_Frame.location='/Ranking/Ranking_Click.asp?Page=1&By=Player_Click_Today'">人气</td>
		  </tr>
		</table>
		<script language="javascript">High('Ranking_1');var Rank='All';</script>
		</td><td width="80"><span id="Searchs" class="Sign" style="cursor:pointer " onClick="top.Window('/Ranking/Goto.asp?Rank='+Rank);">我在哪里?</span></td></tr>
		</table>		
		<table width="595" border="0" cellpadding="10" cellspacing="1" bgcolor="#666666">
		  <tr bgcolor="#333333">
			<td height="554" valign="top" class="Text">
				<div id="Ranking" style="display:none ">
				<iframe name="Ranking_Frame" id="Ranking_Frame" frameborder="0" width="575" height="554" scrolling="no" src="/Ranking/Ranking_All.asp?Page=1&By=Player_Sum_Time_Score"></iframe>
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
			<td width="100" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" bgcolor="#333333" id="World_1" style="cursor:pointer " onClick="High('World_1');Low('World_2');World_Frame.location='/Ranking/Top10_World.asp'">世界TOP10</td>
			<td width="100" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" bgcolor="#333333" id="World_2" style="cursor:pointer " onClick="High('World_2');Low('World_1');World_Frame.location='/Ranking/Top10_World_Help.asp'">如何加入</td>
		  </tr>
		</table>
		<script language="javascript">High('World_1');</script>
		<table width="303" border="0" cellpadding="10" cellspacing="1" bgcolor="#666666">
		  <tr bgcolor="#333333">
			<td height="315" valign="top" class="Text">
			<div id="World" style="display:none ">
			<iframe name="World_Frame" frameborder="0" width="280" height="315" scrolling="no" src="/Ranking/Top10_World.asp"></iframe>
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