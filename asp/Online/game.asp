<HTML>
<HEAD>
   <TITLE>Applet HTML Page</TITLE>
</HEAD>
<BODY onLoad = "newJVM();">
<SCRIPT language="JavaScript">
<!--
function newJVM() 
   {
    iM = document.cJVM.level.selectedIndex ;
    
    if (iM == 0) {
	document.JMine.m_col    = 20 ;
	document.JMine.m_ligne  = 20 ;
	document.JMine.m_mine   = 40 ;
    }
    if (iM == 1) {
	document.JMine.m_col    = 20 ;
	document.JMine.m_ligne  = 20 ;
	document.JMine.m_mine   = 50 ;
    }
    if (iM == 2) {
	document.JMine.m_col    = 20 ;
	document.JMine.m_ligne  = 20 ;
	document.JMine.m_mine   = 60 ;
    }
    if (iM == 3) {
	document.JMine.m_col    = 9 ;
	document.JMine.m_ligne  = 9 ;
	document.JMine.m_mine   = 10 ;
    }
    if (iM == 4) {
	document.JMine.m_col    = 16 ;
	document.JMine.m_ligne  = 16 ;
	document.JMine.m_mine   = 40 ;
    }
    if (iM == 5) {
	document.JMine.m_col    = 30 ;
	document.JMine.m_ligne  = 16 ;
	document.JMine.m_mine   = 99 ;
    }

    document.JMine.newGame( ) ;

    return ;
   }
// --></SCRIPT>
<FORM NAME="cJVM">
	<INPUT type="button" value="New Game" onClick="newJVM();">
  	<SELECT NAME="level">   
	   <OPTION VALUE="1" SELECTED>40雷
	   <OPTION VALUE="2">50雷
	   <OPTION VALUE="3">60雷
	   <OPTION VALUE="4">初级
	   <OPTION VALUE="5">中级
	   <OPTION VALUE="6">高级
	</SELECT>
</FORM>
<APPLET code="Game/SaoLei/SaoLei.class" width=775 height=446 ID="JMine" NAME="JMine">
	<param name=bImg 	value="./img/j">
	<param name=bgcolor	value=12632256>
	<param name=_nbmine 	value=20>
	<param name=_nbcol  	value=10>
	<param name=_nbligne	value=10>
	<param name=fontsize	value=16>
</APPLET>
</BODY>
</HTML>
