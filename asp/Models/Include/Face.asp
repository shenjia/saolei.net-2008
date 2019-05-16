<%
'------------------------
'Code:Zhang Shen Jia
'Date:2008-1-1
'------------------------
Face_Width=250
Face_Height=100
%>
<div id="Face_Box" style="position:absolute; top:322;left:302; width:<%=Face_Width+10%>px; height:<%=Face_Height+10%>px; z-index:1; display: none;">
	<div style="position:absolute;">
		<div style="position:absolute;">
		<table width="<%=Face_Width%>" height="<%=Face_Height%>" border="0" cellspacing="1" cellpadding="0" bgcolor="#DDDDDD">
		<tr>
		<td bgcolor="#444444" align="left" >
			<table width="<%=Face_Width%>" height="<%=Face_Height%>" border="0" cellspacing="1" cellpadding="0" bgcolor="#444444">
				<tr>
					<td><Img src="/Models/Images/Face/1.gif" style="cursor:pointer;" onClick="addFace(1);"></td>
					<td><Img src="/Models/Images/Face/2.gif" style="cursor:pointer;" onClick="addFace(2);"></td>
					<td><Img src="/Models/Images/Face/3.gif" style="cursor:pointer;" onClick="addFace(3);"></td>
					<td><Img src="/Models/Images/Face/4.gif" style="cursor:pointer;" onClick="addFace(4);"></td>
					<td><Img src="/Models/Images/Face/5.gif" style="cursor:pointer;" onClick="addFace(5);"></td>
					<td><Img src="/Models/Images/Face/6.gif" style="cursor:pointer;" onClick="addFace(6);"></td>
					<td><Img src="/Models/Images/Face/7.gif" style="cursor:pointer;" onClick="addFace(7);"></td>
					<td><Img src="/Models/Images/Face/8.gif" style="cursor:pointer;" onClick="addFace(8);"></td>
					<td><Img src="/Models/Images/Face/9.gif" style="cursor:pointer;" onClick="addFace(9);"></td>
					<td><Img src="/Models/Images/Face/10.gif" style="cursor:pointer;" onClick="addFace(10);"></td>
				</tr>
				<tr>
					<td><Img src="/Models/Images/Face/11.gif" style="cursor:pointer;" onClick="addFace(11);"></td>
					<td><Img src="/Models/Images/Face/12.gif" style="cursor:pointer;" onClick="addFace(12);"></td>
					<td><Img src="/Models/Images/Face/13.gif" style="cursor:pointer;" onClick="addFace(13);"></td>
					<td><Img src="/Models/Images/Face/14.gif" style="cursor:pointer;" onClick="addFace(14);"></td>
					<td><Img src="/Models/Images/Face/15.gif" style="cursor:pointer;" onClick="addFace(15);"></td>
					<td><Img src="/Models/Images/Face/16.gif" style="cursor:pointer;" onClick="addFace(16);"></td>
					<td><Img src="/Models/Images/Face/17.gif" style="cursor:pointer;" onClick="addFace(17);"></td>
					<td><Img src="/Models/Images/Face/18.gif" style="cursor:pointer;" onClick="addFace(18);"></td>
					<td><Img src="/Models/Images/Face/19.gif" style="cursor:pointer;" onClick="addFace(19);"></td>
					<td><Img src="/Models/Images/Face/20.gif" style="cursor:pointer;" onClick="addFace(20);"></td>
				</tr>
				<tr>
					<td><Img src="/Models/Images/Face/21.gif" style="cursor:pointer;" onClick="addFace(21);"></td>
					<td><Img src="/Models/Images/Face/22.gif" style="cursor:pointer;" onClick="addFace(22);"></td>
					<td><Img src="/Models/Images/Face/23.gif" style="cursor:pointer;" onClick="addFace(23);"></td>
					<td><Img src="/Models/Images/Face/24.gif" style="cursor:pointer;" onClick="addFace(24);"></td>
					<td><Img src="/Models/Images/Face/25.gif" style="cursor:pointer;" onClick="addFace(25);"></td>
					<td><Img src="/Models/Images/Face/26.gif" style="cursor:pointer;" onClick="addFace(26);"></td>
					<td><Img src="/Models/Images/Face/27.gif" style="cursor:pointer;" onClick="addFace(27);"></td>
					<td><Img src="/Models/Images/Face/28.gif" style="cursor:pointer;" onClick="addFace(28);"></td>
					<td><Img src="/Models/Images/Face/29.gif" style="cursor:pointer;" onClick="addFace(29);"></td>
					<td><Img src="/Models/Images/Face/30.gif" style="cursor:pointer;" onClick="addFace(30);"></td>
				</tr>
			</table>
		</td>
		</tr>
		</table>
		</div>
	</div>
</div>
<script language="javascript">
function Face()
{
  Hide('Mine_Box');
  ShowHide('Face_Box');
}
function addFace(I)
 {
  Hide('Face_Box');
  let end=textarea.selectionEnd;//选择内容的结束位置
  textarea.focus();//获取焦点，不然无法进行其他操作
  textarea.setSelectionRange(end,end);
  textarea.setRangeText('[face]'+I+'[/face]');
  textarea.setSelectionRange(end,end+13+I.toString().length); 
 }
function Img()
 {
  ImgLink=window.prompt('请输入图片链接,例如:http://www.saolei.net/Models/Images/Common/Logo_Chinese.gif','http://')
  if(ImgLink!=null&&ImgLink!='')//此处需要判断null和空字符串
  {
    let start=textarea.selectionStart;//选择内容的开始位置
    let end=textarea.selectionEnd;//选择内容的结束位置
    textarea.focus();//获取焦点，不然无法进行其他操作
    textarea.setSelectionRange(start,end);
    textarea.setRangeText('[img]'+ImgLink+'[/img]');
    textarea.setSelectionRange(start,end+11+ImgLink.length); 
  }
 }
function Url()
 {
  Link=window.prompt('请输入网页链接,例如:http://www.saolei.net/','http://')
  if(Link!=null&&Link!='')
  {
    let start=textarea.selectionStart;//选择内容的开始位置
    let end=textarea.selectionEnd;//选择内容的结束位置
    textarea.focus();//获取焦点，不然无法进行其他操作
    textarea.setSelectionRange(start,end);
    textarea.setRangeText('[url '+Link+'/]'+Link+'[/url]');
    textarea.setSelectionRange(start,end+13+2*Link.length);
  }
 }
</script>