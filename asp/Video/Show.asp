<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-15
'------------------------
%>
<!--#include virtual="/Models/Common/Error.asp"-->
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
<!--#include virtual="/Models/Include/Button.asp"-->
<%
Beg_Text = "初级"
Int_Text = "中级"
Exp_Text = "高级"
		
Call Start_Conn()

Video_Id = Request("Id")

If Session("Player_Id") <> "" Then
	Player_Id = Session("Player_Id")
Else
	Player_Id = 0
End If

Set cmd = Server.CreateObject("ADODB.Command")
Set cmd.ActiveConnection = Conn
cmd.CommandText = "dbo.Video_Show"
cmd.CommandType = &H0004

cmd.Parameters.Append cmd.CreateParameter("@Video_Id",3)
cmd.Parameters.Append cmd.CreateParameter("@Player_Id",3)
cmd.Parameters.Append cmd.CreateParameter("@Video_IP",200,,15)
cmd.Parameters.Append cmd.CreateParameter("@Video_Player",3,2)
cmd.Parameters.Append cmd.CreateParameter("@Video_Player_Name",200,2,12)
cmd.Parameters.Append cmd.CreateParameter("@Video_Player_Title",200,2,4)
cmd.Parameters.Append cmd.CreateParameter("@Video_Player_Sex",3,2)
cmd.Parameters.Append cmd.CreateParameter("@Video_Model",200,2,3)
cmd.Parameters.Append cmd.CreateParameter("@Video_Click",3,2)
cmd.Parameters.Append cmd.CreateParameter("@Video_Comment",3,2)
cmd.Parameters.Append cmd.CreateParameter("@Video_Comment_Text",200,2,50)
cmd.Parameters.Append cmd.CreateParameter("@Video_Path",200,2,100)
cmd.Parameters.Append cmd.CreateParameter("@Video_IsNoFrag",3,2)
cmd.Parameters.Append cmd.CreateParameter("@Video_Score",5,2)
cmd.Parameters.Append cmd.CreateParameter("@Video_3BV",3,2)
cmd.Parameters.Append cmd.CreateParameter("@Video_3BVS",5,2)
cmd.Parameters.Append cmd.CreateParameter("@Video_Time",135,2)
cmd.Parameters.Append cmd.CreateParameter("@Video_Freeze",3,2)
cmd.Parameters.Append cmd.CreateParameter("@Video_Check",3,2)
cmd.Parameters.Append cmd.CreateParameter("@Video_Check_Time",135,2)
cmd.Parameters.Append cmd.CreateParameter("@Video_CheckBy",3,2)
cmd.Parameters.Append cmd.CreateParameter("@Video_CheckBy_Name",200,2,12)
cmd.Parameters.Append cmd.CreateParameter("@Video_CheckBy_Title",200,2,4)
cmd.Parameters.Append cmd.CreateParameter("@Result",200,2,20)

cmd("@Video_Id") = Video_Id
cmd("@Player_Id") = Player_Id
cmd("@Video_IP") = Request.ServerVariables("REMOTE_ADDR")
cmd.execute

Result = cmd("@Result")

