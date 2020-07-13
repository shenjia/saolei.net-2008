<%
'------------------------
'Code:Zhang Shen Jia
'Date:2008-10-19
'------------------------
Sub Button(Title,Width,Height,Act,Sign)

%>
<table width="<%=Width%>" height="<%=Height%>" border="0" align="left" cellpadding="0" cellspacing="0" style="cursor:pointer; " onClick="<%=Act%>">
	<tr>
	  <td align="center" bgcolor="#555555" class="<%If Sign Then%>Sign<%Else%>High<%End If%>" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';"><%=Title%></td>
	</tr>
</table>
<%
End Sub
%>