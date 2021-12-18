<%
'------------------------
'Code:Zhang Shen Jia
'Date:2008-1-1
'------------------------
Dim Why(10)
Why_Counter = 4
Why(1) = "无任何意义"
Why(2) = "恶意人身攻击"
Why(3) = "散布广告信息"
Why(4) = "包含违法内容"
%>
<!--#include virtual="/Player/Check.asp"-->
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
<%
Call Check()

If Check_Result <> "Fail" Then

	Title_Id = Request("Id")
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
	.cls1 { position:absolute; left:50px; top:37px; width:195px; height:18px; z-index:1 }
	.cls2 { position:absolute; left:25px; top:18px; width:195px; height:18px; z-index:2 }
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
					<td height="25" class="Highest" onmousedown="down=true;divtop=event.clientY;divleft=event.clientX;" onmouseup="down=false" onmouseout="down=false">　删除帖子</td>
					<td width="20" height="25" align="center" class="Bold" onMouseOver="this.className='Signest';" onMouseOut="this.className='Bold';" style="cursor:pointer; " onClick="Cancel();">×</td>
				</tr>
			</table>
			<table width="400" border="0" cellspacing="10" cellpadding="0" class="tbl">
				<form name="Del_Form" action="Action/Del_Action.asp" method="post" target="Action">
				<tr>
				  <td width="73%" valign="top" class="Text">
				  <div class="cls1" style="clip: rect(2 380 21 210)"> 
				  <select name="Why" class="input-no" style="width:227" onchange="Why_Text.value=this.value">
					<option></option>
					<%For I = 1 To Why_Counter%>
					<option value="<%=Why(I)%>"><%=Why(I)%></option>
					<%Next%>
				  </select>
				  <input name="Title_Id" type="hidden" value="<%=Title_Id%>">
				</div>
				<div class="cls2"><span class="cls2">
				<input type="text" name="Why_Text" style="width: 227; height: 21" class="input-no" maxlength="21">
				</span> </div>
				  理由：</td>
				  <td width="27%" valign="top" class="Text"><table width="100" height="20" border="0" align="left" cellpadding="0" cellspacing="0" style="cursor:pointer; " onClick="Del_Form.submit();">
					<tr>
					  <td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">进行删除</td>
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
	<%
End If
%>