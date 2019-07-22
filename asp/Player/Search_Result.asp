<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-31
'------------------------
%>
<!--#include virtual="/Player/Check.asp"-->
<!--#include virtual="/Models/Common/Const.asp"-->
<!--#include virtual="/Models/Common/Function.asp"-->
<%
Call Check_Master()
Call Get_Input()
Call Check_Input()

If Message = "No" And Check_Result <> "Fail" Then
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
		background-color: #444444;
	}
	-->
	</style>
	<link href="/Models/Css/2008.css" rel="stylesheet" type="text/css">
	<!--#include virtual="/Models/Include/Windows.asp"-->
	</head>
	<body onload="Window_Load();" onMousemove="move()" topmargin=0 leftmargin=0 scroll=no>
	<table id="Window_Table" border="0" cellspacing="1" cellpadding="0" bgcolor="#999999">
      <tr>
        <td bgcolor="#444444"><table width="420" border="0" cellspacing="0" cellpadding="0">
            <tr bgcolor="#555555">
              <td height="25" class="Highest" onmousedown="down=true;divtop=event.clientY;divleft=event.clientX;" onmouseup="down=false" onmouseout="down=false">　查找用户结果</td>
              <td width="20" height="25" align="center" class="Bold" onMouseOver="this.className='Signest';" onMouseOut="this.className='Bold';" style="cursor:pointer; " onClick="Cancel();">×</td>
            </tr>
          </table>
            <table width="420" border="0" cellspacing="10" cellpadding="0">
              <tr>
                <td valign="middle" class="Text"><table width="400" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="260" valign="top">
					  <div id="List" style="display:yes ">
                          <iframe name="List_Frame" frameborder="0" width="400" height="260" scrolling="no" src="/Player/Search_Result_List.asp?Page=1"></iframe>
                      </div></td>
                    </tr>
                </table></td>
              </tr>
          </table></td>
      </tr>
    </table>
	</body>
	</html>
	<iframe name="Action" style="display: yes"></iframe>
	<script language="javascript">
	function KeyDown()
	{ 
		var keyCode;
		try{ 
			   keyCode=event.keyCode;
		 } 
		 catch(a){
			   keyCode=KeyDown.arguments[0].keyCode; 
		 } 
		switch(keyCode)
		{
			case 27:
			Cancel();      
			break;
		}
	}		
	document.onkeydown=KeyDown; 
	document.onkeypress=KeyDown;

	function Cancel()
	{
			top.End_Mask();
			top.Window_Box.style.display='none';
	}
	</script>
	<%
End If

Sub Get_Input()

	Session("By") = Request.form("By")
	Session("Search_Player_Id") = Request.form("Player_Id")
	Session("Search_Player_Name") = Request.form("Player_Name")
	Session("Search_Player_Name_Chinese") = Request.form("Player_Name_Chinese")
	Session("Search_Player_Name_English") = Request.form("Player_Name_English")
	Session("Search_Player_Name_Net") = Request.form("Player_Name_Net")
	Session("Search_Player_QQ") = Request.form("Player_QQ")
	Session("Search_Player_Email") = Request.form("Player_Email")
	Session("Search_Player_Text") = Request.form("Player_Text")
	Session("Search_Player_Area") = Request.form("Player_Area")
	Session("Search_Player_Group") = Request.form("Player_Group")
	Session("Search_Player_IP") = Request.form("Player_IP")
	
End Sub

Sub Check_Input()
	
	Message = "No"
	
	If Session("Search_Player_Text") <> "" And Check_Str(Session("Search_Player_Text")) Then Message = "您在[录象标识文字]中输入了非法字符!"
	If Session("Search_Player_Email") <> "" And Check_Str(Session("Search_Player_Email")) Then Message = "您在[电子邮箱]中输入了非法字符!"
	If Session("Search_Player_QQ") <> "" And Check_Express(Session("Search_Player_QQ"),"\d{5,12}") Then Message = "您输入的[QQ号码]不合法!"
	If Session("Search_Player_Name_Net") <> "" And Check_Str(Session("Search_Player_Name_Net")) Then Message = "您在[网名]中输入了非法字符!"
	If Session("Search_Player_Name_English") <> "" And Check_Express(Session("Search_Player_Name_English"),"^(\w|\s){1,20}$") Then Message = "您输入的[姓名拼音]不合法!"
	If Session("Search_Player_Name_Chinese") <> "" And Check_Express(Session("Search_Player_Name_Chinese"),"^([\u4E00-\u9FA5]{1,12})$") Then Message = "您输入的[中文姓名]不合法!"
	If Session("Search_Player_Name") <> "" And Check_Express(Session("Search_Player_Name"),"^\w{1,12}$") Then Message = "您输入的[登陆名称]不合法!"
	If Session("Search_Player_Id") <> "" And Check_Express(Session("Search_Player_Id"),"\d{1,6}") Then Message = "您输入的[用户ID]不合法!"
	If Session("Search_Player_IP") <> "" And Check_Express(Session("Search_Player_IP"),"[01234567890.]+") Then Message = "您输入的[登陆IP地址]不合法!"
	If Message <> "No" Then
		Act="Back"
		Call Error()
	End If

	
End Sub
%>