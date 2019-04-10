<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-17
'------------------------
Message_Number = Request("Message")
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
function Message_Load()
{
	parent.document.getElementById('Message_Box').style.display='block';
	parent.document.getElementById('Message_Box').width='';
	theWidth = document.getElementById('Message_Table').clientWidth;
	theHeight = document.getElementById('Message_Table').clientHeight;
	parent.document.getElementById('Message_Frame').width=theWidth;
	parent.document.getElementById('Message_Frame').height=theHeight;
	parent.document.getElementById('Message_Box').width=theWidth;
	parent.document.getElementById('Message_Box').height=theHeight;
	parent.document.getElementById('Message_Box').style.top=parent.document.body.scrollTop+(screen.height-theHeight-168)/2;
	parent.document.getElementById('Message_Box').style.left=(screen.width-theWidth)/2;
}
var over=false,down=false,divleft,divtop;
function move(){
	if(down){
	var isIE=document.all? true:false;
	if(isIE){X=event.clientX;Y=event.clientY;}
	else{X=this.pageX;Y=this.pageY;}
	parent.document.getElementById('Message_Box').style.left=(parseInt(parent.document.getElementById('Message_Box').style.left)-divleft+X)+"px";
	parent.document.getElementById('Message_Box').style.top=(parseInt(parent.document.getElementById('Message_Box').style.top)-divtop+Y)+"px";
	}
}
</script>
</head>
<body onload="Message_Load();" onMousemove="move()" topmargin=0 leftmargin=0 scroll=no>
<table id="Message_Table" border="0" cellspacing="1" cellpadding="0" bgcolor="#999999">
	<tr>
		<td bgcolor="#444444">
			<table width="260" border="0" cellspacing="0" cellpadding="0">
				<tr bgcolor="#555555">
					<td height="25" class="Highest" onmousedown="down=true;divtop=event.clientY;divleft=event.clientX;" onmouseup="down=false" onmouseout="down=false">　短消息通知</td>
					<td width="20" height="25" align="center" class="Bold" onMouseOver="this.className='Signest';" onMouseOut="this.className='Bold';" style="cursor:pointer; " onClick="Cancel();">×</td>
			</tr>
			</table>
			<table width="260" border="0" cellspacing="10" cellpadding="0">
				<tr>
					<td colspan="2" class="Text">
					　您的收件箱内有&nbsp;<span class="Signest"><%=Message_Number%></span>&nbsp;个未读消息！</td>
				</tr>
				<tr>
					<td width="119" class="Text">				  
						<table width="100" height="30" border="0" align="right" cellpadding="0" cellspacing="1" style="cursor:pointer; " onClick="Cancel();top.Window('/Message/Box.asp');">
							<tr>
								<td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">马上去看看</td>
							</tr>
					</table></td>
					<td width="111" class="Text">
						<table width="100" height="30" border="0" align="left" cellpadding="0" cellspacing="1" style="cursor:pointer; " onClick="Cancel();">
							<tr>
								<td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">一会再说</td>
							</tr>
					  </table>
				  </td>
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
		parent.document.getElementById('Message_Box').style.display='none';
}
</script>
