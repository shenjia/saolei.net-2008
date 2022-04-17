<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-11
'------------------------
Dim Video_Model
Dim Video_Id
%>
<!--#include virtual="/Player/Check.asp"-->
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
<!--#include virtual="/Models/Include/ShowHide.asp"-->
<%
Call Check()
Call Get_Input()

If Check_Result <> "Fail" Then

	Beg_Text = "初级"
	Int_Text = "中级"
	Exp_Text = "高级"
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
		background-color: #444444;
	}
	-->
	</style>
	<link href="/Models/Css/2008.css?v=20220104" rel="stylesheet" type="text/css">
	<!--#include virtual="/Models/Include/Windows.asp"-->
	</head>
	<body onload="Window_Load();Upload_Form.Video.select();" onMousemove="move()" topmargin=0 leftmargin=0 scroll=no>
	<form name="Upload_Form" action="Action/Upload_Action.asp" method="post" target="Action" enctype="multipart/form-data">
	<table id="Window_Table" border="0" cellspacing="1" cellpadding="0" bgcolor="#999999">
		<tr>
			<td bgcolor="#444444">
				<table width="360" border="0" cellspacing="0" cellpadding="0">
					<tr bgcolor="#555555">
						<td height="25" class="Highest" onmousedown="down=true;divtop=event.clientY;divleft=event.clientX;" onmouseup="down=false" onmouseout="down=false">　上传<%Execute "Response.Write("&Video_Model&"_Text)"%>录像</td>
						<td width="20" height="25" align="center" class="Bold" onMouseOver="this.className='Signest';" onMouseOut="this.className='Bold';" style="cursor:pointer; " onClick="Cancel();">×</td>
				</tr>
				</table>
				<%
				If Video_Id<>0 Then
					Call Start_Conn()
					SQL_Text = "Video_Read "&Video_Id
					rs.Open SQL_Text,Conn,3,1
					%>
					<table width="360" border="0" cellspacing="10" cellpadding="0">
						<tr>
						<td class="Text">
							<span class="Sign">此录像将被删除：</span>
							<span class="<%=rs("Video_Model")%>"><%Execute "Response.Write("&rs("Video_Model")&"_Text)"%></span> <span class="Title"><%=FormatNumber(rs("Video_Score"),2)%></span><%If rs("Video_IsNoFrag") Then%><span class="Counter">NF</span><%End If%>
							<span class="Counters">3BV=</span><span class="Counter"><%=CInt(rs("Video_3BV"))%></span> <span class="Counters">3BV/s=</span><span class="Counter"><%=FormatNumber(rs("Video_3BVS"),2,True)%></span>
						</td>
						</tr>
					</table>
					<table width="360" border="0" cellspacing="0" cellpadding="0">
						<tr><td height="1" bgcolor="#555555"></td></tr>
					</table>
					<%
					Call End_Conn()
				End If%>
				<table width="360" border="0" cellspacing="10" cellpadding="0">
					<tr>
						<td class="Text">
						请选择 <span class="Title">avf</span> 录像文件：
						<input name="Video" type="File" class="input-no" size="20" maxlength="100" onchange="AnalyzeFiles(this.files)"><br>
						请输入录像３ＢＶ值：
						<input name="Video_3BV" type="text" class="input-no" size="3" maxlength="3" onFocus="Show('For_Video_3BV')" onBlur="Hide_3BV()">
						<span id="For_Video_3BV" style="display: none">&nbsp;<a href="/Help/Upload_3BV.asp" class="Sign">怎样查看录像3BV值？</a></span> <br>
						请输入录像时间成绩：
						  <input name="Video_Score" type="text" class="input-no" size="6" maxlength="6" onFocus="Show('For_Video_Score')" onBlur="Hide('For_Video_Score')"><input type="checkbox" name="Video_IsNoFrag" value="1">&nbsp;盲扫
						  <span id="For_Video_Score" class="High" style="display: none">※精确到两位小数</span><br>
						※为和mvf录像成绩保持兼容，avf录像的成绩会自动加上1秒

						<input name="Video_Model" type="hidden" value="<%=Video_Model%>">
						<input name="Video_Id" type="hidden" value="<%=Video_Id%>">
					  </td>
					</tr>
					<tr>
					<td class="Text">
						<table width="340" border="0" cellspacing="0" cellpadding="0">
						  <tr>
							<td>
								<table width="80" height="30" border="0" align="center" cellpadding="0" cellspacing="1" style="cursor:pointer; " onClick="Upload_Form.submit();">
									<tr>
										<td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';"	>开始上传</td>
									</tr>
								</table>
							</td>
							<td>
								<table width="100" height="30" border="0" align="center" cellpadding="0" cellspacing="1" style="cursor:pointer; " onClick="location='/Help/Upload_Rule.asp';">
									<tr>
										<td align="center" bgcolor="#555555" class="Sign">上传录像须知</td>
									</tr>
								</table>
							</td>
							<td>
								<table width="80" height="30" border="0" align="center" cellpadding="0" cellspacing="1" style="cursor:pointer; " onClick="Cancel();">
									<tr>
										<td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">放弃上传</td>
									</tr>
								</table>
							</td>
						  </tr>
						</table>
					</td>
				  </tr>
				</table>
			</td>
		</tr>
	</table>
	</form>
	</body>
	</html>
	<iframe name="Action" style="display: none"></iframe>
	<script language="javascript">
	function Hide_3BV()
	{
		setTimeout("Hide('For_Video_3BV')",150)
	}
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
			case 9:
			Upload_Form.Video_Score.focus();
			break;
			case 13:
			Upload_Form.submit();   
			break;
			case 27:
			Cancel();      
			break;
		}
	}		
	document.onkeydown=KeyDown; 
	document.onkeypress=KeyDown;
	
	function Cancel()
	{
			Upload_Form.Video.blur();
			Upload_Form.Video_3BV.blur();
			Upload_Form.Video_Score.blur();
			parent.End_Mask();
			parent.document.getElementById('Window_Box').style.display='none';
	}

    function Error(msg) {
        const iframe = parent.document.getElementById('Window_Frame')
        if (iframe) {
            iframe.contentDocument.querySelector("input[name='Video']").value = ""
            iframe.contentDocument.querySelector("input[name='Video_3BV']").value = ""
            iframe.contentDocument.querySelector("input[name='Video_Score']").value = ""
            iframe.contentDocument.querySelector("input[name='Video_IsNoFrag']").checked = false
        }
        alert(msg)
    }

    function AnalyzeSuccess(video) {
        const iframe = parent.document.getElementById('Window_Frame')
        if (!video || !iframe) return
        const levelArr = ['Unknown', 'Beg', 'Int', 'Exp', 'Cus']
        const playerName = new TextDecoder('Windows-1252').decode(video.getPlayerArray()).trim()
        if (levelArr[video.getLevel()] !== iframe.contentDocument.querySelector("input[name='Video_Model']").value) {
            Error('录像级别错误，请重新选择录像文件')
        } else if (parent.flop.videoType === 'avf' && playerName === 'Anonymous! Press F5 for Setup') {
            Error('录像标识文字未设置，请重新选择录像文件！')
        } else if (parent.flop.videoType === 'rmv' && playerName === 'ANONYMOUS') {
            Error('录像标识文字未设置，请重新选择录像文件！')
        } else {
            iframe.contentDocument.querySelector("input[name='Video_3BV']").value = video.getBBBV()
            iframe.contentDocument.querySelector("input[name='Video_Score']").value = (video.getTime() / 1000).toFixed(3)
            iframe.contentDocument.querySelector("input[name='Video_IsNoFrag']").checked = video.getRightClicks() === 0 && video.getDoubleClicks() === 0
        }
    }

    function AnalyzeFiles(files) {
        const iframe = parent.document.getElementById('Window_Frame')
        if (!files || !iframe || !parent.flop) return
        const name = files[0].name
        const type = name.indexOf('.') !== -1 ? name.substring(name.lastIndexOf('.') + 1) : ''
        if (type !== 'avf' && type !== 'rmv') {
            Error('录像格式错误，请选择avf或者rmv录像！')
            return
        }
        parent.flop.videoType = type
        parent.flop.parseFiles(files, AnalyzeSuccess)
    }

	</script>
	<%
	
End If

Sub Get_Input()

	Video_Model = Request("Model")
	Video_Id = Request("Id")
	If Video_Id = "" Then Video_Id = 0
	
End Sub
%>