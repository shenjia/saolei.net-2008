<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-25
'------------------------
%>
<script language="javascript">
function Order_Select(Id)
{
	try{document.getElementById(Id).className = "Sign";}catch(e){}
}
function Order_Blur(Id)
{
	try{document.getElementById(Id).className = "Text";;}catch(e){}
}
function Order_Show(id)
{
document.getElementById(id).style.display="";
}
function Order_Hide(id)
{
document.getElementById(id).style.display="none";
}
</script>