<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-11
'------------------------
%>
<div id="divPageMask" style="background-color:black;opacity:0.33; left:0px;position:absolute;top:0px;"></div>
<script language="javascript">
var isIE=document.all? true:false;
if(isIE)
{
	document.getElementById("divPageMask").style.filter="alpha(opacity=33)";   
}
else
{
	document.getElementById("divPageMask").style.MozOpacity=0.33; 
}

function Start_Mask()
{
	document.getElementById("divPageMask").style.display="block";
	resizeMask();
	window.onResize = resizeMask;
}
function End_Mask()
{
	document.getElementById("divPageMask").style.width = "0px";
	document.getElementById("divPageMask").style.height = "0px";
	window.onResize = null;
}
function resizeMask()
{
	if(screen.height<=document.body.scrollHeight)
	{
	document.getElementById("divPageMask").style.width = document.body.scrollWidth;
	document.getElementById("divPageMask").style.height = document.body.scrollHeight;
	}
	else
	{
	document.getElementById("divPageMask").style.width = document.body.scrollWidth;
	document.getElementById("divPageMask").style.height = screen.height-168;
	}
	
}
</script>
