<%
'------------------------
'Code:Zhang Shen Jia
'Date:2007-12-13
'------------------------
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
<link href="/Models/Css/2008.css?v=20220423" rel="stylesheet" type="text/css">
<!--#include virtual="/Models/Include/Windows.asp"-->
</head>
<body onload="Window_Load();" onMousemove="move()" topmargin=0 leftmargin=0 scroll=no>
<table id="Window_Table" border="0" cellspacing="1" cellpadding="0" bgcolor="#999999">
    <tr>
        <td bgcolor="#444444">
            <table width="560" border="0" cellspacing="0" cellpadding="0">
                <tr bgcolor="#555555">
                    <td height="25" class="Highest" onmousedown="down=true;divtop=event.clientY;divleft=event.clientX;" onmouseup="down=false" onmouseout="down=false">����μ�������</td>
                    <td width="20" height="25" align="center" class="Bold" onMouseOver="this.className='Signest';" onMouseOut="this.className='Bold';" style="cursor:pointer; " onClick="Cancel();">��</td>
            </tr>
            </table>
            <table width="560" border="0" cellspacing="10" cellpadding="0">
                <tr>
                  <td colspan="2" class="Text">                   <p class="Text"><span class="Title">���ز���װɨ�����<br>
                  </span>���������� <a href="/Download/Index.asp" target="_blank" class="Sign">Minesweeper Arbiter</a> �������ΪӢ�İ棬����˵��<a href="/BBS/Title.asp?Id=11038" target="_blank" class="Sign"> �������</a>��<br>
�����غ��ѹ����������Ϸ������������⣬<a href="/BBS" class="Sign">�뵽��̳����</a>��<br>
<span class="Title">����¼���ʶ����<br>
</span> ��������Ϸ�� <span class="Highest">F5</span> �� �ɽ������ý��档<br>
���� <span class="Sign">Show Player Identification Text</span> ѡ������������������¼���ʶ���֡�<br>
<span class="High">��¼���ʶ����ֻ��ʹ��Ӣ��</span>���Ƽ�ʹ������ƴ�����ӵ���ƴ�������磺<span class="Signest">Wang Wei (Shan Xi)</span> �� <br>
�������ע��ʱ���������¼���ʶ���֣��������Ա��ϵ����һ�θ��ġ�<br>
����������ٴθ���¼���ʶ���֣�����������еĳɼ���<br>
<span class="Title">����ɨ��¼��</span><br>
��ÿ��ͻ�Ƽ�¼������Ὣ¼���Զ����������Ŀ¼�¡�<br>
<span class="Title">�鿴¼������</span><br>
���ڲ���¼��ʱ���������Ϸ����Ϸ�������Աߵ�ͳ�ƴ��ڻ���ʾ¼��ĸ������ݡ�<br>
��������Ҫ���� <span class="Signest">3BV</span> �� <span class="Signest"> Time </span>�������ϴ�¼��ʱ������д�����ݡ�<br>
<span class="Title">�ϴ�ɨ��¼��</span><br>
����½�й�ɨ����������������� <span class="Sign">�ϴ�¼��</span> ��<br>
 ��ѡ��¼�񼶱����������Ϸ��ʱ��(��ȷ��2λС��)��3BVֵ��ѡ��¼���ļ�����ʼ�ϴ���<span class="High"></span><span class="High"><br>
</span>������˺��¼�񽫼������ɨ�׳ɼ���ϵͳ���Զ�ȡ����������ʱ������3BV/S��Ϊ��¼���档<br>
<span class="High"> ������/��/�����������ʱ���3BV/S�ɼ����м�¼��ϵͳ�Զ������������ɨ�����С�</span><br>
                  </p>
                  </td>
                </tr>
                <tr>
                  <td width="277" class="Text">
                        <table width="180" height="30" border="0" align="right" cellpadding="0" cellspacing="1" style="cursor:pointer; " onClick="Cancel();">
                            <tr>
                                <td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">��������ô����������</td>
                            </tr>
                    </table>
                  </td>
                  <td width="253" class="Text"><table width="120" height="30" border="0" align="left" cellpadding="0" cellspacing="1" style="cursor:pointer; " onClick="top.location='/BBS/Index.asp';">
                    <tr>
                      <td align="center" bgcolor="#555555" class="High" onMouseOver="this.className='Sign';" onMouseOut="this.className='High';">������������</td>
                    </tr>
                  </table></td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</body>
</html>
<iframe name="Action" style="display: none"></iframe>
<script language="javascript">
function KeyDown(e){     
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
        parent.End_Mask();
        parent.document.getElementById('Window_Box').style.display='none';
}
</script>