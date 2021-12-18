<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-21
'------------------------
%>
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
<!--#include virtual="/Models/Include/Bar.asp"-->
<%
Call Start_Conn()

Set cmd = Server.CreateObject("ADODB.Command")
Set cmd.ActiveConnection = Conn
cmd.CommandText = "dbo.World"
cmd.CommandType = &H0004

cmd.Parameters.Append cmd.CreateParameter("@All_Number",3,2)
cmd.Parameters.Append cmd.CreateParameter("@Hero_Number",3,2)
cmd.Parameters.Append cmd.CreateParameter("@Hero_1_Number",3,2)
cmd.Parameters.Append cmd.CreateParameter("@Hero_2_Number",3,2)
cmd.Parameters.Append cmd.CreateParameter("@Hero_3_Number",3,2)
cmd.Parameters.Append cmd.CreateParameter("@Hero_4_Number",3,2)
cmd.Parameters.Append cmd.CreateParameter("@Man_Number",3,2)
cmd.Parameters.Append cmd.CreateParameter("@Man_1_Number",3,2)
cmd.Parameters.Append cmd.CreateParameter("@Man_2_Number",3,2)
cmd.Parameters.Append cmd.CreateParameter("@Man_3_Number",3,2)
cmd.Parameters.Append cmd.CreateParameter("@Man_4_Number",3,2)
cmd.Parameters.Append cmd.CreateParameter("@Man_5_Number",3,2)
cmd.Parameters.Append cmd.CreateParameter("@Man_6_Number",3,2)
cmd.Parameters.Append cmd.CreateParameter("@Man_7_Number",3,2)
cmd.Parameters.Append cmd.CreateParameter("@Man_8_Number",3,2)
cmd.Parameters.Append cmd.CreateParameter("@Man_9_Number",3,2)

cmd.execute

All_Number = cmd("@All_Number")
Hero_Number = cmd("@Hero_Number")
Hero_1_Number = cmd("@Hero_1_Number")
Hero_2_Number = cmd("@Hero_2_Number")
Hero_3_Number = cmd("@Hero_3_Number")
Hero_4_Number = cmd("@Hero_4_Number")
Man_Number = cmd("@Man_Number")
Man_1_Number = cmd("@Man_1_Number")
Man_2_Number = cmd("@Man_2_Number")
Man_3_Number = cmd("@Man_3_Number")
Man_4_Number = cmd("@Man_4_Number")
Man_5_Number = cmd("@Man_5_Number")
Man_6_Number = cmd("@Man_6_Number")
Man_7_Number = cmd("@Man_7_Number")
Man_8_Number = cmd("@Man_8_Number")
Man_9_Number = cmd("@Man_9_Number")

Set cmd = Nothing

