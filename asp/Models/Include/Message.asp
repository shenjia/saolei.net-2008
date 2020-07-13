<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-17
'------------------------
%>
<div id="Message_Box" style="position:absolute; width:1px; height:1px; z-index:1; display: none;">
	<iframe id="Message_Frame" width="1" height="1" frameborder="0" src="/Message/Check.asp" scrolling="no"></iframe>
</div>
<script language="javascript">
function Message_Check()
{
	if (!((parent.document.getElementById('Window_Box').style.display=='')&&(parent.document.getElementById('Window_Frame').src='/Message/Box.asp')))
		{
			document.getElementById('Message_Frame').location='/Message/Check.asp?tmp='+Math.random();
		}
}
Message_Checking=setInterval('Message_Check()',30000);
</script>