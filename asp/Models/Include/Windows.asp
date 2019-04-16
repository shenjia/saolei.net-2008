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

	// alert('screen.height: '+screen.height+'\n'+'screen.width: '+screen.width+'\n'+'body.clientHeight: '+parent.document.body.clientHeight+'\n'+'body.clientWidth: '+parent.document.body.clientWidth)

	//原代码
	// parent.document.getElementById('Window_Box').style.top=parent.document.body.scrollTop+(screen.height-theHeight-168)/2;
	// parent.document.getElementById('Window_Box').style.left=(screen.width-theWidth)/2;

	//修改后代码
	clientHeight=parent.document.body.clientHeight<1000?window.parent.document.body.clientHeight:1000;
	clientWidth=parent.document.body.clientWidth;
	parent.document.getElementById('Window_Box').style.top=parent.document.body.scrollTop+(clientHeight-theHeight-100)/2;
	parent.document.getElementById('Window_Box').style.left=(clientWidth-theWidth)/2;
	if(parseInt(parent.document.getElementById('Window_Box').style.top)<0){
		parent.document.getElementById('Window_Box').style.top=0;
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
</script>