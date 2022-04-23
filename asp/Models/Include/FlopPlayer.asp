<%
'------------------------
'Code:Hu En Bin
'Date:2022-04-22
'------------------------
%>
<iframe id="Flop_Player" class="flop-player-iframe flop-player-display-none"></iframe>

<script type="text/javascript">
window.addEventListener('load', function() {
    if (self !== top) return;
	window.requestAnimationFrame(function() {
		document.getElementById('Flop_Player').src = "/Play/index.html?v=202201011420";
	});
});
</script>
