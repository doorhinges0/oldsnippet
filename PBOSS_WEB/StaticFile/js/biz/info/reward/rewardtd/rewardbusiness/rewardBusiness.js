
function doSubmit(){// onsubmit="return doSubmit();" 
	   var month = $('#selMonth').val(); 
		if( month==null || month=='' ){
			alert("[结算月份]不能为空");
			return false;
		} 
		 
	return true;
}


//调用查询
var doQuery = function() { 
       var month = $('#selMonth').val();  
	   if( month==null || month=='' ){
			alert("[结算月份]不能为空");
			return;
		} 
		document.frmQuery.submit();
}

//页面初始化完成时调用
$(document).ready(function() { 
	$("#btnQuery").click(doQuery);
	$('#btnQuery').attr("disabled",false);
	//$("#showTbl").queryTable(optin);
	$("#btnExportExcel").click(doExportExcel)
		//生成日期下拉
	getMouthSelect($("#selMonth"),7); 
});

var doExportExcel = function(){
	sumbitExportExcel(contextRootPath+"/reward/rewardBusinessExcel.do","content");
}













