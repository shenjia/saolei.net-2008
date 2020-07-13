<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-11
'------------------------

Function CheckArray(Array, String)
  CheckArray=True
  For i=0 to ubound(Array)
    If String=Array(i) Then
      CheckArray=False
    End If
  Next
End Function

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

Function URLDecode(enStr)
   dim deStr,strSpecial
   dim c,i,v
     deStr=""
     strSpecial="!""#$%&'()*+,.-_/:;<=>?@[\]^`{|}~%"
     for i=1 to len(enStr)
       c=Mid(enStr,i,1)
       if c="%" then
         v=eval("&h"+Mid(enStr,i+1,2))
         if inStr(strSpecial,chr(v))>0 then
           deStr=deStr&chr(v)
           i=i+2
         else
           v=eval("&h"+ Mid(enStr,i+1,2) + Mid(enStr,i+4,2))
           deStr=deStr & chr(v)
           i=i+5
         end if
       else
         if c="+" then
           deStr=deStr&" "
         else
           deStr=deStr&c
         end if
       end if
     next
     URLDecode=deStr
End function
%>
