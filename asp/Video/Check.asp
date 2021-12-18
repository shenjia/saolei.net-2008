<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-15 
'------------------------
Dim Why(10)
Why_Counter = 6
Why(1) = "未设定录像标识文字"
Why(2) = "录像的标识与用户注册标识不符"
Why(3) = "填写数据与录像实际数据不符"
Why(4) = "录像非Classical模式"
Why(5) = "录像存在BUG"
Why(6) = "录像无法打开"
%>
<!--#include virtual="/Player/Check.asp"-->
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
<!--#include virtual="/Models/Include/NoHtml.asp"-->
<%
Call Check_Master()

If Check_Result <> "Fail" Then

	Beg_Text = "初级"
	Int_Text = "中级"
	Exp_Text = "高级"
			
	Call Start_Conn()
	
	Video_Id = Request("Id")
	
	Set cmd = Server.CreateObject("ADODB.Command")
	Set cmd.ActiveConnection = Conn
	cmd.CommandText = "dbo.Video_Check_Read"
	cmd.CommandType = &H0004
	
	cmd.Parameters.Append cmd.CreateParameter("@Video_Id",3)
	cmd.Parameters.Append cmd.CreateParameter("@Video_Player",3,2)
	cmd.Parameters.Append cmd.CreateParameter("@Video_Player_Name",200,2,12)
	cmd.Parameters.Append cmd.CreateParameter("@Video_Player_Title",200,2,4)
	cmd.Parameters.Append cmd.CreateParameter("@Video_Player_Sex",3,2)
	cmd.Parameters.Append cmd.CreateParameter("@Video_Player_Text",200,2,100)
	cmd.Parameters.Append cmd.CreateParameter("@Video_Model",200,2,3)
	cmd.Parameters.Append cmd.CreateParameter("@Video_Path",200,2,100)
	cmd.Parameters.Append cmd.CreateParameter("@Video_IsNoFrag",3,2)
	cmd.Parameters.Append cmd.CreateParameter("@Video_Score",5,2)
	cmd.Parameters.Append cmd.CreateParameter("@Video_3BV",3,2)
	cmd.Parameters.Append cmd.CreateParameter("@Video_3BVS",5,2)
	cmd.Parameters.Append cmd.CreateParameter("@Video_Time",135,2)
	cmd.Parameters.Append cmd.CreateParameter("@Result",200,2,20)
	
	cmd("@Video_Id") = Video_Id
	cmd.execute
	
	Result = cmd("@Result")
	
	Select Case Result

		Case "Read_OK"
		
			Video_Player = cmd("@Video_Player")
			Video_Player_Name = cmd("@Video_Player_Name")
			Video_Player_Title = cmd("@Video_Player_Title")
			Video_Player_Sex = cmd("@Video_Player_Sex")
			Video_Player_Text = cmd("@Video_Player_Text")
			Video_Model = cmd("@Video_Model")
			Video_Path = cmd("@Video_Path")
			Video_Path = Replace(Video_Path,vbcr,"")
			Video_Path = Replace(Video_Path,vblf,"")
			Video_IsNoFrag = cmd("@Video_IsNoFrag")
			Video_Score = cmd("@Video_Score")
			Video_3BV = cmd("@Video_3BV")
			Video_3BVS = cmd("@Video_3BVS")
			Video_Time = cmd("@Video_Time")
			
			If Video_Player_Sex Then
				Player_Sex_Text = "GG"
			Else
				Player_Sex_Text = "mm"
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
			.tbl {table-layout:fixed}
			.td {overflow:hidden;}
			.cls1 { position:absolute; left:50px; top:146px; width:195px; height:18px; z-index:1 }
			.cls2 { position:absolute; left:25px; top:73px; width:195px; height:18px; z-index:2 }
			-->
			</style>
			<link href="/Models/Css/2008.css?v=20211218" rel="stylesheet" type="text/css">
			<!--#include virtual="/Models/Include/Windows.asp"-->
			</head>
			<body onload="Window_Load();" onMousemove="move()" topmargin=0 leftmargin=0 scroll=no>
			<table id="Window_Table" border="0" cellspacing="1" cellpadding="0" bgcolor="#999999">
				<tr>
				  <td bgcolor="#444444">
					<table width="400" border="0" cellspacing="0" cellpadding="0">
						<tr bgcolor="#555555">
							<td height="25" class="Highest" onmousedown="down=true;divtop=event.clientY;divleft=event.clientX;" onmouseup="down=false" onmouseout="down=false">　审核录像</td>
							<td width="20" height="25" align="center" class="Bold" onMouseOver="this.className='Signest';" onMouseOut="this.className='Bold';" style="cursor:pointer; " onClick="Cancel();">×</td>
						</tr>
					</table>
					<table width="400" border="0" cellspacing="10" cellpadding="0" class="tbl">
						<tr>
							<td width="73%" valign="middle" class="td" nowrap><div class="Text">
							<span class="<%=Video_Model%>">
							<%Execute "Response.Write("&Video_Model&"_Text)"%></span>&nbsp;<span class="Signest"><%=FormatNumber(Video_Score,2)%></span><%If Video_IsNoFrag Then%><span class="Counter">NF</span><%End If%>&nbsp;秒录像，3BV=<span class="Title"><%=Video_3BV%></span>，3BV/s=<span class="Title"><%=FormatNumber(Video_3BVS,2,True)%></span>
							<br>
							<a href="/Player/Show.asp?Id=<%=Video_Player%>" class="High" title="点击查看个人信息"><%=Video_Player_Name%></a>
							<span onClick="location='/Help/Title.asp';" style="cursor:pointer" class="Title" title="点击查看称号说明"><%=Video_Player_Title%></span><span class="Counter"><%=Player_Sex_Text%></span>
							上传于<%=FormatDateTime(Video_Time,1)%><br>
							录像标识：<span class="Sign" title="<%=Video_Player_Text%>"><%=NoHtml(Video_Player_Text)%></span><br>
							Arbiter版本：<span class="Sign"><%=getVersion(Video_Path)%></span>
						</div>
			
							
						  </td>
							<td width="27%" valign="top" class="Text">
							<table border="0" cellspacing="0" cellpadding="0">
							  <tr>
								<td height="40" valign="top">
								<table width="100" height="20" border="0" align="left" cellpadding="0" cellspacing="0" style="cursor:pointer; " onClick="location='<%=Video_Path%>';">
									<tr>
									  <td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">打开录像</td>
									</tr>
								</table></td>
							  </tr>
							  <tr>
								<td height="45" valign="top">
								<table width="100" height="40" border="0" align="left" cellpadding="0" cellspacing="0" style="cursor:pointer; " onClick="Action.location='Action/Check_Action.asp?Id=<%=Video_Id%>';">
									<tr>
									  <td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">审核通过</td>
									</tr>
								</table></td>
							  </tr>
							</table>
						  </td>
						</tr>
						<form name="Freeze_Form" action="Action/Freeze_Action.asp" method="post" target="Action">
						<tr>
						  <td valign="top" class="Text">
						  <div class="cls1" style="clip: rect(2 380 21 210)"> 
						  <select name="Why" class="input-no" style="width:227" onchange="Why_Text.value=this.value">
							<option></option>
							<%For I = 1 To Why_Counter%>
							<option value="<%=Why(I)%>"><%=Why(I)%></option>
							<%Next%>
						  </select>
						  <input name="Video_Id" type="hidden" value="<%=Video_Id%>">
						</div>
						<div class="cls2"><span class="cls2">
						<input type="text" name="Why_Text" style="width: 227; height: 21" class="input-no" maxlength="21">
						</span> </div>
						  理由：<input name="Comment_Video" type="hidden" value="<%=Video_Id%>"></td>
						  <td valign="top" class="Text"><table width="100" height="20" border="0" align="left" cellpadding="0" cellspacing="0" style="cursor:pointer; " onClick="Freeze_Form.submit();">
							<tr>
							  <td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">冻结录像</td>
							</tr>
						  </table></td>
					  </tr>
						</form>
					</table>
					<table width="400" border="0" cellspacing="0" cellpadding="0">
						<tr><td height="1" bgcolor="#555555"></td></tr>
					</table>
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
			</script>
			<%
			
		Case "Read_Fail"
		
			Message = "此录象不存在或已被其他管理员审核!"
			Act="top.location=top.location"
			Call Error()	
			
	End Select		

End If

function getVersion(filename) 
	dim fso,f,temparray,tempcnt 
    set fso = server.CreateObject("scripting.filesystemobject") 
    if not fso.fileExists(server.mappath(filename)) then exit function 
    set f = fso.opentextfile(server.mappath(filename),1) 
    if not f.AtEndofStream then 
        tempcnt = f.readall 
        f.close 
        set f = nothing 
        if CStr(Left(tempcnt,1)) = "1" then
            getVersion = "0.49.X"
        else
            getVersion = Left(Right(tempcnt,51),6)
        end if 
    end if
end function 
%>