Select Case Result

	Case "Show_OK"
	
		Video_Player = cmd("@Video_Player")
		Video_Player_Name = cmd("@Video_Player_Name")
		Video_Player_Title = cmd("@Video_Player_Title")
		Video_Player_Sex = cmd("@Video_Player_Sex")
		Video_Model = cmd("@Video_Model")
		Video_Click = cmd("@Video_Click")
		Video_Comment = cmd("@Video_Comment")
		Video_Comment_Text = cmd("@Video_Comment_Text")
		Video_Path = cmd("@Video_Path")
		Video_Path = Replace(Video_Path,vbcr,"")
		Video_Path = Replace(Video_Path,vblf,"")
		Video_IsNoFrag = cmd("@Video_IsNoFrag")
		Video_Score = cmd("@Video_Score")
		Video_3BV = cmd("@Video_3BV")
		Video_3BVS = cmd("@Video_3BVS")
		Video_Time = cmd("@Video_Time")
		Video_Freeze = cmd("@Video_Freeze")
		Video_Check = cmd("@Video_Check")
		Video_Check_Time = cmd("@Video_Check_Time")
		Video_CheckBy = cmd("@Video_CheckBy")
		Video_CheckBy_Name = cmd("@Video_CheckBy_Name")
		Video_CheckBy_Title = cmd("@Video_CheckBy_Title")		
		
		If Video_Player_Sex Then
			Player_Sex_Text = "GG"
		Else
			Player_Sex_Text = "mm"
		End If
		
		Call End_Conn()	
		
		Session("Video_Path") = Video_Path
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
		<link href="/Models/Css/2008.css" rel="stylesheet" type="text/css">
		<!--#include virtual="/Models/Include/Windows.asp"-->
		</head>
		<body onLoad="Window_Load();<%If Session("Player_Id") <> "" Then%>Comment_Form.Comment_Text.select();<%End If%>" onMousemove="move()" topmargin=0 leftmargin=0 scroll=no>
		<table id="Window_Table" border="0" cellspacing="1" cellpadding="0" bgcolor="#999999">
			<tr>
			  <td bgcolor="#444444">
				<table width="400" border="0" cellspacing="0" cellpadding="0">
					<tr bgcolor="#555555">
						<td height="25" class="Highest" onMouseDown="down=true;divtop=event.clientY;divleft=event.clientX;" onMouseUp="down=false" onMouseOut="down=false">　查看录像</td>
						<td width="20" height="25" align="center" class="Bold" onMouseOver="this.className='Signest';" onMouseOut="this.className='Bold';" style="cursor:pointer; " onClick="Cancel();">×</td>
					</tr>
				</table>
				<table width="400" border="0" cellspacing="10" cellpadding="0">
					<tr>
						<td width="270" valign="top" class="Text">
						<span class="<%=Video_Model%>">
						<%Execute "Response.Write("&Video_Model&"_Text)"%></span>&nbsp;<span class="Signest"><%=FormatNumber(Video_Score,2)%></span><%If Video_IsNoFrag Then%><span class="Counter">NF</span><%End If%>&nbsp;秒录像，3BV=<span class="Title"><%=CInt(Video_3BV)%></span>，3BV/s=<span class="Title"><%=FormatNumber(Video_3BVS,2,True)%></span>
						<br>
						<a href="/Player/Show.asp?Id=<%=Video_Player%>" class="High" title="点击查看个人信息"><%=Video_Player_Name%></a>
						<span onClick="location='/Help/Title.asp';" style="cursor:pointer" class="Title" title="点击查看称号说明"><%=Video_Player_Title%></span><span class="Counter"><%=Player_Sex_Text%></span>
						上传于<%=FormatDateTime(Video_Time,1)%><br>
						<%
						If Video_Freeze Then
							%><span class="Sign">此录像已被管理员冻结,三日内将自动删除!</span><%
						Else
							If Video_Check Then%>
							<span class="Texts">[</span><span onClick="location='/Help/Title.asp';" class="<%=Video_CheckBy_Title%>" title="点击查看称号说明"><%=Video_CheckBy_Title%></span><span class="Texts">]</span> <a href="/Player/Show.asp?Id=<%=Video_CheckBy%>" class="High" title="点击查看个人信息"><%=Video_CheckBy_Name%></a>&nbsp;审核于<%=FormatDateTime(Video_Check_Time,1)%>
							<%Else%>
							<span class="Sign">此录像尚未通过审核!</span>
							<%End If
						End If
						%>
						<br>
						上传<%If DateDiff("d",Video_Time,Now())>30 Then%><%=DateDiff("m",Video_Time,Now())%>个月<%Else%><%=DateDiff("d",Video_Time,Now())%>天<%End If%>来，共有&nbsp;<span class="Title"><%=Video_Click%></span>&nbsp;人点击，评论&nbsp;<span class="Title"><%=Video_Comment%></span>&nbsp;条 <br>
		<table width="250" border="0" cellpadding="0" cellspacing="0">
		  <tr height="5">
			<td></td>
		  </tr>
		</table>
