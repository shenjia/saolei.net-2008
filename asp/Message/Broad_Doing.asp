<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-17
'------------------------
%>
<!--#include virtual="/Player/Check.asp"-->
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
<!--#include virtual="/Models/Include/Bar.asp"-->
<%
Act = "Top_Go"
Call Check_Master()

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
		background-color: #444444;
	}
	-->
	</style>
	<link href="/Models/Css/2008.css" rel="stylesheet" type="text/css">
	<script language="javascript">
	function Window_Load()
	{
		parent.Window_Box.style.display='';
		parent.Window_Box.Width='';
		parent.Start_Mask();
		theWidth = 362;
		theHeight = 67;
		parent.document.all.Window_Frame.width=theWidth;
		parent.document.all.Window_Frame.height=theHeight;
		parent.document.all.Window_Box.width=theWidth;
		parent.document.all.Window_Box.height=theHeight;
		parent.document.all.Window_Box.style.top=parent.document.body.scrollTop+(screen.height-theHeight-168)/2;
		parent.document.all.Window_Box.style.left=(screen.width-theWidth)/2;
	}
	var over=false,down=false,divleft,divtop;
	function move(){
		if(down){	
			parent.document.getElementById('Window_Box').style.left=parseInt(parent.document.getElementById('Window_Box').style.left)-divleft+event.clientX;
			parent.document.getElementById('Window_Box').top=parseInt(parent.document.getElementById('Window_Box').style.top)-divtop+event.clientY;
		}
	}
	</script>
	</head>
	<body onMousemove="move()" onLoad="Window_Load();Broad_Form.submit();" topmargin=0 leftmargin=0 scroll=no>
	<table id="Window_Box" border="0" cellspacing="1" cellpadding="0" bgcolor="#999999">
		<tr>
			<td bgcolor="#444444">
				<table width="360" border="0" cellspacing="0" cellpadding="0">
					<tr bgcolor="#555555">
						<td height="25" class="Highest" onmousedown="down=true;divtop=event.clientY;divleft=event.clientX;" onmouseup="down=false" onmouseout="down=false">　<span id="Broad">正在准备用户列表...</span></td>
				</tr>
				</table>
				<table width="360" border="0" cellspacing="10" cellpadding="0">
					<tr onMouseOver="Box_Broad.style.background='#999999';Bar_Broad.style.background='#999999';" onMouseOut="Box_Broad.style.background='#777777';Bar_Broad.style.background='#777777';">
						<td width="320" class="Text">
						<%Call Bar("Broad",0,100,340,20)%></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<iframe name="Action" style="display: none"></iframe>
	<form style="display:none " name="Broad_Form" action="/Message/Action/Broad_Action.asp" target="Action" method="post">
	<textarea name="Message_Text"><%=Session("Message_Text")%></textarea>
	</form>
	</body>
	</html>
	<%
	
End If
%>