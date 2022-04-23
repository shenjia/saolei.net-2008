<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-15
'------------------------
%>
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
<%
Call Start_Conn()

Player_Id = Request("Id")

Set cmd = Server.CreateObject("ADODB.Command")
Set cmd.ActiveConnection = Conn
cmd.CommandText = "dbo.Player_Info"
cmd.CommandType = &H0004

cmd.Parameters.Append cmd.CreateParameter("@Player_Id",3)
cmd.Parameters.Append cmd.CreateParameter("@Player_IP",200,,15)
cmd.Parameters.Append cmd.CreateParameter("@Player_Name_Chinese",200,2,12)
cmd.Parameters.Append cmd.CreateParameter("@Player_Name_English",200,2,20)
cmd.Parameters.Append cmd.CreateParameter("@Player_Sum_Time_Score",5,2)
cmd.Parameters.Append cmd.CreateParameter("@Player_Sum_3BVS_Score",5,2)
cmd.Parameters.Append cmd.CreateParameter("@Player_Beg_Time_Score",5,2)
cmd.Parameters.Append cmd.CreateParameter("@Player_Beg_Time_Video",3,2)
cmd.Parameters.Append cmd.CreateParameter("@Player_Beg_3BVS_Score",5,2)
cmd.Parameters.Append cmd.CreateParameter("@Player_Beg_3BVS_Video",3,2)
cmd.Parameters.Append cmd.CreateParameter("@Player_Int_Time_Score",5,2)
cmd.Parameters.Append cmd.CreateParameter("@Player_Int_Time_Video",3,2)
cmd.Parameters.Append cmd.CreateParameter("@Player_Int_3BVS_Score",5,2)
cmd.Parameters.Append cmd.CreateParameter("@Player_Int_3BVS_Video",3,2)
cmd.Parameters.Append cmd.CreateParameter("@Player_Exp_Time_Score",5,2)
cmd.Parameters.Append cmd.CreateParameter("@Player_Exp_Time_Video",3,2)
cmd.Parameters.Append cmd.CreateParameter("@Player_Exp_3BVS_Score",5,2)
cmd.Parameters.Append cmd.CreateParameter("@Player_Exp_3BVS_Video",3,2)
cmd.Parameters.Append cmd.CreateParameter("@Player_Title",200,2,4)
cmd.Parameters.Append cmd.CreateParameter("@Player_Sex",3,2)
cmd.Parameters.Append cmd.CreateParameter("@Player_Rank",3,2)
cmd.Parameters.Append cmd.CreateParameter("@Player_Old_Rank",3,2)
cmd.Parameters.Append cmd.CreateParameter("@Player_Real_Rank",3,2)
cmd.Parameters.Append cmd.CreateParameter("@Player_Click",3,2)
cmd.Parameters.Append cmd.CreateParameter("@Player_Click_Today",3,2)
cmd.Parameters.Append cmd.CreateParameter("@Player_Login_Time",135,2)
cmd.Parameters.Append cmd.CreateParameter("@Player_IsHero",3,2)
cmd.Parameters.Append cmd.CreateParameter("@Player_IsLive",3,2)
cmd.Parameters.Append cmd.CreateParameter("@Player_Image",3,2)

cmd("@Player_Id") = Player_Id
cmd("@Player_IP") = Request.ServerVariables("REMOTE_ADDR")

cmd.execute

