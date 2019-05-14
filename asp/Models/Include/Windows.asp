<%
'------------------------
'Code:Zhang Shen Jia
'Date:2008-1-1 
'------------------------
%>
<script language="javascript">
function Window_Load()
{
	parent.document.getElementById('Window_Box').style.display='block';
	parent.document.getElementById('Window_Box').width='';
	parent.Start_Mask();
	theWidth = document.getElementById('Window_Table').clientWidth;
	theHeight = document.getElementById('Window_Table').clientHeight;
	parent.document.getElementById('Window_Frame').width=theWidth;
	parent.document.getElementById('Window_Frame').height=theHeight;
	parent.document.getElementById('Window_Box').width=theWidth;
	parent.document.getElementById('Window_Box').height=theHeight;

	//修改后代码
	clientHeight=parent.document.body.clientHeight<1000?window.parent.document.body.clientHeight:1000;
	clientWidth=parent.document.body.clientWidth;
	parent.document.getElementById('Window_Box').style.top=parent.document.body.scrollTop+(clientHeight-theHeight-100)/2;
	parent.document.getElementById('Window_Box').style.left=(clientWidth-theWidth)/2;
	//防止弹窗top与left属性为负数
	if(parseInt(parent.document.getElementById('Window_Box').style.top)<0){
		parent.document.getElementById('Window_Box').style.top=0;
	}
	if(parseInt(parent.document.getElementById('Window_Box').style.left)<0){
		parent.document.getElementById('Window_Box').style.left=0;
	}
}
var over=false,down=false,divleft,divtop;
function move(){
	if(down){
	var isIE=document.all? true:false;
	if(isIE){X=event.clientX;Y=event.clientY;}
	else{X=this.pageX;Y=this.pageY;}
	parent.document.getElementById('Window_Box').style.left=(parseInt(parent.document.getElementById('Window_Box').style.left)-divleft+X)+"px";
	parent.document.getElementById('Window_Box').style.top=(parseInt(parent.document.getElementById('Window_Box').style.top)-divtop+Y)+"px";
	}
}
parent.window.onresize = function () {
	parent.resizeMask();
	if(parent.document.getElementById('Window_Box').style.display=='block'&&parent.document.getElementById('Window_Frame').style.display!='none'){
		console.log('Window_Box');
		resize_iframe();
	}
	if(parent.document.getElementById('Window_Video').style.display=='block'){
		console.log('Window_Video');
    	parent.document.getElementById('Window_Video').contentWindow.resize_iframe();
	}
}
function resize_iframe(){
	theWidth = parent.document.getElementById('Window_Frame').width=theWidth;
	theHeight = parent.document.getElementById('Window_Frame').height=theHeight;

	//修改后代码
	clientHeight=parent.document.body.clientHeight<1000?window.parent.document.body.clientHeight:1000;
	clientWidth=parent.document.body.clientWidth;
	parent.document.getElementById('Window_Box').style.top=parent.document.body.scrollTop+(clientHeight-theHeight-100)/2;
	parent.document.getElementById('Window_Box').style.left=(clientWidth-theWidth)/2;
	//防止弹窗top与left属性为负数
	if(parseInt(parent.document.getElementById('Window_Box').style.top)<0){
		parent.document.getElementById('Window_Box').style.top=0;
	}
	if(parseInt(parent.document.getElementById('Window_Box').style.left)<0){
		parent.document.getElementById('Window_Box').style.left=0;
	}
}
</script>