Call End_Conn()
%>
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
<body onLoad="parent.document.getElementById('World').style.display='block';">
<table width="575" border="0" cellspacing="0" cellpadding="10">
	<tr>
	  <td colspan="6" align="left" class="Text"><span class="Title">【神界】</span>　共有 <span class="Signest"><%=Hero_Number%></span> 人 </td>
	</tr>
	<tr>
	  <td colspan="6" align="left" class="Text"><table border="0" cellspacing="1" cellpadding="0">
        <tr class="High" bgcolor="444444">
          <td width="79" height="25" align="center">称号</td>
          <td width="67" align="center">人数</td>
          <td width="200" align="center">说明</td>
          <td width="200" align="center">所占比例</td>
        </tr>
        <tr class="High">
          <td height="4" colspan="4"></td>
        </tr>
      </table>
	    <table border="0" cellspacing="1" cellpadding="0">
          <tr class="Text" onMouseOver="Box_Hero_1.style.background='#999999';Bar_Hero_1.style.background='#999999';" onMouseOut="Box_Hero_1.style.background='#777777';Bar_Hero_1.style.background='#777777';">
            <td width="79" height="25" align="center"><span class="Texts">[</span><span class="雷帝">雷帝</span><span class="Texts">]</span></td>
            <td width="67" align="center"><span class="Signest"><%=Hero_1_Number%></span>&nbsp;人</td>
            <td width="200"><span class="Texts">　雷界排行第一人</span></td>
            <td width="10"></td>
            <td width="190"><%Call Bar("Hero_1",Hero_1_Number,Hero_Number,180,10)%></td>
          </tr>
          <tr class="Text" onMouseOver="Box_Hero_2.style.background='#999999';Bar_Hero_2.style.background='#999999';" onMouseOut="Box_Hero_2.style.background='#777777';Bar_Hero_2.style.background='#777777';">
            <td height="25" align="center"><span class="Texts">[</span><span class="雷圣">雷圣</span><span class="Texts">]</span></td>
            <td align="center"><span class="Signest"><%=Hero_2_Number%></span>&nbsp;人</td>
            <td><span class="Texts">　高级纪录为 </span><span class="Title">50秒 </span><span class="Texts">以下</span></td>
            <td width="10"></td>
            <td width="190"><%Call Bar("Hero_2",Hero_2_Number,Hero_Number,180,10)%></td>
          </tr>
          <tr class="Text" onMouseOver="Box_Hero_3.style.background='#999999';Bar_Hero_3.style.background='#999999';" onMouseOut="Box_Hero_3.style.background='#777777';Bar_Hero_3.style.background='#777777';">
            <td height="25" align="center"><span class="Texts">[</span><span class="雷神">雷神</span><span class="Texts">]</span></td>
            <td align="center"><span class="Signest"><%=Hero_3_Number%></span>&nbsp;人</td>
            <td><span class="Texts">　高级纪录为 </span><span class="Title">50 </span><span class="Texts">～</span><span class="Title"> 60秒</span><span class="Texts"> 的</span><span class="Counter"> GG</span><span class="Texts"></span></td>
            <td width="10"></td>
            <td width="190"><%Call Bar("Hero_3",Hero_3_Number,Hero_Number,180,10)%></td>
          </tr>
          <tr class="Text" onMouseOver="Box_Hero_4.style.background='#999999';Bar_Hero_4.style.background='#999999';" onMouseOut="Box_Hero_4.style.background='#777777';Bar_Hero_4.style.background='#777777';">
            <td height="25" align="center"><span class="Texts">[</span><span class="雷仙">雷仙</span><span class="Texts">]</span></td>
            <td align="center"><span class="Signest"><%=Hero_4_Number%></span>&nbsp;人</td>
            <td><span class="Texts">　高级纪录为 <span class="Title">50 </span>～<span class="Title"> 60秒</span> 的</span><span class="Counter"> mm</span><span class="Texts"></span></td>
            <td width="10"></td>
            <td width="190"><%Call Bar("Hero_4",Hero_4_Number,Hero_Number,180,10)%></td>
          </tr>
        </table></td>
  </tr>
	<tr>
	  <td colspan="6" align="left" class="Text"><span class="Title">【人界】</span>　共有 <span class="Title"><%=All_Number%></span> 人，其中 <span class="Title"><%=Man_Number%></span> 人加入排行</td>
  </tr>
	<tr>
	  <td colspan="6" align="left" class="Text"><table border="0" cellspacing="1" cellpadding="0">
        <tr class="High" bgcolor="444444">
          <td width="79" height="25" align="center">称号</td>
          <td width="67" align="center">人数</td>
          <td width="200" align="center">说明</td>
          <td width="200" align="center">所占比例</td>
        </tr>
        <tr class="High">
          <td height="4" colspan="4"></td>
        </tr>
      </table>
	    <table border="0" cellspacing="1" cellpadding="0">
        <tr class="Text" onMouseOver="Box_Man_1.style.background='#999999';Bar_Man_1.style.background='#999999';" onMouseOut="Box_Man_1.style.background='#777777';Bar_Man_1.style.background='#777777';">
            <td width="79" height="25" align="center"><span class="Texts">[</span><span class="状元">状元</span><span class="Texts">]</span></td>
          <td width="67" align="center"><span class="Title"><%=Man_1_Number%></span>&nbsp;人</td>
            <td width="200"><span class="Texts">　高级纪录为 <span class="Title">60</span> ～ <span class="Title">61秒</span></span></td>
            <td width="10"></td>
            <td width="190"><%Call Bar("Man_1",Man_1_Number,Man_Number,180,10)%></td>
        </tr>
        <tr class="Text" onMouseOver="Box_Man_2.style.background='#999999';Bar_Man_2.style.background='#999999';" onMouseOut="Box_Man_2.style.background='#777777';Bar_Man_2.style.background='#777777';">
          <td height="25" align="center"><span class="Texts">[</span><span class="榜眼">榜眼</span><span class="Texts">]</span></td>
          <td align="center"><span class="Title"><%=Man_2_Number%></span>&nbsp;人</td>
          <td><span class="Texts">　高级纪录为 <span class="Title">61</span> ～ <span class="Title">63秒</span></span></td>
            <td width="10"></td>
            <td width="190"><%Call Bar("Man_2",Man_2_Number,Man_Number,180,10)%></td>
        </tr>
        <tr class="Text" onMouseOver="Box_Man_3.style.background='#999999';Bar_Man_3.style.background='#999999';" onMouseOut="Box_Man_3.style.background='#777777';Bar_Man_3.style.background='#777777';">
          <td height="25" align="center"><span class="Texts">[</span><span class="探花">探花</span><span class="Texts">]</span></td>
          <td align="center"><span class="Title"><%=Man_3_Number%></span>&nbsp;人</td>
          <td><span class="Texts">　高级纪录为 <span class="Title">63</span> ～ <span class="Title"></span><span class="Title">66秒</span></span></td>
            <td width="10"></td>
            <td width="190"><%Call Bar("Man_3",Man_3_Number,Man_Number,180,10)%></td>
        </tr>
        <tr class="Text" onMouseOver="Box_Man_4.style.background='#999999';Bar_Man_4.style.background='#999999';" onMouseOut="Box_Man_4.style.background='#777777';Bar_Man_4.style.background='#777777';">
          <td height="25" align="center"><span class="Texts">[</span><span class="进士">进士</span><span class="Texts">]</span></td>
          <td align="center"><span class="Title"><%=Man_4_Number%></span>&nbsp;人</td>
          <td><span class="Texts">　高级纪录为 <span class="Title">66</span> ～ <span class="Title"></span><span class="Title">70秒</span></span></td>
            <td width="10"></td>
            <td width="190"><%Call Bar("Man_4",Man_4_Number,Man_Number,180,10)%></td>
        </tr>
        <tr class="Text" onMouseOver="Box_Man_5.style.background='#999999';Bar_Man_5.style.background='#999999';" onMouseOut="Box_Man_5.style.background='#777777';Bar_Man_5.style.background='#777777';">
          <td height="25" align="center"><span class="Texts">[</span><span class="举人">举人</span><span class="Texts">]</span></td>
          <td align="center"><span class="Title"><%=Man_5_Number%></span>&nbsp;人</td>
          <td><span class="Texts">　高级纪录为 <span class="Title">70</span> ～ <span class="Title"></span><span class="Title">80秒</span></span></td>
            <td width="10"></td>
            <td width="190"><%Call Bar("Man_5",Man_5_Number,Man_Number,180,10)%></td>
        </tr>
        <tr class="Text" onMouseOver="Box_Man_6.style.background='#999999';Bar_Man_6.style.background='#999999';" onMouseOut="Box_Man_6.style.background='#777777';Bar_Man_6.style.background='#777777';">
          <td height="25" align="center"><span class="Texts">[</span><span class="秀才">秀才</span><span class="Texts">]</span></td>
          <td align="center"><span class="Title"><%=Man_6_Number%></span>&nbsp;人</td>
          <td><span class="Texts">　高级纪录为 <span class="Title">80</span> ～ <span class="Title"></span><span class="Title">90秒</span></span></td>
            <td width="10"></td>
            <td width="190"><%Call Bar("Man_6",Man_6_Number,Man_Number,180,10)%></td>
        </tr>
        <tr class="Text" onMouseOver="Box_Man_7.style.background='#999999';Bar_Man_7.style.background='#999999';" onMouseOut="Box_Man_7.style.background='#777777';Bar_Man_7.style.background='#777777';">
          <td height="25" align="center"><span class="Texts">[</span><span class="书生">书生</span><span class="Texts">]</span></td>
          <td align="center"><span class="Title"><%=Man_7_Number%></span>&nbsp;人</td>
          <td><span class="Texts">　高级纪录为 <span class="Title">90</span> ～ <span class="Title"></span><span class="Title">100秒</span></span></td>
            <td width="10"></td>
            <td width="190"><%Call Bar("Man_7",Man_7_Number,Man_Number,180,10)%></td>
        </tr>
        <tr class="Text" onMouseOver="Box_Man_8.style.background='#999999';Bar_Man_8.style.background='#999999';" onMouseOut="Box_Man_8.style.background='#777777';Bar_Man_8.style.background='#777777';">
          <td height="25" align="center"><span class="Texts">[</span><span class="童生">童生</span><span class="Texts">]</span></td>
          <td align="center"><span class="Title"><%=Man_8_Number%></span>&nbsp;人</td>
          <td><span class="Texts">　高级纪录为 <span class="Title">100秒</span> 以上</span></td>
            <td width="10"></td>
            <td width="190"><%Call Bar("Man_8",Man_8_Number,Man_Number,180,10)%></td>
        </tr>
        <tr class="Text">
          <td height="25" align="center"><span class="Texts">[</span><span class="布衣">布衣</span><span class="Texts">]</span></td>
          <td align="center"><span class="Title"><%=Man_9_Number%></span>&nbsp;人</td>
          <td><span class="Texts">　未加入排行</span></td>
            <td width="10"></td>
            <td width="190">&nbsp;</td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>
