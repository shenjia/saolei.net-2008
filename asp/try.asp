<%
Dim Rank(28)
Dim num(28)
Dim Ranks(28)
Dim player
Dim RankNum
Dim Seed
Dim id  
%>
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
<!DOCTYPEHTMLPUBLIC"-//W3C//DTDHTML4.01Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=GB2312">
<META HTTP-EQUIV="imagetoolbar" CONTENT="no"> 
<link href="/Models/CSS/c.css" rel="stylesheet" type="text/css" />
<title>扫雷网新排行规则调查！</title>
	</head>
	<body onLoad="frm.id.focus()">
    <%

	randomize
	'u=CINt(rnd()*27)+1
	'l=CINt(rnd()*27)+1
	'r=CINt(rnd()*27)+1
	'b=CINt(rnd()*27)+1
	
	if request("id")="" Then
		id=1
	else
		id=CLng(request("id"))
	end if
	Call Start_Conn()

	Set cmd = Server.CreateObject("ADODB.Command")
	Set cmd.ActiveConnection = Conn
	cmd.CommandText = "dbo.Player_Rank_New"
	cmd.CommandType = &H0004
	
	cmd.Parameters.Append cmd.CreateParameter("@Player_Id",3)
	cmd.Parameters.Append cmd.CreateParameter("@Player_Name_Chinese",200,2,12)
	cmd.Parameters.Append cmd.CreateParameter("@Player_Rank",3,2)
	cmd.Parameters.Append cmd.CreateParameter("@Player_Rank_Beg",3,2)
	cmd.Parameters.Append cmd.CreateParameter("@Player_Rank_Int",3,2)
	cmd.Parameters.Append cmd.CreateParameter("@Player_Rank_Exp",3,2)
	cmd.Parameters.Append cmd.CreateParameter("@Player_Image",3,2)
	cmd.Parameters.Append cmd.CreateParameter("@Player_Total",3,2)
	
	cmd("@Player_Id") = id
	
	cmd.execute
	
	Player_Name_Chinese = cmd("@Player_Name_Chinese")
	Player_Rank = cmd("@Player_Rank")
	Player_Rank_Beg = cmd("@Player_Rank_Beg")
	Player_Rank_Int = cmd("@Player_Rank_Int")
	Player_Rank_Exp = cmd("@Player_Rank_Exp")
	Player_Image = cmd("@Player_Image")
	Player_Total = cmd("@Player_Total")
	
	Call End_Conn()	
	
	player=Player_Total
	
	Call start()
	%>
    <div style="display:none">
    Player_Rank:<%=Player_Rank%><br>
    Player_Rank_Beg:<%=Player_Rank_Beg%><br>
    Player_Rank_Int:<%=Player_Rank_Int%><br>
    Player_Rank_Exp:<%=Player_Rank_Exp%><br>
    </div>
    <div id="list">
    <form name="frm" action="try.asp" method="get">
    输入你的扫雷网ID
    <input name="id" value="">
    <input type="submit" value="提交">
    </form>
    <table cellpadding="0" cellspacing="0">
    <%
	if player>3 then
	Total = Ranknum+3
	else
	Total = player
	End if
	
	for i=1 to Total
		If i<=3 then
		%>
			<tr>
				<td><%=i%></td>
				<td><%Call show(i)%></td>
				<td><font color="#FFFF00">TOP <%=i%></font></td>
				<td>(1人)</td>
				<td>占<%=formatnumber(1/player*100,2)%>%</td>
			</tr>
		<%
		Else
		%>
			<tr>
				<td><%=i%></td>
				<td><%Call show(Rank(i-3))%></td>
				<td><font color="#FFFF00">TOP <%=ranks(i-3)%></font></td>
				<td>(<%=num(i-3)%>人)</td>
				<td>占<%=formatnumber(num(i-3)/player*100,2)%>%</td>
			</tr>
		<%End If%>
    <%next%>
    </table>
    </div>
    <%
	if IsNumeric(Player_rank) and Player_Rank>0 then
	u=getRank(Player_Rank)
	l=getRank(Player_Rank_Beg)
	r=getRank(Player_Rank_Int)
	b=getRank(Player_Rank_Exp)
	%>
    <div style="display:none">
    u=<%=u%><br>
    l=<%=l%><br>
    r=<%=r%><br>
    b=<%=b%><br>
    </div>
    <ul id="nt">
        <li id="photo">
			<%
			If Player_Image Then
				%><img src="/Models/Images/Player/<%=id%>.jpg" border="1" align="absmiddle" style="border-color:#999999;"><%
			Else
				%><img src="/Models/Images/Player/No.jpg" border="1" align="absmiddle" style="border-color:#999999; cursor:pointer"><%
			End If
			%></li>
        <li id="name"><font color="#FFFF00"><%=Player_Name_Chinese%></font>(Id:<%=id%>)</li>
        <li id="up">排行:<%Call shows(u)%></li>
        <li>
            <ul id="middle">
                <li id="left">初级:<br><%Call shows(l)%></li>
                <li id="map">
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td id="btl"><img src="/Models/Images/Common/tl.gif" width="<%=pix(l)%>px"; height="<%=pix(u)%>px"/></td>
                            <td id="btr"><img src="/Models/Images/Common/tr.gif" width="<%=pix(r)%>px"; height="<%=pix(u)%>px"/></td>
                        </tr>
                        <tr>
                            <td id="bbl"><img src="/Models/Images/Common/bl.gif" width="<%=pix(l)%>px"; height="<%=pix(b)%>px"/></td>
                            <td id="bbr"><img src="/Models/Images/Common/br.gif" width="<%=pix(r)%>px"; height="<%=pix(b)%>px"/></td>
                        </tr>
                    </table>
                </li>
                <li id="right">中级:<br><%Call shows(r)%></li>
            </ul>
        </li>
        <li id="bottom">高级:<%Call shows(b)%></li>
    </ul>
        喜欢这种新形式吗？<br>
        或者有更好的建议？<br>
        欢迎在QQ群内讨论！<br>
    <%else%>
    对不起，id为<%=id%>的用户还没有加入排行！
    <%end if%>
    
