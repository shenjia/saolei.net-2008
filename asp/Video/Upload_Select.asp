<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-25
'------------------------
Dim Model
%>
<!--#include virtual="/Player/Check.asp"-->
<!--#include virtual="/Models/Common/Const.asp"-->
<%
Call Check()
Call Get_Input()

If Check_Result <> "Fail" Then
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
	<link href="/Models/Css/2008.css?v=20220104" rel="stylesheet" type="text/css">
	<!--#include virtual="/Models/Include/Windows.asp"-->
	</head>
	<body onload="Window_Load();" onMousemove="move()" topmargin=0 leftmargin=0 scroll=no>
	<table id="Window_Table" border="0" cellspacing="1" cellpadding="0" bgcolor="#999999">
      <tr>
        <td bgcolor="#444444"><table width="420" border="0" cellspacing="0" cellpadding="0">
            <tr bgcolor="#555555">
              <td height="25" class="Highest" onmousedown="down=true;divtop=event.clientY;divleft=event.clientX;" onmouseup="down=false" onmouseout="down=false">　选择替换录像</td>
              <td width="20" height="25" align="center" class="Bold" onMouseOver="this.className='Signest';" onMouseOut="this.className='Bold';" style="cursor:pointer; " onClick="Cancel();">×</td>
            </tr>
          </table>
            <table width="420" border="0" cellspacing="10" cellpadding="0">
              <tr>
                <td height="30" class="Sign">因为本级别录像已满，请选择替换录像，选择的录像将在上传后被删除！</td>
              </tr>
            </table>
            <table width="420" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="1" bgcolor="#555555"></td>
              </tr>
            </table>
            <table width="420" border="0" cellspacing="10" cellpadding="0">
              <tr>
                <td valign="middle" class="Text"><table width="400" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="260" valign="top">
					  <div id="List" style="display:yes ">
                          <iframe name="List_Frame" frameborder="0" width="400" height="260" scrolling="no" src="/Video/Upload_Select_List.asp?Model=<%=Model%>&Page=1"></iframe>
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

	Model = Trim(Request("Model"))
	
End Sub
%>