<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-12
'------------------------
%>
<div id="Window_Box" style="position:absolute; width:100px; height:100px; z-index:1; display: yes;">
	<iframe id="Window_Frame" width="100" height="100" frameborder="0" src="" scrolling="no"></iframe>
</div>
<script language="javascript">
function Window(Url)
{
	Window_Frame.location=Url;
}
</script>