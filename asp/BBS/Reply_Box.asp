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
<!--#include virtual="/Models/Include/ShowHide.asp"-->
<%
Call Check()
Call Get_Input()

If Check_Result <> "Fail" Then

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
	<link href="/Models/Css/2008.css" rel="stylesheet" type="text/css">
	</head>
	<body onLoad="parent.document.getElementById('BBS').style.display='block';Title_Form.Title_Text.focus();">
	
		<table width="575" border="0" cellspacing="0" cellpadding="0">
		<tr>
		<td width="106" class="Text">
		<table width="80" height="20" border="0" align="left" cellpadding="0" cellspacing="0" style="cursor:pointer; " onClick="top.location='/BBS/Title.asp?Id=<%=Title_Id%>';">
		  <tr>
			<td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">返回</td>
		  </tr>
		</table></td>
		<td width="469" class="Text">您将回复本主题</td>
		</tr>
		<tr><td height="10" colspan="3"></td></tr>
		<tr><td height="1" colspan="3" bgcolor="#555555"></td></tr>
		<tr><td height="21" colspan="3"></td></tr>
		</table>
	<table width="575" border="0" cellspacing="0" cellpadding="0">
	  <form name="Title_Form" action="Action/Reply_Action.asp" method="post" target="Action">
	  <tr>
		<td width="72" align="right" valign="top" class="Text">内　　容：
		</td>
	    <td width="503" valign="top" class="Text">
		<textarea name="Title_Text" cols="70" rows="20" wrap="VIRTUAL" class="input-bbs" onKeyDown="KeyDown();"></textarea>
		<input name="Title_Id" value="<%=Title_Id%>" type="hidden">		
		</td>
	  </tr>
	  <tr>
		<td width="72" valign="top" class="Text">&nbsp;</td>
	    <td width="503" height="50" valign="middle" class="Text">
		<table border="0"  cellpadding="0" cellspacing="0">
		<tr>
		<td width="90">
			<table width="80" height="20" border="0" align="left" cellpadding="0" cellspacing="0" style="cursor:pointer; " onClick="Title_Form.submit();">
			  <tr>
				<td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">发表回复</td>
			  </tr>
			</table>
		</td>
		<td width="70">
			<table width="60" height="20" border="0" align="left" cellpadding="0" cellspacing="0" style="cursor:pointer; " onmousedown="document.selection.createRange().text='[Title]'+document.selection.createRange().text+'[/Title]';">
			  <tr>
				<td align="center" bgcolor="#444444" class="Title" onMouseOver="this.className='Signest';" onMouseOut="this.className='Title';">标题</td>
			  </tr>
			</table>
		</td>
		<td width="70">
			<table width="60" height="20" border="0" align="left" cellpadding="0" cellspacing="0" style="cursor:pointer; " onmousedown="document.selection.createRange().text='[Sign]'+document.selection.createRange().text+'[/Sign]';">
			  <tr>
				<td align="center" bgcolor="#444444" class="Sign" onMouseOver="this.className='Sign';" onMouseOut="this.className='Sign';">醒目</td>
			  </tr>
			</table>
		</td>
		<td width="70">
			<table width="60" height="20" border="0" align="left" cellpadding="0" cellspacing="0" style="cursor:pointer; " onmousedown="Img();">
			  <tr>
				<td align="center" bgcolor="#444444" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">贴图</td>
			  </tr>
			</table>
		</td>
		<td width="70">
			<table width="60" height="20" border="0" align="left" cellpadding="0" cellspacing="0" style="cursor:pointer; " onmousedown="Url();">
			  <tr>
				<td align="center" bgcolor="#444444" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">链接</td>
			  </tr>
			</table>
		</td>
		<td width="70">
			<table width="60" height="20" border="0" align="left" cellpadding="0" cellspacing="0" style="cursor:pointer; " onClick="Face()">
			  <tr>
				<td align="center" bgcolor="#444444" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">表情</td>
			  </tr>
			</table>
			<!--#include virtual="/Models/Include/Face.asp"-->
		</td>
		<td width="80">
			<table width="60" height="20" border="0" align="left" cellpadding="0" cellspacing="0" style="cursor:pointer; " onClick="Mine();">
			  <tr>
				<td align="center" bgcolor="#444444" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">摆雷</td>
			  </tr>
			</table>
			<!--#include virtual="/Models/Include/Mine.asp"-->
		</td>
		</tr>
		</table>
		</td>
	  </tr>
	  <tr>
	    <td valign="top" class="Text">&nbsp;</td>
	    <td height="50" valign="middle" class="Text">※ 您无法编辑已经发表的回复,只能将其删除<br>
        ※ 违反<a href="javascript:;" onclick="top.Window('/Help/BBS.asp');" class="Sign">《论坛管理条例》</a>的主题将被删除</td>
	    </tr>
	  </form>
	</table>
	</body>
	</html>
	<iframe name="Action" style="display: none"></iframe>
	<%
End If

Sub Get_Input()

	Title_Id = Request("Id")
	
End Sub
%>
