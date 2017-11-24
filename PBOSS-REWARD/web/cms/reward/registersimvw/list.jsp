<%@ page language="java" contentType="text/html;charset=GBK"%>
<%@ include file="/inc/listhead.inc"%>
<%
    String ID_1 = "00010701";
    String ID_2 = "00010702";
    String ID_3 = "00010703";
    String ID_4 = "00010704";
%>
<html>
<head>
    <title><bean:message bundle="registersimvw" key="titleList"/></title>
    <script type="text/javascript" src="<%=contextPath%>/js/bus/waycommon.js"></script>
    <script language="JavaScript" type="text/JavaScript">
        function ev_check() {
            addfield('_se_wayid', '<bean:message bundle="registersimvw" key="wayid"/>', 'c', 'false', '18');
            addfield('_se_waymagcode', '<bean:message bundle="registersimvw" key="waymagcode"/>', 'c', 'false', '18');
            addfield('_se_countyid', '<bean:message bundle="registersimvw" key="countyid"/>', 'c', 'false', '14');
            addfield('_se_svccode', '<bean:message bundle="registersimvw" key="svccode"/>', 'c', 'false', '14');
            addfield('_se_oprcode', '<bean:message bundle="registersimvw" key="oprcode"/>', 'c', 'false', '15');
            addfield('_ne_brand', '<bean:message bundle="registersimvw" key="brand"/>', 'f', 'false', '3');
            addfield('_se_opnid', '<bean:message bundle="registersimvw" key="opnid"/>', 'c', 'false', '18');
            addfield('_dnm_oprtime', '<bean:message bundle="registersimvw" key="oprtime"/>', 'dt', 'false', '7');
            addfield('_dnl_oprtime', '<bean:message bundle="registersimvw" key="oprtime"/>', 'dt', 'false', '7');
            addfield('_dnm_activedate', '<bean:message bundle="registersimvw" key="activedate"/>', 'dt', 'false', '7');
            addfield('_dnl_activedate', '<bean:message bundle="registersimvw" key="activedate"/>', 'dt', 'false', '7');
            return (checkval(window) && compareDate());
        }
    function compareDate(){
        var startTime1 = document.getElementById('_dnl_activedate').value;
        var endTime1 = document.getElementById('_dnm_activedate').value;
        var startTime2 = document.getElementById('_dnl_oprtime').value;
        var endTime2 = document.getElementById('_dnm_oprtime').value;

        if (startTime2 == '') {
        	var alertstr = '<span class=\'errorkey\'><span style=\'color:#F00; font-size:12px;\'>[<bean:message bundle="registersimvw" key="_dnl_oprtime"/>]</span> 不能为空';
        	errorMessageShow(alertstr);
	        return false;
        }
        if (endTime2 == '') {
        	var alertstr = '<span class=\'errorkey\'><span style=\'color:#F00; font-size:12px;\'>[<bean:message bundle="registersimvw" key="_dnm_oprtime"/>]</span> 不能为空';
        	errorMessageShow(alertstr);
	        return false;
        }
        if(startTime1 != '' && endTime1 != '' &&  startTime1>endTime1){
	        var alertstr = '<span class=\'errorkey\'><span style=\'color:#F00; font-size:12px;\'>[<bean:message bundle="registersimvw" key="_dnl_activedate"/> ]</span> 不能大于 <span style=\'color:#F00; font-size:12px;\'>[<bean:message bundle="registersimvw" key="_dnm_activedate"/>]</span>';
			errorMessageShow(alertstr);
	        return false;
       	}
        if(startTime2 != '' && endTime2 != '' &&  startTime2>endTime2){
	        var alertstr = '<span class=\'errorkey\'><span style=\'color:#F00; font-size:12px;\'>[<bean:message bundle="registersimvw" key="_dnl_oprtime"/> ]</span> 不能大于 <span style=\'color:#F00; font-size:12px;\'>[<<bean:message bundle="registersimvw" key="_dnm_oprtime"/>]</span>';
			errorMessageShow(alertstr);
	        return false;
       	}
   		return true;	
    }
	function doExcel(){
    	formList.action="<%=contextPath%>/cms/reward/registersimvw.do?CMD=EXCEL";
    	formList.submit();
    	formList.action="<%=contextPath%>/cms/reward/registersimvw.do?CMD=LIST";
    }
    function doExportTxt(cmd){
 			var actionUrl = formList.action;
			formList.action = contextPath + cmd;
      		formList.submit();
      		formList.action = actionUrl;
		} 
    function openPicker(control,codeid) {
            if(codeid == '_se_svccode') {
                if(document.all('_se_countyid').value == "") {
    	            // 选择“服务销售中心编码”前要先指定“分公司” 
    	            alert("请先输入"+'<bean:message bundle="registersimvw" key="countyid"/>');
    	            return;
                }else {
                    // 查询指定“分公司”下的 “服务销售中心编码”
                	condition = '_se_countyid:'+ document.all('_se_countyid').value;
                	var countyid = document.all('_se_countyid').value;
		            var url = contextPath + "/cms/servcent.do?CMD=SHOWDATA";
		            if (countyid != '' && countyid != null) url = url + "&countyid=" + countyid;
					var rtn = window.showModalDialog(url, control, "dialogWidth=570px;dialogHeight=430px;status:no;scroll=yes;");
					if (rtn != null) {
						document.all('_se_svccode').value = rtn;
						return rtn;
					}
                }
            }
            if(codeid == '_se_oprcode') {
                if(document.all('_se_wayid').value == "") {
    	            // 选择“店员姓名”前要先指定“网点编码” 
    	            alert("请先输入"+'<bean:message bundle="registersimvw" key="wayid"/>');
    	            return;
                } else {
                    // 查询指定“网点编码”下的 “店员姓名”也就是id和name
                	var wayid = document.all('_se_wayid').value;
                	var url = contextPath + "/cms/employee.do?CMD=SHOWEMP";
                	if (wayid != "" && wayid != null) {url = url + "&wayid=" + wayid;}
					var rtn = window.showModalDialog(url, control, "dialogWidth=500px;dialogHeight=430px;status:no;scroll=yes;");
					if (rtn != null) {
						document.all('_se_oprcode').value = rtn;
						return rtn;
					}
                }
            }
    	    /*if(definition == null || definition =="") {	  	    			
    	   		alert("definition is required!");
    	   		return ;
    	    }	*/
    	}
    	function showSelectEmp(control) {
    		var url = contextPath + "/cms/employee.do?CMD=SHOWEMP&isnet=4&empstatus=0";
			var rtn = window.showModalDialog(url, control, "dialogWidth=500px;dialogHeight=430px;status:no;scroll=yes;");
			if (rtn != null) {
				document.all('_se_waymagcode').value = rtn;
				return rtn;
			}
    	}
    </script>
