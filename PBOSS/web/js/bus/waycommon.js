
/**
  * common business script
  * Sunrise com. ltd.
  * it's just for PBOSS page link to BOSS page 
  * '&' replace '%26' url start with '/integration.jsp?targetUrl=/reward'
  */
  var tmpContextPath = contextPath;

  function showOpnTree2(control,idCtlId,treestyle,citystyle,idName) {
	var url = tmpContextPath + "/integration.jsp?targetUrl=/reward/cms/operation.do?CMD=Selectopntree2";
	if(typeof(treestyle)!='undefined' && treestyle.length>0){
	url = url + "%26style=" + treestyle;
	}
	if(typeof(citystyle)!='undefined' && citystyle.length>0){
	url = url + "%26city=" + citystyle;
	}
	var rtn = window.showModalDialog(url, control, "dialogWidth=680px;dialogHeight=430px;status:no;scroll=yes;");
	if (rtn != null) {
		document.all(idCtlId).value = rtn[0];
		document.all(idName).value=rtn[0]+" "+rtn[1];
		return rtn;
	}
	}
	
    function showZjtyOpnTree(control,idCtlId,treestyle,idName) {
		var url = tmpContextPath + "/integration.jsp?targetUrl=/reward/cms/zjty/operation.do?CMD=SELECTOPNTREE";
		if(typeof(treestyle)!='undefined' && treestyle.length>0){
			url = url + "%26style=" + treestyle;
		}
		var rtn = window.showModalDialog(url, control, "dialogWidth=680px;dialogHeight=430px;status:no;scroll=yes;");
		if (rtn != null) {
			document.all(idCtlId).value = rtn[0];
			document.all(idName).value=rtn[0]+" "+rtn[1];
			return rtn;
		}
	}
	
	function getTree(control,idCtlId,isLeaf,treeType,idName,rootId) {
		var url = tmpContextPath + "/integration.jsp?targetUrl=/reward/cms/opntree.do?CMD=TREE";
		if(typeof(isLeaf)!='undefined' && isLeaf.length>0){
			url = url + "%26isLeaf=" + isLeaf;
		}
		if(typeof(treeType)!='undefined' && treeType.length>0){
			url = url + "%26treeType=" + treeType;
		}else{
			return;
		}
		if(typeof(rootId)!='undefined' && rootId.length>0){
			url = url + "%26rootId=" + rootId;
		}
		var rtn = window.showModalDialog(url, control, "dialogWidth=680px;dialogHeight=430px;status:no;scroll=yes;");
		if (rtn != null) {
			document.all(idCtlId).value = rtn[0];
			document.all(idName).value=rtn[0]+" "+rtn[1];
			return rtn;
		}
	}
	



