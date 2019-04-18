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
				<td align="center" class="Text"><span class="Beg">0.49</span></td>
				<td align="center" class="Text"><span class="Int">7.03</span></td>
				<td align="center" class="Text"><span class="Exp">31.13</span></td>
				<td align="center" class="Text"><span class="Signest">39</span></td>
			</tr>
			<tr height="25px">
              <td align="center" class="Bold">No. <span class="Signest">2</span></td>
              <td align="center" class="High">Ian Fraser</td>
              <td align="center" class="Text"><span class="Beg">0.60</span></td>
              <td align="center" class="Text"><span class="Int">9.45</span></td>
              <td align="center" class="Text"><span class="Exp">32.95</span></td>
              <td align="center" class="Text"><span class="Signest">43</span></td>
  </tr>
			<tr height="25px">
			  <td align="center" class="Bold">No. <span class="Signest">3</span></td>
			  <td align="center" class="High">Fritz</td>
			  <td align="center" class="Text"><span class="Beg">0.76</span></td>
			  <td align="center" class="Text"><span class="Int">9.42</span></td>
			  <td align="center" class="Text"><span class="Exp">34.62</span></td>
			  <td align="center" class="Text"><span class="Signest">45</span></td>
  </tr>
			<tr height="25px">
			  <td align="center" bgcolor="#444444" class="Bold">No. <span class="Signest">4</span></td>
			  <td align="center" bgcolor="#444444" class="Sign">Guo Wei Jia</td>
			  <td align="center" bgcolor="#444444" class="Text"><span class="Beg">0.65</span></td>
			  <td align="center" bgcolor="#444444" class="Text"><span class="Int">9.50</span></td>
			  <td align="center" bgcolor="#444444" class="Text"><span class="Exp">36.03</span></td>
			  <td align="center" bgcolor="#444444" class="Text"><span class="Signest">47</span></td>
  </tr>
			<tr height="25px">
			  <td align="center" class="Bold">No. <span class="Signest">5</span></td>
              <td align="center" class="High">Thomas Kolar</td>
              <td align="center" class="Text"><span class="Beg">0.51</span></td>
			  <td align="center" class="Text"><span class="Int">9.07</span></td>
			  <td align="center" class="Text"><span class="Exp">36.73</span></td>
			  <td align="center" class="Text"><span class="Signest">47</span></td>
  </tr>
			<tr height="25px">
			  <td align="center" class="Bold">No. <span class="Signest">6</span></td>
			  <td align="center" class="High">Manuel Helder</td>
			  <td align="center" class="Text"><span class="Beg">0.90</span></td>
			  <td align="center" class="Text"><span class="Int">9.13</span></td>
			  <td align="center" class="Text"><span class="Exp">36.48</span></td>
			  <td align="center" class="Text"><span class="Signest">47</span></td>
  </tr>
			<tr height="25px">
			  <td align="center" bgcolor="#444444" class="Bold">No. <span class="Signest">7</span></td>
			  <td align="center" bgcolor="#444444" class="Sign">Zhou Dan</td>
			  <td align="center" bgcolor="#444444" class="Text"><span class="Beg">0.54</span></td>
			  <td align="center" bgcolor="#444444" class="Text"><span class="Int">9.30</span></td>
			  <td align="center" bgcolor="#444444" class="Text"><span class="Exp">36.81</span></td>
			  <td align="center" bgcolor="#444444" class="Text"><span class="Signest">47</span></td>
  </tr>
			<tr height="25px">
			  <td align="center" class="Bold">No. <span class="Signest">8</span></td>
			  <td align="center" class="High">Dion Tiu</td>
			  <td align="center" class="Text"><span class="Beg">0.70</span></td>
			  <td align="center" class="Text"><span class="Int">9.67</span></td>
			  <td align="center" class="Text"><span class="Exp">36.77</span></td>
			  <td align="center" class="Text"><span class="Signest">48</span></td>
  </tr>
<tr height="25px">
              <td align="center" bgcolor="#444444" class="Bold">No. <span class="Signest">9</span></td>
    <td align="center" bgcolor="#444444" class="Sign">Zhang Shen Jia</td>
    <td align="center" bgcolor="#444444" class="Text"><span class="Beg">0.98</span></td>
    <td align="center" bgcolor="#444444" class="Text"><span class="Int">10.34</span></td>
    <td align="center" bgcolor="#444444" class="Text"><span class="Exp">37.82</span></td>
    <td align="center" bgcolor="#444444" class="Text"><span class="Signest">50</span></td>
  </tr>
			<tr height="25px">
			  <td align="center" class="Bold">No. <span class="Signest">10</span></td>
			  <td align="center" class="High">Pavel Mishin</td>
			  <td align="center" class="Text"><span class="Beg">0.81</span></td>
			  <td align="center" class="Text"><span class="Int">9.63</span></td>
			  <td align="center" class="Text"><span class="Exp">38.98</span></td>
			  <td align="center" class="Text"><span class="Signest">50</span></td>
  </tr>
			<tr height="25px" align="right">
			  <td height="35" colspan="2" align="left" class="Text"><a href="http://www.minesweeper.info/worldranking.html" target="_blank" class="Sign">点击查看完整世界排行</a></td>
              <td height="35" colspan="4" class="Text"><p>更新时间：<span class="Title">2014.8.17</span></p></td>
  </tr>
</table>
</body>
</html>