<iframe name="Action" width="0" height="0" style="display: none"></iframe>
	</body>
	</html>
    <%	
	Sub Start()
		
	If Player>3 Then
		dd=25
		
		for dd=25 to 1 step-1
			for d=1.01 to 2 step 0.01
				if d*d*(1-d^dd)/(1-d)>= player then exit for
			next
			if d>1.2 then exit for
		next
		
		Seed=d-0.01
		RankNum=dd-1
		total=3
		If RankNum>5 Then
		j=Seed^3
		Else
		j=Seed
		End If
		for i=1 to RankNum
			num(i)=Cint(j)
			total=total+num(i)
			ranks(i)=total			
			j=j*Seed
		next
		ranks(0)=3
		ranks(RankNum)=Player
		num(RankNum)=Player-ranks(RankNum-1)
	Else
		Seed=1.01
		RankNum=0
	End If	
	Call setRank(RankNum)
		
	
		
	End Sub
	
	Sub show(i)
		Select Case i
			Case "1"
				%><span class='o'><img src='/Models/Images/Common/n1.png'/></span><%
			Case "2"
				%><span class='o'><img src='/Models/Images/Common/n2.png'/></span><%
			Case "3"
				%><span class='o'><img src='/Models/Images/Common/n3.png'/></span><%
			Case "SSS+"
				%><span class='sss sup'>SSS<sup class='p'>+</sup></span><%
			Case "SSS"
				%><span class='sss o'>SSS</span><%
			Case "SSS-"
				%><span class='sss sub'>SSS<sup>-</sup></span><%
			Case "SS+"
				%><span class='ss sup'>SS<sup class='p'>+</sup></span><%
			Case "SS"
				%><span class='ss o'>SS</span><%
			Case "SS-"
				%><span class='ss sub'>SS<sup>-</sup></span><%
			Case "S+"
				%><span class='s sup'>S<sup class='p'>+</sup></span><%
			Case "S"
				%><span class='s o'>S</span><%
			Case "S-"
				%><span class='s sub'>S<sup>-</sup></span><%
			Case "A+"
				%><span class='a sup'>A<sup class='p'>+</sup></span><%
			Case "A"
				%><span class='a o'>A</span><%
			Case "A-"
				%><span class='a sub'>A<sup>-</sup></span><%
			Case "B+"
				%><span class='b sup'>B<sup class='p'>+</sup></span><%
			Case "B"
				%><span class='b o'>B</span><%
			Case "B-"
				%><span class='b sub'>B<sup>-</sup></span><%
			Case "C+"
				%><span class='c sup'>C<sup class='p'>+</sup></span><%
			Case "C"
				%><span class='c o'>C</span><%
			Case "C-"
				%><span class='c sub'>C<sup>-</sup></span><%
			Case "D+"
				%><span class='d sup'>D<sup class='p'>+</sup></span><%
			Case "D"
				%><span class='d o'>D</span><%
			Case "D-"
				%><span class='d sub'>D<sup>-</sup></span><%
			Case "E+"
				%><span class='e sup'>E<sup class='p'>+</sup></span><%
			Case "E"
				%><span class='e o'>E</span><%
			Case "E-"
				%><span class='e sub'>E<sup>-</sup></span><%
			Case "F"
				%><span class='f o'>F</span><%
		End Select
	End Sub
	
	Function pix(i)
		pix=30-26*(i/RankNum)
	End Function
	
	Sub setRank(i)
	
		Select Case i
			Case 1
				Rank(1)="E"
			Case 2,3
				Rank(1)="E+"
				Rank(2)="E"
				Rank(3)="E-"
			Case 4
				Rank(1)="D"
				Rank(2)="E+"
				Rank(3)="E"
				Rank(4)="E-"
			Case 5,6
				Rank(1)="D+"
				Rank(2)="D"
				Rank(3)="D-"
				Rank(4)="E+"
				Rank(5)="E"
				Rank(6)="E-"
			Case 7
				Rank(1)="C"
				Rank(2)="D+"
				Rank(3)="D"
				Rank(4)="D-"
				Rank(5)="E+"
				Rank(6)="E"
				Rank(7)="E-"
			Case 8,9
				Rank(1)="C+"
				Rank(2)="C"
				Rank(3)="C-"
				Rank(4)="D+"
				Rank(5)="D"
				Rank(6)="D-"
				Rank(7)="E+"
				Rank(8)="E"
				Rank(9)="E-"
			Case 10
				Rank(1)="B"
				Rank(2)="C+"
				Rank(3)="C"
				Rank(4)="C-"
				Rank(5)="D+"
				Rank(6)="D"
				Rank(7)="D-"
				Rank(8)="E+"
				Rank(9)="E"
				Rank(10)="E-"
			Case 11,12
				Rank(1)="B+"
				Rank(2)="B"
				Rank(3)="B-"
				Rank(4)="C+"
				Rank(5)="C"
				Rank(6)="C-"
				Rank(7)="D+"
				Rank(8)="D"
				Rank(9)="D-"
				Rank(10)="E+"
				Rank(11)="E"
				Rank(12)="E-"
			Case 13
				Rank(1)="A"
				Rank(2)="B+"
				Rank(3)="B"
				Rank(4)="B-"
				Rank(5)="C+"
				Rank(6)="C"
				Rank(7)="C-"
				Rank(8)="D+"
				Rank(9)="D"
				Rank(10)="D-"
				Rank(11)="E+"
				Rank(12)="E"
				Rank(13)="E-"
			Case 14,15
				Rank(1)="A+"
				Rank(2)="A"
				Rank(3)="A-"
				Rank(4)="B+"
				Rank(5)="B"
				Rank(6)="B-"
				Rank(7)="C+"
				Rank(8)="C"
				Rank(9)="C-"
				Rank(10)="D+"
				Rank(11)="D"
				Rank(12)="D-"
				Rank(13)="E+"
				Rank(14)="E"
				Rank(15)="E-"
			Case 16
				Rank(1)="S"
				Rank(2)="A+"
				Rank(3)="A"
				Rank(4)="A-"
				Rank(5)="B+"
				Rank(6)="B"
				Rank(7)="B-"
				Rank(8)="C+"
				Rank(9)="C"
				Rank(10)="C-"
				Rank(11)="D+"
				Rank(12)="D"
				Rank(13)="D-"
				Rank(14)="E+"
				Rank(15)="E"
				Rank(16)="E-"
			Case 17,18
				Rank(1)="S+"
				Rank(2)="S"
				Rank(3)="S-"
				Rank(4)="A+"
				Rank(5)="A"
				Rank(6)="A-"
				Rank(7)="B+"
				Rank(8)="B"
				Rank(9)="B-"
				Rank(10)="C+"
				Rank(11)="C"
				Rank(12)="C-"
				Rank(13)="D+"
				Rank(14)="D"
				Rank(15)="D-"
				Rank(16)="E+"
				Rank(17)="E"
				Rank(18)="E-"
			Case 19
				Rank(1)="SS"
				Rank(2)="S+"
				Rank(3)="S"
				Rank(4)="S-"
				Rank(5)="A+"
				Rank(6)="A"
				Rank(7)="A-"
				Rank(8)="B+"
				Rank(9)="B"
				Rank(10)="B-"
				Rank(11)="C+"
				Rank(12)="C"
				Rank(13)="C-"
				Rank(14)="D+"
				Rank(15)="D"
				Rank(16)="D-"
				Rank(17)="E+"
				Rank(18)="E"
				Rank(19)="E-"
			Case 19
				Rank(1)="SS"
				Rank(2)="S+"
				Rank(3)="S"
				Rank(4)="S-"
				Rank(5)="A+"
				Rank(6)="A"
				Rank(7)="A-"
				Rank(8)="B+"
				Rank(9)="B"
				Rank(10)="B-"
				Rank(11)="C+"
				Rank(12)="C"
				Rank(13)="C-"
				Rank(14)="D+"
				Rank(15)="D"
				Rank(16)="D-"
				Rank(17)="E+"
				Rank(18)="E"
				Rank(19)="E-"
			Case 20,21
				Rank(1)="SS+"
				Rank(2)="SS"
				Rank(3)="SS-"
				Rank(4)="S+"
				Rank(5)="S"
				Rank(6)="S-"
				Rank(7)="A+"
				Rank(8)="A"
				Rank(9)="A-"
				Rank(10)="B+"
				Rank(11)="B"
				Rank(12)="B-"
				Rank(13)="C+"
				Rank(14)="C"
				Rank(15)="C-"
				Rank(16)="D+"
				Rank(17)="D"
				Rank(18)="D-"
				Rank(19)="E+"
				Rank(20)="E"
				Rank(21)="E-"
			Case 22
				Rank(1)="SSS"
				Rank(2)="SS+"
				Rank(3)="SS"
				Rank(4)="SS-"
				Rank(5)="S+"
				Rank(6)="S"
				Rank(7)="S-"
				Rank(8)="A+"
				Rank(9)="A"
				Rank(10)="A-"
				Rank(11)="B+"
				Rank(12)="B"
				Rank(13)="B-"
				Rank(14)="C+"
				Rank(15)="C"
				Rank(16)="C-"
				Rank(17)="D+"
				Rank(18)="D"
				Rank(19)="D-"
				Rank(20)="E+"
				Rank(21)="E"
				Rank(22)="E-"
			Case 22
				Rank(1)="SSS+"
				Rank(2)="SSS"
				Rank(3)="SSS-"
				Rank(4)="SS+"
				Rank(5)="SS"
				Rank(6)="SS-"
				Rank(7)="S+"
				Rank(8)="S"
				Rank(9)="S-"
				Rank(10)="A+"
				Rank(11)="A"
				Rank(12)="A-"
				Rank(13)="B+"
				Rank(14)="B"
				Rank(15)="B-"
				Rank(16)="C+"
				Rank(17)="C"
				Rank(18)="C-"
				Rank(19)="D+"
				Rank(20)="D"
				Rank(21)="D-"
				Rank(22)="E+"
				Rank(23)="E"
				Rank(24)="E-"
			
			Case Else
				Rank(1)="SSS+"
				Rank(2)="SSS"
				Rank(3)="SSS-"
				Rank(4)="SS+"
				Rank(5)="SS"
				Rank(6)="SS-"
				Rank(7)="S+"
				Rank(8)="S"
				Rank(9)="S-"
				Rank(10)="A+"
				Rank(11)="A"
				Rank(12)="A-"
				Rank(13)="B+"
				Rank(14)="B"
				Rank(15)="B-"
				Rank(16)="C+"
				Rank(17)="C"
				Rank(18)="C-"
				Rank(19)="D+"
				Rank(20)="D"
				Rank(21)="D-"
				Rank(22)="E+"
				Rank(23)="E"
				Rank(24)="E-"
	
		End Select
	
	End Sub
	
	Function getRank(r)
		if r<4 then
			getRank=r
		else
			for i=4 to RankNum
				if ranks(i-3)>=r then
					getRank=i
					exit for
				end if
			next
		end if
	End Function
	
	Sub shows(rr)
		if rr<4 then
			call show(rr)
		else
			call show(rank(rr-3))
		end if
	End Sub
	%>