<script type="text/JavaScript"> 
alimama_pid="mm_11936678_1495783_3850206"; 
alimama_titlecolor="FFFFFF"; 
alimama_descolor ="BFBFBF"; 
alimama_bgcolor="333333"; 
alimama_bordercolor="333333"; 
alimama_linkcolor="ffff00"; 
alimama_bottomcolor="FFFFFF"; 
alimama_anglesize="0"; 
alimama_bgpic="0"; 
alimama_icon="0"; 
alimama_sizecode="13"; 
alimama_width=250; 
alimama_height=60; 
alimama_type=2; 
</script> 
<script src="http://a.alimama.cn/inf.js" type=text/javascript> 
</script>
					  </td>
						<td width="100" valign="top" class="Text">
						<table border="0" cellspacing="0" cellpadding="0">
						  <tr>
							<td height="50" valign="top">
							<%If Video_Freeze Then
								Call Button("为什么冻结?",100,40,"location='/Help/Freeze.asp';",1)
							Else
								' If Session("Player_Id") <> "" Then
								' 	Act = "location='"&Video_Path&"';Comment_Form.Comment_Text.select();"
								' Else
								' 	Act = "location='"&Video_Path&"';"
								' End If
								If Session("Player_Id") <> "" Then
									Act = "loadVideo('"&Video_Path&"');"
								Else
									Act = "loadVideo('"&Video_Path&"');"
								End If
								Call Button("在线播放",100,40,Act,0)
							End If%>
							</td>
						  </tr>
						  <tr>
							<td height="55" valign="top">
							<%
							If Session("Player_Id") <> "" Then
								Act = "Action.location='Action/Download_Action.asp';Comment_Form.Comment_Text.select();"
							Else
								Act = "Action.location='Action/Download_Action.asp';"
							End If
							Call Button("保存录像",100,40,Act,0)
							%>
							</td>
						  </tr>
						  <tr>
							<td height="20" valign="top">
							<%If Video_Freeze Then%>
								<%If Session("Player_IsMaster") Then
									Call Button("解冻录像",100,40,"Action.location='Action/UnFreeze_Action.asp?Id="&Video_Id&"';",0)
								Else
									If Video_Player = Session("Player_Id") Then
										Call Button("删除录像",100,40,"Action.location='Action/Del_Action.asp?Id="&Video_Id&"';",0)
									Else
										Call Button("怎么看录像?",100,60,"location='/Help/Video.asp';",1)
									End If
								End If
							Else
								If Video_Check Then%>
									<%If Session("Player_Id") = "1" Or (Session("Player_Id") = Video_CheckBy And DateDiff("d",Video_Check_Time,now())<3) Then%>
									<table width="100" height="40" border="0" align="left" cellpadding="0" cellspacing="0" style="cursor:pointer; " onClick="location='/Video/Freeze.asp?Id=<%=Video_Id%>';">
										<tr>
										  <td align="center" bgcolor="#555555" class="Sign">冻结录像</td>
										</tr>
									</table>
									<%Else
										Call Button("怎么看录像?",100,60,"location='/Help/Video.asp';",1)
									End If
								Else
									If Session("Player_IsMaster") Then
										Call Button("审核录像",100,40,"top.Action.location='"&Video_Path&"';location='/Video/Check.asp?Id="&Video_Id&"';",1)
									Else
										If Video_Player = Session("Player_Id") Then
											Call Button("删除录像",100,40,"Action.location='Action/Del_Action.asp?Id="&Video_Id&"';",1)
										Else
											Call Button("怎么看录像?",100,60,"location='/Help/Video.asp';",1)
										End If
									End If
								End If
							End If%>
							</td>
						  </tr>
						</table>
					  </td>
					</tr>
				</table>
				<table width="400" border="0" cellspacing="0" cellpadding="0">
					<tr><td height="1" bgcolor="#555555"></td></tr>
				</table>
				<%If Session("Player_Id") <> "" Then%>
				<table width="400" border="0" cellspacing="10" cellpadding="0">
				<form name="Comment_Form" action="Action/Comment_Add_Action.asp" method="post" target="Action">
					<tr>
					  <td height="30" valign="middle" class="Text">
					  <input name="Comment_Text" type="text" class="input-no" size="48" maxlength="500" value="<%=Video_Comment_Text%>">
					  <input name="Comment_Video" type="hidden" value="<%=Video_Id%>">
					  </td>
					  <td width="100" rowspan="2" valign="top" class="Text">
						<table width="100" height="20" border="0" align="left" cellpadding="0" cellspacing="0" style="cursor:pointer; " onClick="Comment_Form.submit();">
							<tr>
							  <td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">我来说两句</td>
							</tr>
						</table>
					  </td>
				  </tr>
				</form>
				</table>
				<table width="400" border="0" cellspacing="0" cellpadding="0">
					<tr><td height="1" bgcolor="#555555"></td></tr>
				</table>
				<%
				End If
				If Video_Comment>0 Then
				
					If Video_Comment =1 Then
						Comment_Height = 70
					Else
						If Video_Comment>5 Then
							Comment_Height = 250
						Else
							Comment_Height = (Video_Comment) * 50
						End If
					End If
					%>
					<table width="400" border="0" cellspacing="10" cellpadding="0">
						<tr><td valign="top">
							<div id="Comment" style="display:yes ">
							<iframe id="Comment_Frame" name="Comment_Frame" frameborder="0" width="380" height="1" scrolling="no" src="/Video/Comment_List.asp?Id=<%=Video_Id%>&Page=1"></iframe>
							</div>
						</td></tr>
					</table>
					<%
				End If
				%>
			  </td>
			</tr>
		</table>
		<iframe name="Action" style="display: none"></iframe>
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

		function loadVideo(path){
			var isIE=window.ActiveXObject || "ActiveXObject" in window;
			if(isIE){
				alert('暂不支持 IE 内核 ,请更换浏览器或内核！');
			}else{
				parent.document.getElementById('Window_Video').contentWindow.loadVideo(path);
		    }
		}

		//用户前进后退时会重新加载此页面
		//重新加载时隐藏录像播放界面、显示查看界面(防止播放时后退被隐藏)、重置录像播放界面
		function HindVideo(){
			parent.document.getElementById('Window_Video').contentWindow.closeVideo();
		}
		if(parent.document.getElementById('Window_Video') != null 
			&& typeof parent.document.getElementById('Window_Video').contentWindow.closeVideo === "function"){
			HindVideo();
		}
		
		</script>
		<%
	
	Case "Show_Fail"
	
		Message = "此录象不存在!"
		Act="top.location=top.location"
		Call Error()	
		
End Select		
%>