<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-21
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
<link href="/Models/Css/2008.css" rel="stylesheet" type="text/css">
</head>
<body onLoad="parent.document.getElementById('World').style.display='block';">
<table border="0" cellspacing="0" cellpadding="0">
<tr height="25px" class="Title">
		<td width="40" align="center">Rank</td>
		<td width="120" align="center">Name</td>
		<td width="30" align="center">Beg</td>
		<td width="40" align="center">Int</td>
		<td width="40" align="center">Exp</td>
		<td width="25" align="center">Sum</td>
	</tr>
			<tr height="25px">
				<td align="center" class="Bold">No. <span class="Signest">1</span></td>
				<td align="center" class="High">Kamil Muranski</td>
				<td align="center" class="Text"><span class="Beg">1.26</span></td>
				<td align="center" class="Text"><span class="Int">8.50</span></td>
				<td align="center" class="Text"><span class="Exp">32.13</span></td>
				<td align="center" class="Text"><span class="Signest">41</span></td>
			</tr>
			<tr height="25px">
              <td align="center" class="Bold">No. <span class="Signest">2</span></td>
              <td align="center" class="High">Ian Fraser</td>
              <td align="center" class="Text"><span class="Beg">1.60</span></td>
              <td align="center" class="Text"><span class="Int">10.45</span></td>
              <td align="center" class="Text"><span class="Exp">33.95</span></td>
              <td align="center" class="Text"><span class="Signest">44</span></td>
  </tr>
			<tr height="25px">
			  <td align="center" class="Bold">No. <span class="Signest">3</span></td>
			  <td align="center" class="High">Manuel Heider </td>
			  <td align="center" class="Text"><span class="Beg">1.99</span></td>
			  <td align="center" class="Text"><span class="Int">10.20</span></td>
			  <td align="center" class="Text"><span class="Exp">37.48</span></td>
			  <td align="center" class="Text"><span class="Signest">48</span></td>
  </tr>
			<tr height="25px">
			  <td align="center" class="Bold">No. <span class="Signest">4</span></td>
			  <td align="center" class="High">Dion Tiu </td>
			  <td align="center" class="Text"><span class="Beg">1.70</span></td>
			  <td align="center" class="Text"><span class="Int">10.67</span></td>
			  <td align="center" class="Text"><span class="Exp">37.77</span></td>
			  <td align="center" class="Text"><span class="Signest">48</span></td>
  </tr>
			<tr height="25px">
			  <td align="center" bgcolor="#444444" class="Bold">No. <span class="Signest">5</span></td>
			  <td align="center" bgcolor="#444444" class="Sign">Zhang Shen jia</td>
			  <td align="center" bgcolor="#444444" class="Text"><span class="Beg">1.98</span></td>
			  <td align="center" bgcolor="#444444" class="Text"><span class="Int">11.34</span></td>
			  <td align="center" bgcolor="#444444" class="Text"><span class="Exp">38.82</span></td>
			  <td align="center" bgcolor="#444444" class="Text"><span class="Signest">50</span></td>
  </tr>
			<tr height="25px">
			  <td align="center" class="Bold">No. <span class="Signest">6</span></td>
			  <td align="center" class="High">Oliver Scheer </td>
			  <td align="center" class="Text"><span class="Beg">1.93</span></td>
			  <td align="center" class="Text"><span class="Int">11.99</span></td>
			  <td align="center" class="Text"><span class="Exp">39.84</span></td>
			  <td align="center" class="Text"><span class="Signest">51</span></td>
  </tr>
			<tr height="25px">
			  <td align="center" class="Bold">No. <span class="Signest">7</span></td>
			  <td align="center" class="High">Fritz Lr</td>
			  <td align="center" class="Text"><span class="Beg">1.64</span></td>
			  <td align="center" class="Text"><span class="Int">10.82</span></td>
			  <td align="center" class="Text"><span class="Exp">40.58</span></td>
			  <td align="center" class="Text"><span class="Signest">51</span></td>
  </tr>
			<tr height="25px">
			  <td align="center" class="Bold">No. <span class="Signest">8</span></td>
			  <td align="center" class="High">Damien Moore </td>
			  <td align="center" class="Text"><span class="Beg">1.67</span></td>
			  <td align="center" class="Text"><span class="Int">11.11</span></td>
			  <td align="center" class="Text"><span class="Exp">40.34</span></td>
			  <td align="center" class="Text"><span class="Signest">52</span></td>
  </tr>
<tr height="25px">
              <td align="center" bgcolor="#444444" class="Bold">No. <span class="Signest">9</span></td>
    <td align="center" bgcolor="#444444" class="Sign">Yang Xiao Yang</td>
    <td align="center" bgcolor="#444444" class="Text"><span class="Beg">2.57</span></td>
    <td align="center" bgcolor="#444444" class="Text"><span class="Int">11.60</span></td>
    <td align="center" bgcolor="#444444" class="Text"><span class="Exp">40.82</span></td>
    <td align="center" bgcolor="#444444" class="Text"><span class="Signest">53</span></td>
  </tr>
			<tr height="25px">
			  <td align="center" class="Bold">No. <span class="Signest">10</span></td>
			  <td align="center" class="High">Roman Gammel </td>
			  <td align="center" class="Text"><span class="Beg">1.87</span></td>
			  <td align="center" class="Text"><span class="Int">10.29</span></td>
			  <td align="center" class="Text"><span class="Exp">42.86</span></td>
			  <td align="center" class="Text"><span class="Signest">53</span></td>
  </tr>
			<tr height="25px" align="right">
			  <td height="35" colspan="2" align="left" class="Text"><a href="http://www.minesweeper.info/worldranking.html" target="_blank" class="Sign">点击查看完整世界排行</a></td>
              <td height="35" colspan="4" class="Text"><p>更新时间：<span class="Title">2010.8.5</span></p></td>
  </tr>
</table>
</body>
</html>