Player_Name_Chinese = cmd("@Player_Name_Chinese")
Player_Name_English = cmd("@Player_Name_English")
Player_Sum_Time_Score = cmd("@Player_Sum_Time_Score")
Player_Sum_3BVS_Score = cmd("@Player_Sum_3BVS_Score")
Player_Beg_Time_Score = cmd("@Player_Beg_Time_Score")
Player_Beg_Time_Video = cmd("@Player_Beg_Time_Video")
Player_Beg_3BVS_Score = cmd("@Player_Beg_3BVS_Score")
Player_Beg_3BVS_Video = cmd("@Player_Beg_3BVS_Video")
Player_Int_Time_Score = cmd("@Player_Int_Time_Score")
Player_Int_Time_Video = cmd("@Player_Int_Time_Video")
Player_Int_3BVS_Score = cmd("@Player_Int_3BVS_Score")
Player_Int_3BVS_Video = cmd("@Player_Int_3BVS_Video")
Player_Exp_Time_Score = cmd("@Player_Exp_Time_Score")
Player_Exp_Time_Video = cmd("@Player_Exp_Time_Video")
Player_Exp_3BVS_Score = cmd("@Player_Exp_3BVS_Score")
Player_Exp_3BVS_Video = cmd("@Player_Exp_3BVS_Video")
Player_Title = cmd("@Player_Title")
Player_Sex = cmd("@Player_Sex")
Player_Rank = cmd("@Player_Rank")
Player_Old_Rank = cmd("@Player_Old_Rank")
Player_Real_Rank = cmd("@Player_Real_Rank")
Player_Click = cmd("@Player_Click")
Player_Click_Today = cmd("@Player_Click_Today")
Player_Login_Time = cmd("@Player_Login_Time")
Player_IsHero = cmd("@Player_IsHero")
Player_IsLive = cmd("@Player_IsLive")
Player_Image = cmd("@Player_Image")

If Player_Sex Then
	Player_Sex_Text = "GG"
Else
	Player_Sex_Text = "mm"
End If

If Player_IsHero Then
	Player_Rank_Text = "神界"
Else
	Player_Rank_Text = "人界"
