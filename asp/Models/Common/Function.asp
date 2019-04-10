<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-11
'------------------------
Function Check_Str(Input)

	Output = False
	If InStr(Input,Chr(34)) Then Output = True	'"
	If InStr(Input,Chr(36)) Then Output = True	'$
	If InStr(Input,Chr(38)) Then Output = True	'&
	If InStr(Input,Chr(39)) Then Output = True	''
	If InStr(Input,Chr(59)) Then Output = True	';
	If InStr(Input,Chr(94)) Then Output = True	'^
	If InStr(Input,Chr(96)) Then Output = True	'`
	If InStr(Input,"Âè") Then Output = True	
	If InStr(Input,"°Ö") Then Output = True	
	If InStr(Input,"Ò¯") Then Output = True	
	If InStr(Input,"ÄÌ") Then Output = True	
	If InStr(Input,"±Æ") Then Output = True	
	If InStr(Input,"²Ù") Then Output = True	
	Check_Str_ = Output
	
End Function

Function Check_Express(Text,Pattern)

	Set Express = New RegExp
	Express.Pattern = Pattern
	Express.IgnoreCase = False
	Express.Global = True
	Set Matches = Express.Execute(Text)
	Check_Express = True
	For Each Match in Matches
		Check_Express = False
	Next
	Set Express = Nothing

End Function

Function strLength(str)
       ON ERROR RESUME NEXT
       dim WINNT_CHINESE
       WINNT_CHINESE  = (len("ÖÐÎÄ")=2)
       if WINNT_CHINESE=true then
          dim strlen,truelen,wordasc
          dim stri
          strlen=len(str)
          truelen=strlen
          for stri=1 to strlen
             wordasc=asc(mid(str,stri,1))
             if wordasc<0 then wordasc=wordasc+65536
             if wordasc>255 then
                truelen=truelen+1
             end if
          next
          strLength=truelen
       else 
          strLength=len(str)
       end if
       if err.number<>0 then err.clear
End Function
%>