function showOpnTree(control, idCtlId, opntype) {
	var url = tmpContextPath + "/integration.jsp?targetUrl=/reward/cms/operation.do?CMD=Selectopntree";
	url = url + "%26opntype=" + opntype;
	var rtn = window.showModalDialog(url, control, "dialogWidth=405px;dialogHeight=430px;status:no;scroll=yes;");
	if (rtn != null) {
		document.all(idCtlId).value = rtn;
		return rtn;
	}
}
function showOpnfifthTree(control, idCtlId, opntype) {
	var url = tmpContextPath + "/integration.jsp?targetUrl=/reward/cms/operation.do?CMD=Selectopnfifthtree";
	url = url + "%26opntype=" + opntype;
	var rtn = window.showModalDialog(url, control, "dialogWidth=405px;dialogHeight=430px;status:no;scroll=yes;");
	if (rtn != null) {
		document.all(idCtlId).value = rtn;
		return rtn;
	}
}
function showAdaTree(control, idCtlId) {
	var url = tmpContextPath + "/integration.jsp?targetUrl=/reward/cms/adimarea.do?CMD=selectadatree";
	var rtn = window.showModalDialog(url, control, "dialogWidth=405px;dialogHeight=430px;status:no;scroll=yes;");
	if (rtn != null) {
		document.all(idCtlId).value = rtn;
		return rtn;
	}
}
function showOrgTree(control, idCtlId, orgtype) {
	var url = tmpContextPath + "/integration.jsp?targetUrl=/reward/cms/way.do?CMD=Selectorgtree";
	url = url + "%26orgtype=" + orgtype;
	var rtn = window.showModalDialog(url, control, "dialogWidth=405px;dialogHeight=430px;status:no;scroll=yes;");
	if (rtn != null && rtn.length) {
		document.all(idCtlId).value = rtn[0];
		return rtn;
	} else {
		if (rtn != null) {
			document.all(idCtlId).value = rtn;
			return rtn;
		}
	}
}
function showOrgTree(control, idCtlId, orgtype, idReturn) {
	var url = tmpContextPath + "/integration.jsp?targetUrl=/reward/cms/way.do?CMD=Selectorgtree";
	url = url + "%26orgtype=" + orgtype;
	var rtn = window.showModalDialog(url, control, "dialogWidth=405px;dialogHeight=430px;status:no;scroll=yes;");
	if (rtn != null && rtn.length) {
		document.all(idCtlId).value = rtn[0];
		document.all(idReturn).value = rtn[1];
		return rtn;
	} else {
		if (rtn != null) {
			document.all(idCtlId).value = rtn;
			return rtn;
		}
	}
}
function showSelectWay2(control, showParent, showOfCitycom) {
	var url = tmpContextPath + "/integration.jsp?targetUrl=/reward/cms/way.do?CMD=selectWayTree";
  
 // url = url + "?";
	if (showParent != null) {
		url = url + "%26showParent=" + showParent;
	}
	if (showOfCitycom != null) {
		url = url + "%26showOfCitycom=" + showOfCitycom;
	}
	var rtn = window.showModalDialog(url, control, "dialogWidth=605px;dialogHeight=420px;status:no;scroll=yes;");
	if (rtn != null && rtn.length) {
		control.value = rtn[0] + " " + rtn[1];
		return rtn;
	} else {
		if (rtn != null) {
			control.value = rtn;
			return rtn;
		}
	}
}
function showSelectWay4(control, idCtlId,waytype, showParent, showOfCitycom) {
	var url = tmpContextPath + "/integration.jsp?targetUrl=/reward/cms/way.do?CMD=selectWayTree";
  
  //url = url + "?";
  //?????,by yjr 2006-12-27
  //if(showOfCitycom==null) showOfCitycom = true;	
	if (showParent != null) {
		url = url + "%26showParent=" + showParent;
	}
	if (showOfCitycom != null) {
		url = url + "%26showOfCitycom=" + showOfCitycom;
	}
	if (waytype != null) {
		url = url + "%26waytype=" + waytype;
	}
	if (control.form.menuTokenId != null && control.form.menuTokenId.value != null) {
		url += "%26menuTokenId=" + control.form.menuTokenId.value;
	}
	var rtn = window.showModalDialog(url, control, "dialogWidth=405px;dialogHeight=430px;status:no;scroll=yes;");
	if (rtn != null && rtn.length) {
		control.value = idCtlId == null ? rtn[0] : rtn[0] + " " + rtn[1];  	//name   	
		if (document.all(idCtlId) != null) {
			document.all(idCtlId).value = rtn[0];
		} //id
		return rtn;
	} else {
		if (rtn != null) {
			control.value = rtn;
			return rtn;
		}
	}
}
function showWayByCityid(control, idCtlId,cityid,waytype) {
	var url = tmpContextPath + "/integration.jsp?targetUrl=/reward/cms/way.do?CMD=selectWayTree";
	if (cityid != null) {
		url = url + "%26cityid=" + cityid;
	}
	if (waytype != null) {
		url = url + "%26waytype=" + waytype;
	}
	var rtn = window.showModalDialog(url, control, "dialogWidth=405px;dialogHeight=430px;status:no;scroll=yes;");
	if (rtn != null && rtn.length) {
		control.value = idCtlId == null ? rtn[0] : rtn[0] + " " + rtn[1];  	//name   	
		if (document.all(idCtlId) != null) {
			document.all(idCtlId).value = rtn[0];
		} //id
		return rtn;
	} else {
		if (rtn != null) {
			control.value = rtn;
			return rtn;
		}
	}
}
function showSelectWay(control, idCtlId, showParent, showOfCitycom) {
	var url = tmpContextPath + "/integration.jsp?targetUrl=/reward/cms/way.do?CMD=selectWayTree";
  
  //url = url + "?";
  //?????,by yjr 2006-12-27
  //if(showOfCitycom==null) showOfCitycom = true;	
	if (showParent != null) {
		url = url + "%26showParent=" + showParent;
	}
	if (showOfCitycom != null) {
		url = url + "%26showOfCitycom=" + showOfCitycom;
	}
	if (control.form.menuTokenId != null && control.form.menuTokenId.value != null) {
		url += "%26menuTokenId=" + control.form.menuTokenId.value;
	}
	var rtn = window.showModalDialog(url, control, "dialogWidth=405px;dialogHeight=430px;status:no;scroll=yes;");
	if (rtn != null && rtn.length) {
		control.value = idCtlId == null ? rtn[0] : rtn[0] + " " + rtn[1];  	//name   	
		if (document.all(idCtlId) != null) {
			document.all(idCtlId).value = rtn[0];
		} //id
		return rtn;
	} else {
		if (rtn != null) {
			control.value = rtn;
			return rtn;
		}
	}
}
function showSelectWay3(control, idCtlId, showParent, showOfCitycom, waytype, waysubtype,runmode) {
	var url = tmpContextPath + "/integration.jsp?targetUrl=/reward/cms/way.do?CMD=selectWayTree";
	if (showParent != null) {
		url = url + "%26showParent=" + showParent;
	}
	if (showOfCitycom != null) {
		url = url + "%26showOfCitycom=" + showOfCitycom;
	}
	if (waytype != null) {
		url = url + "%26waytype=" + waytype;
	}
	if (waysubtype != null) {
		url = url + "%26waysubtype=" + waysubtype;
	}
	if(runmode !=null){
		url = url + "%26runmode=" + runmode;
	}
	if (control.form.menuTokenId != null && control.form.menuTokenId.value != null) {
		url += "%26menuTokenId=" + control.form.menuTokenId.value;
	}
	var rtn = window.showModalDialog(url, control, "dialogWidth=405px;dialogHeight=430px;status:no;scroll=yes;");
	if (rtn != null && rtn.length) {
		control.value = idCtlId == null ? rtn[0] : rtn[0] + " " + rtn[1];  	//name   	
		if (document.all(idCtlId) != null) {
			document.all(idCtlId).value = rtn[0];
		} //id
		return rtn;
	} else {
		if (rtn != null) {
			control.value = rtn;
			return rtn;
		}
	}
}
function changeName(control, showcontrolid) {
	var controlValue = control.value;
	if(controlValue == null || controlValue == ""){
		return;
	}
	
	while(controlValue.charAt(0) == " "){
		if(controlValue == " "){
			break;
		}
		controlValue = controlValue.substring(1,controlValue.length);
	}
	
	if(controlValue.indexOf(" ") != -1){
		var valArr = controlValue.split(" ");
		control.form.all[showcontrolid].value = valArr[0];
	}else{
		control.form.all[showcontrolid].value = controlValue;
	}
}

