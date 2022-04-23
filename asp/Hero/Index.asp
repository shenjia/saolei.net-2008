<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-30
'------------------------
%>
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<META name="description" content="<%=Meta_Description%>">
<META name="keywords" content="<%=Meta_Keywords%>">
<title>雷神殿<%=HTML_Title%></title>
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
<body onLoad="Top(7);">
<!--#include virtual="/Models/Include/Top.asp"-->
<table width="910" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr>
    <td width="604" height="500" valign="top">
			<table border="0" cellpadding="0" cellspacing="1" bgcolor="#444444">
			  <tr align="center" height="25">
				<td width="100" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';" bgcolor="#333333" id="World_1" style="cursor:pointer " onClick="High('World_1');World_Frame.location='/World/World.asp';">雷神殿</td>
			  </tr>
			</table>
			<script language="javascript">High('World_1');</script>
		<table width="595" border="0" cellpadding="10" cellspacing="1" bgcolor="#666666">
		  <tr bgcolor="#333333">
			<td height="535" valign="top" class="Text"><table width="575" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="50"><table width="100" height="30" border="0" align="left" cellpadding="0" cellspacing="1">
                    <tr>
                      <td align="center" bgcolor="#555555" class="Title">Sub30</td>
                    </tr>
                </table></td>
              </tr>
              <tr class="Text">
                <%
			Call Start_Conn()
			
			SQL_Text = "Hero_Index 0,30"
			rs.Open SQL_Text,Conn,1,3
			
			I = 0
			
			Do While Not rs.Eof
				%>
                <td width="115" height="135" aligh="top"><%
				Call Player(rs("Player_Id"),rs("Player_Name_Chinese"),FormatNumber(rs("Player_Exp_Time_Score"),2),rs("Player_Image"))
				%></td>
                <%
				I = I + 1
				If I = 5 Then
					Response.Write("</tr><tr class=""Text"">")			
					I = 0
				End If
				rs.MoveNext
			Loop
			If I < 5 Then 
				For J = I To 4
					Response.Write("<td width=""115""></td>")			
				Next
			End If
			
			Call End_Conn()
			%>
              </tr>
		  <tr bgcolor="#333333">
			<td height="535" valign="top" class="Text"><table width="575" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="50"><table width="100" height="30" border="0" align="left" cellpadding="0" cellspacing="1">
                    <tr>
                      <td align="center" bgcolor="#555555" class="Title">Sub40</td>
                    </tr>
                </table></td>
              </tr>
              <tr class="Text">
                <%
			Call Start_Conn()
			
			SQL_Text = "Hero_Index 30,40"
			rs.Open SQL_Text,Conn,1,3
			
			I = 0
			
			Do While Not rs.Eof
				%>
                <td width="115" height="135" aligh="top"><%
				Call Player(rs("Player_Id"),rs("Player_Name_Chinese"),FormatNumber(rs("Player_Exp_Time_Score"),2),rs("Player_Image"))
				%></td>
                <%
				I = I + 1
				If I = 5 Then
					Response.Write("</tr><tr class=""Text"">")			
					I = 0
				End If
				rs.MoveNext
			Loop
			If I < 5 Then 
				For J = I To 4
					Response.Write("<td width=""115""></td>")			
				Next
			End If
			
			Call End_Conn()
			%>
              </tr>
            </table>
			<table width="575" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="50"><table width="100" height="30" border="0" align="left" cellpadding="0" cellspacing="1">
                    <tr>
                      <td align="center" bgcolor="#555555" class="Title">Sub50</td>
                    </tr>
                </table></td>
              </tr>
              <tr class="Text">
                <%
			Call Start_Conn()
			
			SQL_Text = "Hero_Index 40,50"
			rs.Open SQL_Text,Conn,1,3
			
			I = 0
			
			Do While Not rs.Eof
				%>
                <td width="115" height="135" aligh="top"><%
				Call Player(rs("Player_Id"),rs("Player_Name_Chinese"),FormatNumber(rs("Player_Exp_Time_Score"),2),rs("Player_Image"))
				%></td>
                <%
				I = I + 1
				If I = 5 Then
					Response.Write("</tr><tr class=""Text"">")			
					I = 0
				End If
				rs.MoveNext
			Loop
			If I < 5 Then 
				For J = I To 4
					Response.Write("<td width=""115""></td>")			
				Next
			End If
			
			Call End_Conn()
			%>
              </tr>
            </table>
			<table width="575" border="0" cellspacing="0" cellpadding="0">
			<tr>
			<td height="50">
				<table width="100" height="30" border="0" align="left" cellpadding="0" cellspacing="1">
					<tr>
						<td align="center" bgcolor="#555555" class="Title">Sub60</td>
					</tr>
			</table>
			</td>
			</tr>
            <tr class="Text">
			<%
			Call Start_Conn()
			
			SQL_Text = "Hero_Index 50,60"
			rs.Open SQL_Text,Conn,1,3
			
			I = 0
			
			Do While Not rs.Eof
				%><td width="115" height="135" aligh="top"><%
				Call Player(rs("Player_Id"),rs("Player_Name_Chinese"),FormatNumber(rs("Player_Exp_Time_Score"),2),rs("Player_Image"))
				%></td><%
				I = I + 1
				If I = 5 Then
					Response.Write("</tr><tr class=""Text"">")			
					I = 0
				End If
				rs.MoveNext
			Loop
			If I < 5 Then 
				For J = I To 4
					Response.Write("<td width=""115""></td>")			
				Next
			End If
			
			Call End_Conn()
			%>
            </tr>
          </table>
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
<!--#include virtual="/Models/Include/Bottom.asp"-->
</body>
<iframe name="Action" width="0" height="0" style="display: none"></iframe>
</html>
<%
Sub Player(Player_Id,Player_Name,Player_Exp,Player_Image)

	If Player_Image Then
		Image_Path = "/Models/Images/Player/"&Player_Id&".jpg"
	Else
		Image_Path = "/Models/Images/Player/No.jpg"
	End If
	%><div id="Player_<%=Player_Id%>" style="cursor:pointer;" title="点击查看<%=Player_Name%>的更多信息" onClick="top.Window('/Player/Show.asp?Id=<%=Player_Id%>');">
	<img src="<%=Image_Path%>" border="1" align="absmiddle" style="border-color:#999999; cursor:pointer" onClick="top.Window('/Player/Show.asp?Id=<%=Player_Id%>');" title="点击查看<%=Player_Name%>的更多信息"><br>
   <span class="Texts">[</span><span onClick="top.Window('/Help/Title.asp');" class="<%=rs("Player_Title")%>" title="点击查看称号说明"><%=rs("Player_Title")%></span><span class="Texts">]</span> <a href="javascript:;" onClick="top.Window('/Player/Show.asp?Id=<%=rs("Player_Id")%>');" title="点击查看个人信息" class="High"><%=rs("Player_Name_Chinese")%></a>(<span class="Counters"><%=Player_Exp%></span>)</div><%
	  
End Sub
%>