</head>

<body onload="if(window.loadforiframe) loadforiframe();">
<div class="table_container">
<html:form action="/cms/reward/registersimvw.do?CMD=LIST" styleId="formList" method="post" onsubmit="return ev_check();">
    <html:hidden property="_orderby"/>
    <html:hidden property="_desc"/>
    <html:hidden property="_pageno"/>
    <html:hidden property="_pagesize" value="20"/>
    <input type="hidden" name="_rowcount" value="<c:out value='${requestScope.LIST.rowCount}' />">
    <c:set var="form" scope="request" value="${requestScope['/cms/reward/registersimvw/RegistersimvwForm']}"/>

    <!--##################################添加标题内容##################################################-->
    <div class="table_div">
    <table class="top_table">
    	<tr>
    		<td>
    			<bean:message bundle="registersimvw" key="titleList"/>
   			</td>
    	</tr>
    </table>
    </div>
    <div class="table_div">	
   		 <table width="100%" class="error_text">
    		<html:errors/><s:Msg />
    	</table>
    </div>
	<div class="table_div">
        <table class="form_table">
            <tr>
                <td width="20%" height="20" align="right" class="form_table_right" ><bean:message bundle="registersimvw" key="employeeid"/>:</td>
                <td width="30%" class="form_table_left">
                    <html:text styleClass="form_input_1x" property="_se_waymagcode"></html:text>
                    <input type="button" value="..." class="clickbutton" onclick="showSelectEmp(this);" />
                </td>
                <td width="20%" height="20" align="right" class="form_table_right" ><bean:message bundle="registersimvw" key="wayid"/>:</td>
                <td width="30%" class="form_table_left">
                    <html:text styleClass="form_input_1x" property="_se_wayid"></html:text>
                    <input type="button" value="..." class="clickbutton" onclick="showSelectWay3(this,'_se_wayid','','','AG');this.value='...';" />
                </td>
            </tr>
            <tr>
                <td width="20%" height="20" align="right" class="form_table_right" ><bean:message bundle="registersimvw" key="oprcode"/>:</td>
                <td width="30%" class="form_table_left">
                    <html:text styleClass="form_input_1x" property="_se_oprcode"></html:text>
                    <input type="button" value="..." class="clickbutton" onclick="javascript:openPicker(this,'_se_oprcode');" />
                </td>
                <td width="20%" height="20" align="right" class="form_table_right" ><bean:message bundle="registersimvw" key="countyid"/>:</td>
                <td width="30%" class="form_table_left">
                    <html:select property="_se_countyid">
                    	<option />
                    	<s:Options definition="#CNTYCOMPANY" condition="citycompid:${requestScope.cityid}"/>
                    </html:select>
                </td>
            </tr>
            <tr>
                <td width="20%" height="20" align="right" class="form_table_right" ><bean:message bundle="registersimvw" key="svccode"/>:</td>
                <td width="30%" class="form_table_left">
                    <html:text styleClass="form_input_1x" property="_se_svccode" ></html:text>
                    <input type="button" value="..." class="clickbutton" onclick="javascript:openPicker(this,'_se_svccode');" />
                </td>
                <td width="20%" height="20" align="right" class="form_table_right" ><bean:message bundle="registersimvw" key="comclassid"/>:</td>
                <td width="30%" class="form_table_left">
                    <!-- <s:zoom definition="#OPERATIONSMS" property="_se_opnid" styleClass="form_input_1x" readonly="true" condition="cityid:${requestScope.cityid};opntype:1;smsno:10086111"/> -->
                    <html:select property="_ne_comclassid">
						<option />
						<s:Options definition="$IM_COMCLASS" />
					</html:select>
                </td>
            </tr>
            <tr><td width="20%" height="20" align="right" class="form_table_right" ><bean:message bundle="registersimvw" key="_dnl_oprtime"/>:</td>
                <td width="30%" class="form_table_left">
                    <html:text styleClass="form_input_1x" property="_dnl_oprtime" onclick="selectDatetime();"></html:text>
                    <font color="red">*</font>
                </td>
                <td width="20%" height="20" align="right" class="form_table_right" ><bean:message bundle="registersimvw" key="_dnm_oprtime"/>:</td>
                <td width="30%" class="form_table_left">
                    <html:text styleClass="form_input_1x" property="_dnm_oprtime" onclick="selectDatetime();"></html:text>
                    <font color="red">*</font>
                </td>
            </tr>
            <tr>
                <td width="20%" height="20" align="right" class="form_table_right" ><bean:message bundle="registersimvw" key="_dnl_activedate"/>:</td>
                <td width="30%" class="form_table_left">
                    <html:text styleClass="form_input_1x" property="_dnl_activedate" onclick="selectDatetime();"></html:text>
                </td>
                <td width="20%" height="20" align="right" class="form_table_right" ><bean:message bundle="registersimvw" key="_dnm_activedate"/>:</td>
                <td width="30%" class="form_table_left">
                    <html:text styleClass="form_input_1x" property="_dnm_activedate" onclick="selectDatetime();"></html:text>
                </td>
            </tr>
            <tr>
                <td width="20%" height="20" align="right" class="form_table_right" ><bean:message bundle="registersimvw" key="brand"/>:</td>
                <td width="30%" class="form_table_left">
                    <html:select property="_ne_brand">
                    	<option />
                    	<s:Options definition="$CH_SIMBRAND" />
                    </html:select>
                </td>
    			<td width="20%" height="20" align="right" class="form_table_right" ><bean:message bundle="registersimvw" key="mobile"/>:</td>
            	<td width="30%" class="form_table_left">
               	 	<html:text styleClass="form_input_1x" property="_se_mobile" ></html:text>
            	</td>
            </tr>
            <tr>
                <td width="20%" height="20" align="right" class="form_table_right" ><bean:message bundle="registersimvw" key="mendfalg"/>:</td>
                <td width="30%" class="form_table_left">
                    <html:select property="_ne_mendfalg">
                    	<option />
                    	<s:Options definition="$CH_MFLAG" />
                    </html:select>
                </td>
    			<td width="20%" height="20" align="right" class="form_table_right" ></td>
            	<td width="30%" class="form_table_left">
            	</td>
            </tr>
        </table>
    </div>
	<div class="table_div">
		<table class="table_button_list">
			<tr> 
                <td align=right>
                        <s:PurChk controlid="<%=ID_3%>">
                        <input type="button" class="query" onmouseover="buttonover(this);" onclick="doQuery();"
                                onmouseout="buttonout(this);" onfocus="buttonover(this)" onblur="buttonout(this)"
                                value="<bean:message bundle="public" key="button_search"/>" />
                        </s:PurChk>
                        <s:PurChk controlid="<%=ID_1%>">
                        <input type="button" id="btnExportexcel" name="btnExportexcel" class="button_4" onmouseover="buttonover(this);"
	                        onmouseout="buttonout(this);" onfocus="buttonover(this)" onblur="buttonout(this)"
	                        value="导出EXCEL" onClick="doExcel()">
	                    </s:PurChk>
	                    <s:PurChk controlid="<%=ID_2%>">
	                    <input type="button" id="btnExporttxt" name="btnExporttxt"
							class="button_4" onmouseover="buttonover(this);"
							onmouseout="buttonout(this);" onfocus="buttonover(this)"
							onblur="buttonout(this)"
							value="导出TXT" onClick="doExportTxt('/cms/reward/registersimvw.do?CMD=EXPORTTXT');">
						</s:PurChk>
                </td>
			</tr>
		</table>
	</div>

    <div class="table_div">
      <div class="table_LongTable">
        <table class="table_style" ID="Table2">
            <tr class="table_style_head">
                <td>
                    <a href="javascript:doOrderby('wayid')"><bean:message bundle="registersimvw" key="wayid"/></a>
                    <s:OrderImg form="/cms/reward/registersimvw/RegistersimvwForm" field="wayid"/>
                </td>
                <td>
                    <a href="javascript:doOrderby('wayname')"><bean:message bundle="registersimvw" key="wayname"/></a>
                    <s:OrderImg form="/cms/reward/registersimvw/RegistersimvwForm" field="wayname"/>
                </td>
                <td>
                    <a href="javascript:doOrderby('name')"><bean:message bundle="registersimvw" key="employeeid"/></a>
                    <s:OrderImg form="/cms/reward/registersimvw/RegistersimvwForm" field="name"/>
                </td>
                <td>
                    <a href="javascript:doOrderby('countyid')"><bean:message bundle="registersimvw" key="countyid"/></a>
                    <s:OrderImg form="/cms/reward/registersimvw/RegistersimvwForm" field="countyid"/>
                </td>
                <td>
                    <a href="javascript:doOrderby('starlevel')"><bean:message bundle="registersimvw" key="starlevel"/></a>
                    <s:OrderImg form="/cms/reward/registersimvw/RegistersimvwForm" field="starlevel"/>
                </td>
                <td>
                    <a href="javascript:doOrderby('employeename')"><bean:message bundle="registersimvw" key="oprcode"/></a>
                    <s:OrderImg form="/cms/reward/registersimvw/RegistersimvwForm" field="employeename"/>
                </td>
                <td>
                    <a href="javascript:doOrderby('officetel')"><bean:message bundle="registersimvw" key="officetel"/></a>
                    <s:OrderImg form="/cms/reward/registersimvw/RegistersimvwForm" field="officetel"/>
                </td>
                <td>
                    <a href="javascript:doOrderby('mobile')"><bean:message bundle="registersimvw" key="mobile"/></a>
                    <s:OrderImg form="/cms/reward/registersimvw/RegistersimvwForm" field="mobile"/>
                </td>
                <td>
                    <a href="javascript:doOrderby('brand')"><bean:message bundle="registersimvw" key="brand"/></a>
                    <s:OrderImg form="/cms/reward/registersimvw/RegistersimvwForm" field="brand"/>
                </td>
                <td>
                <a href="javascript:doOrderby('comname')"><bean:message bundle="registersimvw" key="comname"/></a>
                    <s:OrderImg form="/cms/reward/registersimvw/RegistersimvwForm" field="comname"/>
                </td>
                <td>
                <a href="javascript:doOrderby('comtype')"><bean:message bundle="registersimvw" key="comtype"/></a>
                    <s:OrderImg form="/cms/reward/registersimvw/RegistersimvwForm" field="comtype"/>
                </td>
                <td>
                <a href="javascript:doOrderby('comclassid')"><bean:message bundle="registersimvw" key="comclassid"/></a>
                    <s:OrderImg form="/cms/reward/registersimvw/RegistersimvwForm" field="comclassid"/>
                </td>
                <td>
                    <a href="javascript:doOrderby('comprice')"><bean:message bundle="registersimvw" key="comprice"/></a>
                    <s:OrderImg form="/cms/reward/registersimvw/RegistersimvwForm" field="comprice"/>
                </td>
                <td>
                    <a href="javascript:doOrderby('oprtime')"><bean:message bundle="registersimvw" key="oprtime"/></a>
                    <s:OrderImg form="/cms/reward/registersimvw/RegistersimvwForm" field="oprtime"/>
                </td>
                <td>
                    <a href="javascript:doOrderby('activedate')"><bean:message bundle="registersimvw" key="activedate"/></a>
                    <s:OrderImg form="/cms/reward/registersimvw/RegistersimvwForm" field="activedate"/>
                </td>
                <td>
                    <a href="javascript:doOrderby('mendfalg')"><bean:message bundle="registersimvw" key="mendfalg"/></a>
                    <s:OrderImg form="/cms/reward/registersimvw/RegistersimvwForm" field="mendfalg"/>
                </td>
            </tr>
            <c:forEach var="item" items="${requestScope.LIST.datas}">
                 <tr class="table_style_content" align="center">
                     <td><c:out value="${item.wayid}"/></td>
                     <td><c:out value="${item.wayname}"/></td>
                     <!-- <td><c:out value="${item.name}"/></td> -->
                     <td><s:Code2Name code="${item.waymagcode}" definition="#CH_EMPLOYEE"/></td>
                     <td><s:Code2Name code="${item.countyid}" definition="#CNTYCOMPANY"/></td>
                     <td><s:Code2Name code="${item.starlevel}" definition="$CH_STARLEVEL"/></td>
                     <td><c:out value="${item.employeename}"/></td>
                     <td><c:out value="${item.officetel}"/></td>
                     <td><c:out value="${item.mobile}"/></td>
                     <td><s:Code2Name code="${item.brand}" definition="$CH_SIMBRAND"/></td>
                     <td><c:out value="${item.comname}"/></td>
                     <td><s:Code2Name code="${item.comtype}" definition="$IM_COMTYPE"/></td>
                     <td><s:Code2Name code="${item.comclassid}" definition="$IM_COMCLASS"/></td>
                     <td><c:out value="${item.comprice}"/></td>
                     <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${item.oprtime}" /></td>
                     <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${item.activedate}" /></td>
                     <td><s:Code2Name code="${item.mendfalg}" definition="$CH_MFLAG"/></td>
                 </tr>
             </c:forEach>
        </table>
     </div>
   </div>

   <div class="table_div">
		<s:PageNav dpName="LIST"/>
   </div>
</html:form>
</div>
</body>
</html>