function doNewBackList(url) {
	var url = tmpContextPath + url;
	location.href = url;
}
function showSelectWayType(idCtlId) {
	var rtn = window.showModalDialog(tmpContextPath + "/integration.jsp?targetUrl=/reward/cms/waytype.do?CMD=TREE", window, "dialogWidth=330px;dialogHeight=600px;status:no;scroll=yes;");
	rtn = (rtn == null ? "" : rtn);
	if (idCtlId != null && trim(idCtlId) != "" && document.all(idCtlId) != null) {
		document.all(idCtlId).value = rtn[0];
		rtn = rtn[0] + " " + rtn[1];
		return rtn;
	}
	return rtn[0];
}
function selectMemodeta(rptid, type) {
	var resType = type != null ? type : "";
	if (rptid == null || trim(rptid) == "") {
		alert("recid required!");
		return false;
	}
	var rtn = window.showModalDialog(tmpContextPath + "/integration.jsp?targetUrl=/reward/cms/workflowlog.do?CMD=LIST%26RECID=" + rptid + "%26resType=" + resType, "this", "Width=600;Height=300;status=no;scroll=yes;resizable=yes;");
}
function showMemoDialog() {
	var rtn = window.showModalDialog(tmpContextPath + "/integration.jsp?targetUrl=/reward/cms/workflowlog/dialog.jsp", "this", "dialogWidth:560px;dialogHeight:260px;status:no;scroll:yes;resizable:yes;");
	return (rtn == null ? "" : rtn);
}
/* submit , used in  */
function doSubmit(form, url) {
	form.action = tmpContextPath + url;
	form.submit();
}
function doWorkflow(cmdStr, memoControlId) {
	var rtn = showMemoDialog();
	if (rtn != null && rtn != "CANCEL" && rtn != "") {
		if (memoControlId != null) {
			document.getElementById(memoControlId).value = rtn;
		}
		formList.action = tmpContextPath + cmdStr;
		formList.submit();
	}
}
function doList(cmdStr) {
	formList.action = tmpContextPath + cmdStr;
	formList.submit();
}
function showDialog(goodclass, recid) {
	var url = tmpContextPath;
	if (goodclass == 2) {
		// integral
		url += "/integration.jsp?targetUrl=/reward/cms/vipcardapp.do?CMD=SHOWDIALOG%26RECID=" + recid;
	} else {
		if (goodclass == 5) {
		// sim
			url += "/integration.jsp?targetUrl=/reward/cms/simapp.do?CMD=SHOWDIALOG%26RECID=" + recid;
		} else {
		// comres
			url += "/integration.jsp?targetUrl=/reward/cms/comresapp.do?CMD=SHOWDIALOG%26RECID=" + recid;
		}
	}
	//window.showModalDialog(url, 'this' , 'dialogWidth:600px;dialogHeight:260px;status:no;scroll:yes;resizable:yes;');
	window.open(url, "this", "Width=600;Height=300;status=no;scroll=yes;resizable=yes;");
}
function selectCooperator(objectInputId) {
	var ret = "";
	var arg = new Array();
	var strUrl = tmpContextPath + "/integration.jsp?targetUrl=/reward/cms/distribute/cooperator.do?CMD=SELECTCOOPERATOR";
	var returnValue = window.showModalDialog(strUrl, arg, "dialogWidth:600px; dialogHeight:390px; status:no;resizable:yes;");
	if (returnValue != null && returnValue != "") {
		ret = returnValue;
	} else {
		if (objectInputId != null && objectInputId.value != null) {
			ret = objectInputId.value;
		}
	}
	objectInputId.value = ret;
	return;
}
function showOrdtplDialog(cooperauid, selectFlag, isvalid) {
	var rtn = "";
	if (selectFlag == 2) {
		rtn = window.showModalDialog(tmpContextPath + "/integration.jsp?targetUrl=/reward/cms/distribute/ordtpl.do?CMD=SELECT%26_se_cooperauid=" + cooperauid + "%26selectFlag=" + selectFlag, "this", "dialogWidth:560px;dialogHeight:500px;status:no;scroll:yes;resizable:yes;");
	} else {
		rtn = window.showModalDialog(tmpContextPath + "/integration.jsp?targetUrl=/reward/cms/distribute/ordtpl.do?CMD=SELECT%26selectFlag=" + selectFlag, "this", "dialogWidth:560px;dialogHeight:500px;status:no;scroll:yes;resizable:yes;");
	}
	var wayIdName = new Array(2);
	rtn == null ? "" : wayIdName = rtn.split("|");
	if (isvalid != null) {
		document.all(isvalid).value = wayIdName[1];
	}
	return (wayIdName[0] == null ? "" : wayIdName[0]);
}
function gotoNext(menu, movon) {
	//alert(menu);
	if (!isBlank(menu) && movon == "true") {
		//alert(parent.document.all(menu));
		PowerKey = true;
		var menuObject = document.all(menu);
		var pMenuObject = parent.document.all(menu);
		if (menuObject != null) {
			menuObject.click();
		} else {
			if (pMenuObject != null) {
				pMenuObject.click();
			}
		}
	}
}
function isBlank(str) {
	if (str == null || trim(str) == "") {
		return true;
	}
	return false;
}
function getComidTreeWithComtype(comtypeId) {
	if (comtypeId != null && trim(comtypeId) != "") {
		var comtype = document.all(comtypeId);
		if (comtype != null) {
			var typeValue = comtype.value;
			var bt = document.all.treebt;
			var comtypeArray = [typeValue];
			bt.onclick = function () {
				condition = ""; // reset
				if (typeValue != null && trim(typeValue) != "") {
					changeCondition("comtype", comtypeArray, "add");
				}
				showtree();
			};
		}
	}
}

