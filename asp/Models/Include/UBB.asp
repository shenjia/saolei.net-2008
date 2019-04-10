<%
'------------------------
'Code:Zhang Shen Jia
'Date:2008-1-1
'------------------------
Function UBB(Text)

	Text = Replace(Text,"[Title]","<span class=Title>")
	Text = Replace(Text,"[/Title]","</span>")
	Text = Replace(Text,"[Sign]","<span class=Sign>")
	Text = Replace(Text,"[/Sign]","</span>")
	Text = Replace(Text,"[Signest]","<span class=Signest>")
	Text = Replace(Text,"[/Signest]","</span>")
	Text = Replace(Text,"[img]","<img align=""top"" src=""")
	Text = Replace(Text,"[/img]",""">")
	Text = Replace(Text,"[url&nbsp;","<a href=")
	Text = Replace(Text,"/]"," class=Sign target=_blank>")
	Text = Replace(Text,"[/url]","</a>")
	Text = Replace(Text,"[face]","<img src=""/Models/Images/Face/")
	Text = Replace(Text,"[/face]",".gif"">")
	Text = Replace(Text,"[1]","<img src=""/Models/Images/Mine/1.gif"">")
	Text = Replace(Text,"[2]","<img src=""/Models/Images/Mine/2.gif"">")
	Text = Replace(Text,"[3]","<img src=""/Models/Images/Mine/3.gif"">")
	Text = Replace(Text,"[4]","<img src=""/Models/Images/Mine/4.gif"">")
	Text = Replace(Text,"[5]","<img src=""/Models/Images/Mine/5.gif"">")
	Text = Replace(Text,"[6]","<img src=""/Models/Images/Mine/6.gif"">")
	Text = Replace(Text,"[7]","<img src=""/Models/Images/Mine/7.gif"">")
	Text = Replace(Text,"[8]","<img src=""/Models/Images/Mine/8.gif"">")
	Text = Replace(Text,"[&nbsp;]","<img src=""/Models/Images/Mine/Blank.gif"">")
	Text = Replace(Text,"[.]","<img src=""/Models/Images/Mine/Black.gif"">")
	Text = Replace(Text,"[Q]","<img src=""/Models/Images/Mine/Block.gif"">")
	Text = Replace(Text,"[!]","<img src=""/Models/Images/Mine/Flag.gif"">")
	Text = Replace(Text,"[?]","<img src=""/Models/Images/Mine/Mark.gif"">")
	Text = Replace(Text,"[-]","<img src=""/Models/Images/Mine/Num.gif"">")
	Text = Replace(Text,"[+]","<img src=""/Models/Images/Mine/IsMine.gif"">")
	Text = Replace(Text,"[*]","<img src=""/Models/Images/Mine/Mine.gif"">")
	Text = Replace(Text,vbTab,"&nbsp;&nbsp;&nbsp;&nbsp;")
	Text = Replace(Text,vbcrlf,"<br>")
	
	UBB = Text

End Function
%>