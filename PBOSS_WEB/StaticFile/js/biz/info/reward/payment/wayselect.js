//elCell - ��Ԫ�����(JQ),oRecord - ����Դ,oData - ԭ����,oColumnSet - ��ʾ�ж��� 
//@@����һ��Ҫ��ʹ��֮ǰ
var fmtLink = function(elCell, oRecord, oData,oColumnSet) {
	var rtn = oData;
	var o = oRecord.wayid;
	if(oColumnSet.key=="wayid"){
	    //rtn = "<a href=\"javascript:doLoadEmployee('"+ o +"')\"><font color=\"#0000FF\">�鿴</font></a>" ;
		rtn = "<a href=\"#\"><font color=\"#0000FF\">"+o+"</font></a>" ;
		elCell.bind('click',oRecord,function(event){
			var a = new Array(2);
			a[0] =event.data.wayid; 
			a[1] =event.data.cityid;
			window.returnValue = a[0]; 
			window.close();
		});
	}
	return rtn;
}

//function selectCode(code,name) {
//   var a = new Array(2);
//    a[0] =code; 
//    a[1] =name;
//    	    
//    window.returnValue = a[0]; 
//	window.close();
//}

//���ò�ѯ
var doQuery = function() {
	$("#showTbl").queryTable(optin);
};
//ҳ���ʼ�����ʱ����
$(document).ready(function() {	
	//f_showMenu(4,2,0);
	$("#btnQuery").click(doQuery);
	$('#btnQuery').attr("disabled",false);
	$("#showTbl").queryTable(optin);
});