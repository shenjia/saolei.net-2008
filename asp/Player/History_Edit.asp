<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-17
'------------------------
Dim History_Id
%>
<!--#include virtual="/Player/Check.asp"-->
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/ConnDB.asp"-->
<%
Call Check()
Call Get_Input()
Call Check_Input()

If Message = "No" And Check_Result <> "Fail" Then
	
	Call Start_Conn()
	
	SQL_Text = "History_Read "&History_Id
	rs.Open SQL_Text,Conn,3,1
	
	History_Time=rs("History_Time")
	History_Text=rs("History_Text")
	
	Call End_Conn()
	
	History_Year = Year(History_Time)
	History_Month = Month(History_Time)
	%>
	<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<style type="text/css">
	<!--
	body {
		margin-left: 0px;
		margin-top: 0px;
		margin-right: 0px;
		margin-bottom: 0px;
		background-color: #333333;
	}
	/**
	 * 新增div容器用以控制宽度
	 * 第一格宽度控制整列宽度
	 */
	td div{
		width: 60;
	}
	-->
	</style>
	<link href="/Models/Css/2008.css?v=20211218" rel="stylesheet" type="text/css">
	</head>
	<body onLoad="parent.document.getElementById('History').style.display='block';History_Form.History_Text.select();">
	<table width="290" border="0" cellspacing="5" cellpadding="0">
	  <form name="History_Form" action="Action/History_Edit_Action.asp" method="post" target="Action">
	  <tr>
		<td valign="top" class="Title"><div>编辑历程</div></td>
		<td colspan="4" valign="top" class="Text">重大进步、参与活动等值得纪念的事件</td>
	  </tr>
	  <tr>
		<td valign="top" class="Text">何年何月：</td>
		<td colspan="4" valign="top" class="Text">
				  <select name="History_Year" class="input-no">
				  <%
				  For Y = 1985 To Year(Now())%>
				  <option value="<%=Y%>"<%If Y = History_Year Then%>selected<%End If%>><%=Y%>年</option>
				  <%Next%>
				  </select>
				  <select name="History_Month" class="input-no">
				  <%
				  For M = 1 To 12%>
				  <option value="<%=M%>"<%If M = History_Month Then%>selected<%End If%>><%=M%>月</option>
				  <%Next%>
				  </select>
				  <input name="History_Id" type="hidden" value="<%=History_Id%>">
				  </td>
	  </tr>
	  <tr>
		<td width="60" valign="top" class="Text">此月历程：<br>      </td>
		<td colspan="4" valign="top" class="High"><textarea name="History_Text" cols="31" rows="11" wrap="VIRTUAL" class="input-no" onpropertychange="Text_Number.innerText=100-this.value.length;"><%=History_Text%></textarea><br>
	您还可输入<span id="Text_Number">100</span>字</td>
	  </tr>
	  <tr>
		<td valign="top" class="Text">&nbsp;</td>
		<td width="65" height="30" valign="top" class="High">
			<table width="60" height="20" border="0" align="left" cellpadding="0" cellspacing="0" style="cursor:pointer; " onClick="History_Form.submit();">
				<tr>
				  <td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">编辑</td>
				</tr>
			</table>
		</td>
		<td width="66" valign="top" class="High">
			<table width="60" height="20" border="0" align="left" cellpadding="0" cellspacing="0" style="cursor:pointer; " onClick="History_Form.reset();History_Form.History_Text.select();">
				<tr>
				  <td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">还原</td>
				</tr>
			</table>
		</td>
	    <td width="66" valign="top" class="High">
			<table width="60" height="20" border="0" align="left" cellpadding="0" cellspacing="0" style="cursor:pointer; " onClick="history.go(-1);">
				<tr>
				  <td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">返回</td>
				</tr>
			</table>
		</td>
	    <td width="3" valign="top" class="High">
		</td>
	  </tr>
	  </form>
	</table>
	</body>
	<iframe name="Action" style="display: none"></iframe>
	</html>
	<%
	
End If

Sub Get_Input()

	History_Id = Request("Id")

End Sub

Sub Check_Input()

	Message = "No"
	
	If History_Id = "" Then Message = "未指定[历程ID]!"

	If Message <> "No" Then
		Act="No"
		Call Error()
	End If	
	
End Sub
%>