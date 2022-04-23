<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-13
'------------------------
ZhaoPin=0
%>
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
<!--#include virtual="/Models/Include/Bar.asp"-->
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
	background-color: #444444;
}
-->
</style>
<link href="/Models/Css/2008.css?v=20220423" rel="stylesheet" type="text/css">
<!--#include virtual="/Models/Include/Windows.asp"-->
</head>
<body onload="Window_Load();" onMousemove="move()" topmargin=0 leftmargin=0 scroll=no>
<table id="Window_Table" border="0" cellspacing="1" cellpadding="0" bgcolor="#999999">
	<tr>
		<td bgcolor="#444444">
			<table width="510" border="0" cellspacing="0" cellpadding="0">
				<tr bgcolor="#555555">
					<td height="25" class="Highest" onmousedown="down=true;divtop=event.clientY;divleft=event.clientX;" onmouseup="down=false" onmouseout="down=false">　管理团队</td>
					<td width="20" height="25" align="center" class="Bold" onMouseOver="this.className='Signest';" onMouseOut="this.className='Bold';" style="cursor:pointer; " onClick="Cancel();">×</td>
			</tr>
		  </table>
			<table width="510" border="0" cellspacing="10" cellpadding="0">
				<tr>
				  <td colspan="2" class="Text">				    <table border="0" cellspacing="2" cellpadding="0">
                      <tr class="Title">
                        <td width="100" height="25" align="center">管理员</td>
                        <td width="110" align="center">最近登录</td>
                        <td width="220" align="center">本月审核录像数量</td>
                        <td width="50" align="center">总审核</td>
                      </tr>
                    </table>
					<table border="0" cellspacing="2" cellpadding="0">
					<%
					Call Start_Conn()
					
					SQL_Text = "Team_List"
					rs.Open SQL_Text,Conn,1,3
					
					Best_Number = CLng(rs("Player_Check_Number_Now"))
					If Best_Number = 0 Then Best_Number = 1
					Do While Not rs.Eof
						%>
						  <tr bgcolor="#333333">
							<td width="100" height="25" align="center" class="High"><span class="Texts">[</span><span onClick="location='/Help/Title.asp';" class="<%=rs("Player_Title")%>" title="点击查看称号说明"><%=rs("Player_Title")%></span><span class="Texts">]</span> <a href="/Player/Show.asp?Id=<%=rs("Player_Id")%>" title="点击查看个人信息"class="High"><%=rs("Player_Name_Chinese")%></a></td>
							<td width="110" align="center" class="Text"><%=FormatDateTime(rs("Player_Login_Time"),1)%></td>
							<td width="210" align="center">
								<table width="210" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="2">
										<td width="170"><%Call Bar("Number_",rs("Player_Check_Number_Now"),Best_Number,170,10)%></td>
										<td align="center" class="Sign"><%=rs("Player_Check_Number_Now")%></td>
									</tr>
								</table>
							</td>
							<td width="50" align="center" class="Text"><%=rs("Player_Check_Number")%></td>
						  </tr>
						<%
						rs.MoveNext
					Loop		
					Call End_Conn()
					%>
                    </table>
					</td>
				</tr>
				<tr>
				  <td width="470" class="Text"><table width="180" height="30" border="0" align="center" cellpadding="0" cellspacing="1" style="cursor:pointer; " onClick="Cancel();">
                    <tr>
                      <td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">各位辛苦了，在下告退</td>
                    </tr>
                  </table></td>
				</tr>
		  </table>
		</td>
	</tr>
</table>
</body>
</html>
<iframe name="Action" style="display: none"></iframe>
<script language="javascript">
function KeyDown(e){     
	var keyCode;
	try{ 
		   keyCode=event.keyCode;
	 } 
	 catch(a){
		   keyCode=KeyDown.arguments[0].keyCode; 
	 } 
	switch(keyCode)
	{
		case 27:
		Cancel();      
			break;
	}
}		
document.onkeydown=KeyDown; 
document.onkeypress=KeyDown;

function Cancel()
{
		parent.End_Mask();
		parent.document.getElementById('Window_Box').style.display='none';
}
</script>
