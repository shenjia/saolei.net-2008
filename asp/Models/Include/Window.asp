<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-12
'------------------------
%>
<div id="Window_Box" style="position:absolute; width:1px; height:1px; z-index:1; display: none;">
	<iframe id="Window_Frame" width="1" height="1" frameborder="0" src="" scrolling="no"></iframe>
</div>

<div id="Window_Border" style="position:absolute; width:1px; height:1px; z-index:1; display: none;">
    <!-- Window_Border设为不可见，避免前进后退重新显示 -->
    <iframe style="display: block;" id="Window_Video" width="1" height="1" frameborder="0" src="../play/video_2019510.html" scrolling="no"></iframe>
</div>
<script language="javascript">
function Window(Url)
{
	parent.document.getElementById('Window_Frame').src=Url;
}
</script>