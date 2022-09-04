<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-15
'------------------------
Dim NowStep 
Dim NowBar 

Sub Bar(Bar_Name,Step,All,Width,Height)
	If All = 0 Then
		All = 1
	End If
	%>
	<table id="Box_<%=Bar_Name%>" width="<%=Width%>" height="<%=Height%>" border="0" align="left" cellpadding="0" cellspacing="1" bgcolor="#777777">
		<tr bgcolor="#333333">
		  <td>
			<table border="0" align="left" cellpadding="0" cellspacing="0">
				<tr><td id="Bar_<%=Bar_Name%>" width="<%=Step*Width/All%>" bgcolor="#777777" height="<%=Height%>"></td></tr>
			</table>
		  </td>
		</tr>
	</table>
	<%
End Sub

Sub Bar_Go(Bar_Name,Step,All,Width)

	NowStep = NowStep + Step

	OldBar = NowBar	
	NowBar = CInt(NowStep*Width/All)
	
	If OldBar <> NowBar Then
		%><script>o('<%=Bar_Name%>',<%=NowBar%>);</script>
		<%
		Response.Flush
	End If
	
End Sub

Sub Bar_Reset(Bar_Name)
		
	NowStep = 1
	%><script>o('<%=Bar_Name%>',1);</script>
	<%Response.Flush

End Sub
%>