End If

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
<link href="/Models/Css/2008.css?v=20220423" rel="stylesheet" type="text/css">
<!--#include virtual="/Models/Include/Windows.asp"-->
</head>
<body onload="Window_Load();" onMousemove="move()" topmargin=0 leftmargin=0 scroll=no>
<table id="Window_Table" border="0" cellspacing="1" cellpadding="0" bgcolor="#999999">
	<tr>
		<td bgcolor="#444444">
		<table width="290" border="0" cellspacing="0" cellpadding="0">
			<tr bgcolor="#555555">
				<td height="25" class="Highest" onmousedown="down=true;divtop=event.clientY;divleft=event.clientX;" onmouseup="down=false" onmouseout="down=false">　查看信息</td>
				<td width="20" height="25" align="center" class="Bold" onMouseOver="this.className='Signest';" onMouseOut="this.className='Bold';" style="cursor:pointer; " onClick="Cancel();">×</td>
			</tr>
		</table>
		<table width="290" border="0" cellspacing="5" cellpadding="0">
		  <tr>
			<td width="120" align="left" valign="top">
			<table width="120" border="0" cellspacing="5" cellpadding="0">
			  <tr>
				<td width="120" height="105" align="left" valign="top" class="Text">
			<%
			If Player_Image Then
				%><img src="/Models/Images/Player/<%=Player_Id%>.jpg" border="1" align="absmiddle" style="border-color:#999999;"><%
			Else
				%><img src="/Models/Images/Player/No.jpg" border="1" align="absmiddle" style="border-color:#999999; cursor:pointer" onclick="top.Window('/Help/Image.asp');" title="如何上传照片？"><%
			End If
			%>
			</td></tr>
			  <tr>
			    <td align="left" valign="top" class="Text">
				<table width="100" height="20" border="0" align="left" cellpadding="0" cellspacing="0" style="cursor:pointer; " onClick="window.open('/Player/Index.asp?Id=<%=Player_Id%>');Cancel();">
				<tr>
				<td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">访问我的地盘</td>
				</tr>
				</table>
			</td>
		      </tr>
			  <tr>
			    <td align="left" valign="top" class="Text">
				<table width="100" height="20" border="0" align="left" cellpadding="0" cellspacing="0" style="cursor:pointer; " onClick="location='/Message/Send.asp?Id=<%=Player_Id%>';">
				<tr>
				<td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">给我发短消息</td>
				</tr>
				</table>
				</td>
		      </tr>
			</table>
			</td>
			<td width="160" valign="top" class="Text"><span class="Sign"><%=Player_Name_Chinese%></span>&nbsp;(Id:&nbsp;<%=Player_Id%>)　<span class="<%=Player_Title%>" style="cursor:pointer" onClick="top.Window('/Help/Title.asp');"><%=Player_Title%></span><span class="Counter"><%=Player_Sex_Text%></span><br>
		<%If Player_IsLive Then%>
			<%If Player_Rank <> 0 Then%>
			<span class="Highest"><%=Player_Rank_Text%>第</span>&nbsp;<span class="Signest"><%=Player_Rank%></span>&nbsp;<span class="Highest">位</span>
				<%
				If Player_Old_Rank = 0 Or Player_Old_Rank = 9999  Then 
					%><span style="cursor:default" title="本月新上榜用户" class="Signest">↑新</span><%
				Else
					If Player_Real_Rank = Player_Old_Rank Then
						%><span style="cursor:default" title="与上月持平" class="Highest">→</span><%
						Img = "Yes"
					Else
						If Player_Real_Rank < Player_Old_Rank Then
							%><span style="cursor:default" title="比上月进步<%=Player_Old_Rank-Player_Real_Rank%>位" class="Signest">↑<%=Player_Old_Rank-Player_Real_Rank%></span><%
							Img = "Yes"
						Else
							%><span style="cursor:default" title="比上月下降<%=Player_Real_Rank-Player_Old_Rank%>位" class="Bold">↓<%=Player_Real_Rank-Player_Old_Rank%></span><%
							Img = "No"
						End If
					End If
				End If
				%><br>
			<%End If%>
		<%Else%>
			<span class="Sign">该用户已被封停!</span><br>
		<%End If%>
		初级纪录：<%If Player_Beg_Time_Score<>"999.99" Then%><a href="/Video/Show.asp?Id=<%=Player_Beg_Time_Video%>" class="Highest" title="点击查看录像"><%=FormatNumber(Player_Beg_Time_Score,2)%></a><%Else%>&nbsp;-<%End If%>
					|
					<%If Player_Beg_3BVS_Score<>"0" Then%><a href="/Video/Show.asp?Id=<%=Player_Beg_3BVS_Video%>" class="Title" title="点击查看录像"><%=FormatNumber(Player_Beg_3BVS_Score,2,True)%></a><%Else%>&nbsp;-<%End If%><br>
		中级纪录：<%If Player_Int_Time_Score<>"999.99" Then%><a href="/Video/Show.asp?Id=<%=Player_Int_Time_Video%>" class="Highest" title="点击查看录像"><%=FormatNumber(Player_Int_Time_Score,2)%></a><%Else%>&nbsp;-<%End If%>
					|
					<%If Player_Int_3BVS_Score<>"0" Then%><a href="/Video/Show.asp?Id=<%=Player_Int_3BVS_Video%>" class="Title" title="点击查看录像"><%=FormatNumber(Player_Int_3BVS_Score,2,True)%></a>
					<%Else%>&nbsp;-<%End If%><br>
		高级纪录：<%If Player_Exp_Time_Score<>"999.99" Then%><a href="/Video/Show.asp?Id=<%=Player_Exp_Time_Video%>" class="Highest" title="点击查看录像"><%=FormatNumber(Player_Exp_Time_Score,2)%></a>
		<%Else%>&nbsp;-<%End If%>
					|
					<%If Player_Exp_3BVS_Score<>"0" Then%><a href="/Video/Show.asp?Id=<%=Player_Exp_3BVS_Video%>" class="Title" title="点击查看录像"><%=FormatNumber(Player_Exp_3BVS_Score,2,True)%></a><%Else%>&nbsp;-<%End If%><br>
		总计纪录：<%If Player_Sum_Time_Score<>"999.99" Then%><span class="Signest"><%=FormatNumber(Player_Sum_Time_Score,2)%></span><%Else%>&nbsp;-<%End If%>
					|
					<%If Player_Sum_3BVS_Score<>"0" Then%><span class="Signest"><%=FormatNumber(Player_Sum_3BVS_Score,2,True)%></span><%Else%>&nbsp;-<%End If%><br></span>
		最近登录：<%=FormatDateTime(Player_Login_Time,1)%>
			</td>
		  </tr>
		</table>
		</td>
	</tr>
</table>
</body>
</html>
<script language="javascript">
function KeyDown()
{ 
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

