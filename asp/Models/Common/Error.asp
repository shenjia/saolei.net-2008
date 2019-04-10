<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-11
'------------------------
Dim Message
Dim Act
Dim Link
Dim Power

Public Sub Error()

	If Message <> "No" Then 

		%><script language="JavaScript">
			alert('<%=Message%>');
		</script><%

	End If

	Select Case Act

		Case "Close"

			%><script language="JavaScript">
				window.opener='';
				window.close();
			</script><%

		Case "Action_Close"

			%><script language=javascript>
			parent.document.all.Action.style.visibility='hidden';
			</script><%

		Case "Back"

			%><script language="JavaScript">
				history.go(-1);
			</script><%

		Case "Back_Again"

			%><script language="JavaScript">
				history.go(-2);
			</script><%
			
		Case "Go"

			%><script language=JavaScript>
				window.location.href='<%=Link%>';
			</script><%
			
		Case "Parent_Go"

			%><script language=JavaScript>
				parent.location.href='<%=Link%>';
			</script><%
			
		Case "Parent_Refresh"

			%><script language=JavaScript>
				parent.location.reload();
			</script><%
			
		Case "Top_Go"

			%><script language=JavaScript>
				top.location.href='<%=Link%>?tmp='+Math.random();
			</script><%
			
		Case "Top_Refresh"

			%><script language=JavaScript>
				top.location.reload();
			</script><%
			
		Case "No"
			
		Case Else

			%><script language=JavaScript><%=Act%></script><%
	
	End Select
	
End Sub
%>