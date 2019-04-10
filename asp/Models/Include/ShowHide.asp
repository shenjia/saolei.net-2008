<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-11
'------------------------
%>
<SCRIPT language=javascript>
function ShowHide(id)
{
if (document.getElementById(id).style.display == "none")
{
document.getElementById(id).style.display="";
}
else
{
document.getElementById(id).style.display="none";
}
}
function Show(id)
{
document.getElementById(id).style.display="";
}
function Hide(id)
{
document.getElementById(id).style.display="none";
}
</script>