function getComidTreeWithComclassid(classidArray){
	if(classidArray != null ){
		var bt = document.all.treebt;
		bt.onclick = function () {
			condition = ""; // reset
			changeCondition("comclassid", classidArray, "add");
			showtree();
		};
	}
}   
	    
//��ѯ����
function callExport(fileType,voName) {

	var arg = new Array();
	var args = new Array();
   	var form = document.forms[0];
	var elements = form.elements;
	for (var i = 0;i < elements.length;i++){
		var pClassName = elements[i].parentNode.className;
		if(pClassName.indexOf("form_table") != -1){
			if (elements[i].type == "text" || elements[i].type == "hidden" || elements[i].nodeName.toUpperCase() == "SELECT"){
	   			if (trim(elements[i].value) != ""){
	   				arg.push(elements[i].name+"="+elements[i].value);
	   			} 			
   			}	
		}  		    		
	}
	args.push(arg);
	args.push(fileType);
	var actionUrl = formList.action;
	var setPageUrl = tmpContextPath + "/integration.jsp?targetUrl=/reward/resmanage/common/selectpage2.jsp?voName="+voName;
	var hWnd = window.showModalDialog(setPageUrl, args, "dialogWidth:600px; dialogHeight:390px; status:no;resizable:yes;");
	if (hWnd != null && hWnd.length > 0) {
		var excelUrl = tmpContextPath+"/integration.jsp?targetUrl=/reward/resmanage/common/excelout.do?CMD=EXCELOUT%26fileType="+fileType+"%26voName="+voName;
		var infoPage = hWnd[0].split("|");
		arg.push("startindex="+infoPage[0]);
		arg.push("endindex="+infoPage[1]);
		if (hWnd.length > 1){		
			var property = hWnd[1].toString();			
			arg.push("property="+property);
		}
		formList.action = excelUrl+ "%26queryString="+arg.join(";");
		formList.submit();
		formList.action = actionUrl;
	}
}
