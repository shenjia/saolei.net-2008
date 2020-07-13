<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-12
'------------------------
Function Title(Score,Sex)
	
	If Score = 999.99 Then Title = "布衣"
	If Score >= 100 And Score < 999.99 Then Title = "童生"
	If Score >= 90 And Score < 100 Then Title = "书生"
	If Score >= 80 And Score < 90 Then Title = "秀才"
	If Score >= 70 And Score < 80 Then Title = "举人"
	If Score >= 66 And Score < 70 Then Title = "进士"
	If Score >= 63 And Score < 66 Then Title = "探花"
	If Score >= 61 And Score < 63 Then Title = "榜眼"
	If Score >= 60 And Score < 61 Then Title = "状元"
	If Score >= 50 And Score < 60 And Sex = 1 Then Title = "雷神"
	If Score >= 50 And Score < 60 And Sex = 0 Then Title = "雷仙"
	If Score < 50 Then Title = "雷圣"
	
End Function
%>