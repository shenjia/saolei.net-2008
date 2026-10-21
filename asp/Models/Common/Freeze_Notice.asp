<div id="Freeze_Mask" style="display:none;position:fixed;left:0;top:0;width:100%;height:100%;background:#000000;opacity:0.5;filter:alpha(opacity=50);z-index:9998;"></div>
<div id="Freeze_Box" style="display:none;position:fixed;left:50%;top:30%;width:360px;margin-left:-181px;border:1px solid #999999;z-index:9999;font-size:12px;">
	<table width="100%" border="0" cellspacing="1" cellpadding="0" bgcolor="#999999">
		<tr>
			<td height="25" bgcolor="#555555" class="Highest">　通知</td>
		</tr>
		<tr>
			<td bgcolor="#444444" align="center">
				<table width="300" border="0" cellspacing="0" cellpadding="0">
					<tr><td height="25"></td></tr>
					<tr><td align="center" style="color:#FFFFFF;">旧版已停止数据更新，请访问新版网站</td></tr>
					<tr><td height="20"></td></tr>
					<tr>
						<td align="center">
							<table width="240" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="120" height="30" align="center" bgcolor="#555555" style="cursor:pointer;" onclick="Freeze_Go();"><span style="color:#FFD700;">访问新版</span></td>
									<td width="20"></td>
									<td width="100" height="30" align="center" bgcolor="#555555" style="cursor:pointer;" onclick="Freeze_Close();"><span style="color:#CCCCCC;">留在旧版</span></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr><td height="25"></td></tr>
				</table>
			</td>
		</tr>
	</table>
</div>
<script language="JavaScript">
function Freeze_Go(){
	location.href = location.href.replace(/^(https?:\/\/)[^\/]+/i, "$1new.saolei.net");
}
function Freeze_Close(){
	document.getElementById("Freeze_Mask").style.display = "none";
	document.getElementById("Freeze_Box").style.display = "none";
}
(function(){
	var Show = true;
	try{
		var Time = new Date().getTime();
		var Last = Number(localStorage.getItem("Freeze_Notice_Time") || 0);
		Show = (Time - Last) >= 3600 * 1000;
		if(Show) localStorage.setItem("Freeze_Notice_Time", String(Time));
	}catch(e){}
	if(Show){
		document.getElementById("Freeze_Mask").style.display = "block";
		document.getElementById("Freeze_Box").style.display = "block";
	}
})();
</script>
