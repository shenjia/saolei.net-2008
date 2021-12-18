<%
'------------------------
'Code:Zhang Shen Jia
'Date:2008-1-1
'------------------------
Dim Title_Id
%>
<!--#include virtual="/Player/Check.asp"-->
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
<!--#include virtual="/Models/Common/Function.asp"-->
<!--#include virtual="/Models/Include/ShowHide.asp"-->
<!--#include virtual="/Models/Include/NoHtml.asp"-->
<%
Call Check()
Call Get_Input()

If Check_Result <> "Fail" Then

	Call Start_Conn()
	
	SQL_Text = "Title_Read "&CLng(Title_Id)
	rs.Open SQL_Text,Conn
	
	If rs.Eof Then
	
		Message = "主题不存在!"
		Act="top.location='/BBS/Index.asp'"
		Call Error()
	
	Else
	
		Title_Text = rs("Title_Text")
		Title_Get_Id = CLng(rs("Title_Get_Id"))
		Title_Name = rs("Title_Name")
		Title_Player = CInt(rs("Title_Player"))
		
	End If
		
	Call End_Conn()
	
	If (Session("Player_Id") <> 0 And Session("Player_Id") = Title_Player) Or Session("Player_IsMaster") Then
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
		-->
		</style>
		<link href="/Models/Css/2008.css?v=20211218" rel="stylesheet" type="text/css">
		</head>
		<body onLoad="parent.document.getElementById('BBS').style.display='block';">
		
			<table width="575" border="0" cellspacing="0" cellpadding="0">
			<tr>
			<td width="106" class="Text">
			<table width="80" height="20" border="0" align="left" cellpadding="0" cellspacing="0" style="cursor:pointer; " onClick="top.location='Title.asp?Id=<%If Title_Get_Id=0 Then%><%=Title_Id%><%Else%><%=Title_Get_Id%><%End If%>';">
			  <tr>
				<td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">返回</td>
			  </tr>
			</table></td>
			<td width="469" class="Text">您正在编辑本帖子</td>
			</tr>
			<tr><td height="10" colspan="3"></td></tr>
			<tr><td height="1" colspan="3" bgcolor="#555555"></td></tr>
			<tr><td height="10" colspan="3"></td></tr>
			</table>
			<table width="575" border="0" cellspacing="0" cellpadding="0">
			  <form name="Title_Form" action="Action/Edit_Action.asp" method="post" target="Action">
			  <%If Title_Get_Id = 0 Then%>
				<tr>
				  <td width="72" align="right" valign="top" class="Text">标　　题： </td>
				  <td width="503" valign="top" class="Text"><input name="Title_Name" type="text" class="input-no" size="50" maxlength="50" onFocus="Show('For_Title_Name')" onBlur="Hide('For_Title_Name')" value="<%=Title_Name%>">
					  <span id="For_Title_Name" class="High" style="display: none">※请输入标题（2～50字符）</span>
					  		<input name="Title_Id" value="<%=Title_Id%>" type="hidden">		
				  </td>
				</tr>
				<%End If%>
				<tr>
				  <td width="72" align="right" valign="top" class="Text">内　　容： </td>
				  <td width="503" valign="top" class="Text"><textarea name="Title_Text" cols="70" rows="20" wrap="VIRTUAL" class="input-bbs" onKeyDown="KeyDown();" onkeyup="Resize_Textarea();"><%=Html(Title_Text)%></textarea>
			  <%If Title_Get_Id <> 0 Then%>	
		  		<input name="Title_Id" value="<%=Title_Id%>" type="hidden">		
		  		<input name="Title_Name" value="Re:" type="hidden">		
			  <%End If%>
				  </td>
				</tr>
				<tr>
				  <td width="72" valign="top" class="Text">&nbsp;</td>
				  <td width="503" height="50" valign="middle" class="Text"><table border="0"  cellpadding="0" cellspacing="0">
					  <tr>
						<td width="90"><table width="80" height="20" border="0" align="left" cellpadding="0" cellspacing="0" style="cursor:pointer; " onClick="Title_Form.submit();">
							<tr>
							  <td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">提交编辑</td>
							</tr>
						</table></td>
				<td width="70">
					<table width="60" height="20" border="0" align="left" cellpadding="0" cellspacing="0" style="cursor:pointer; " onclick="Add_Class('Title')Resize_Textarea();">
					  <tr>
						<td align="center" bgcolor="#444444" class="Title" onMouseOver="this.className='Signest';" onMouseOut="this.className='Title';">标题</td>
					  </tr>
					</table>
				</td>
				<td width="70">
					<table width="60" height="20" border="0" align="left" cellpadding="0" cellspacing="0" style="cursor:pointer; " onclick="Add_Class('Sign');Resize_Textarea();">
					  <tr>
						<td align="center" bgcolor="#444444" class="Sign" onMouseOver="this.className='Sign';" onMouseOut="this.className='Sign';">醒目</td>
					  </tr>
					</table>
				</td>
				<td width="70">
					<table width="60" height="20" border="0" align="left" cellpadding="0" cellspacing="0" style="cursor:pointer; " onclick="Img();Resize_Textarea();">
					  <tr>
						<td align="center" bgcolor="#444444" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">贴图</td>
					  </tr>
					</table>
				</td>
				<td width="70">
					<table width="60" height="20" border="0" align="left" cellpadding="0" cellspacing="0" style="cursor:pointer; " onclick="Url();Resize_Textarea();">
					  <tr>
						<td align="center" bgcolor="#444444" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">链接</td>
					  </tr>
					</table>
				</td>
				<td width="70">
					<table width="60" height="20" border="0" align="left" cellpadding="0" cellspacing="0" style="cursor:pointer; " onclick="Face();Resize_Textarea();">
					  <tr>
						<td align="center" bgcolor="#444444" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">表情</td>
					  </tr>
					</table>
					<!--#include virtual="/Models/Include/Face.asp"-->
				</td>
				<td width="80">
					<table width="60" height="20" border="0" align="left" cellpadding="0" cellspacing="0" style="cursor:pointer; " onclick="Mine();Resize_Textarea();">
					  <tr>
						<td align="center" bgcolor="#444444" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">摆雷</td>
					  </tr>
					</table>
					<!--#include virtual="/Models/Include/Mine.asp"-->
						</td>
					  </tr>
				  </table></td>
				</tr>
				<tr>
				  <td valign="top" class="Text">&nbsp;</td>
				  <td height="50" valign="middle" class="Text">※ 提交编辑后您的帖子将会失去精华和加亮，请通知管理员再次审核<br>
			※ 违反<a href="javascript:;" onclick="top.Window('/Help/BBS.asp');" class="Sign">《论坛管理条例》</a>的主题将被删除</td>
				</tr>
			  </form>
		</table>

		<script type="text/javascript">
		var textarea=document.Title_Form.Title_Text;//获取textarea元素

		function Resize_Textarea(){
			// iPhone和Android在textarea内首次输入内容时，iPad正常显示(电脑模拟测试)
			// textarea会错误调整高度，并且调整高度与手机分辨率相关，原因不明
			if(/(iPhone|Android)/i.test(navigator.userAgent)){
				// 避免手机端在编辑textarea内容时无法看到按钮
				textarea.style.height="100%";
				if(textarea.value==""){
					// 当清空内容时textarea会自动回复原来的高度，原因不明
					textarea.style.height="";
				}
			}
		}

		function Add_Class(classname) {
			let start=textarea.selectionStart;//选择内容的开始位置
			let end=textarea.selectionEnd;//选择内容的结束位置
			let selection=textarea.value.substring(start,end);//选择的内容
			textarea.focus();//获取焦点，不然无法进行其他操作
			textarea.setSelectionRange(start,end);
			textarea.setRangeText("["+classname+"]"+selection+"[/"+classname+"]");
			textarea.setSelectionRange(start,end+2*classname.length+5);
		}
		textarea.onchange=function(){
			console.log(document);
		}
	</script>

		</body>
		</html>
		<iframe name="Action" style="display: none"></iframe>
		<%
	Else		
		Message = "您无权编辑本主题!"
		Act = "top.location='Title.asp'"
		Call Error()
	End If
End If

Sub Get_Input()

	Title_Id = Request("Id")
	
End Sub
%>
