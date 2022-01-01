<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-12
'------------------------
%>
<div id="Window_Box" style="position:absolute; width:1px; height:1px; z-index:1; display: none;">
	<iframe id="Window_Frame" width="1" height="1" frameborder="0" src="" scrolling="no"></iframe>
</div>

<iframe class="flop-player-iframe flop-player-display-none" src="../play/index.html?v=202201011420"></iframe>

<script language="javascript">
function Window(Url)
{
	parent.document.getElementById('Window_Frame').src=Url;
}
</script>
