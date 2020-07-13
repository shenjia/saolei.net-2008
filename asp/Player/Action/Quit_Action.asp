<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-12
'------------------------
Title_Id = Session("Title_Id")
Session.Abandon()
Session("Title_Id") = Title_Id
%>
<script language=Javascript>
<!--
top.location=top.location;
-->
</script>
