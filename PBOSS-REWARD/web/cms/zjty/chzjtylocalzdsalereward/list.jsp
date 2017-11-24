<%@ page language="java" contentType="text/html;charset=GBK"%>
<%@ include file="/inc/listhead.inc"%>
<html>
<head>
    <title><bean:message bundle="chzjtylocalzdsalereward" key="titleList"/></title>
    <script language="JavaScript" type="text/JavaScript">
        function ev_check() {
            var rewardreporttime = document.getElementById('_se_rewardreporttime').value;
            if (rewardreporttime==null || rewardreporttime=='') {
            	var alertstr = '<span class=\'errorkey\'><strong style=\'color:#F00; font-size:12px;\'>[月份]</strong> 不能为空 ';
            	errorMessageShow(alertstr);
            	return false;
            }
            return true;
        }
        
        function doExport(url){
        	if (ev_check()) {
        		errorobj.innerHTML = "";
				formList.action = contextPath + url + "?CMD=EXCEL";
	  			formList.submit();
	  			formList.action="<%=contextPath%>/cms/zjty/chzjtylocalzdsalereward.do?CMD=LIST";
	  		}
		}
    </script>
</head>

<body onload="if(window.loadforiframe) loadforiframe();">
<div class="table_container">
<html:form action="/cms/zjty/chzjtylocalzdsalereward.do?CMD=LIST" styleId="formList" method="post" onsubmit="return ev_check();">
    <html:hidden property="_orderby"/>
    <html:hidden property="_desc"/>
    <html:hidden property="_pageno"/>
    <html:hidden property="_pagesize" value="20"/>
    <input type="hidden" name="query" value="true">
    <input type="hidden" name="_rowcount" value="<c:out value='${requestScope.LIST.rowCount}' />">
    <c:set var="form" scope="request" value="${requestScope['/cms/zjty/chzjtylocalzdsalereward/ChzjtylocalzdsalerewardForm']}"/>

    <!--##################################添加标题内容##################################################-->
    <div class="table_div">
    <table class="top_table">
    	<tr>
    		<td>
    			<bean:message bundle="chzjtylocalzdsalereward" key="titleList"/>
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
                <td width="20%" height="20" align="right" class="form_table_right" ><bean:message bundle="chzjtylocalzdsalereward" key="_se_rewardreporttime"/>:</td>
                <td width="30%" class="form_table_left">
                    <html:text styleClass="form_input_1x" property="_se_rewardreporttime" onclick="WdatePicker({dateFmt:'yyyyMM', maxDate:'%y {%M}'})"></html:text>
                </td>
                <td width="20%" height="20" align="right" class="form_table_right" >&nbsp;</td>
                <td width="30%" class="form_table_left">&nbsp;</td>
            </tr>
        </table>
    </div>
	<div class="table_div">
		<table class="table_button_list">
			<tr> 
                <td align=right>
                	<input type="button" class="query" onmouseover="buttonover(this);" onclick="doQuery();"
                        onmouseout="buttonout(this);" onfocus="buttonover(this)" onblur="buttonout(this)"
                        value="<bean:message bundle="public" key="button_search"/>" />
                    <input type="button" class="button_4" onmouseover="buttonover(this);" 
            			onclick="doExport('/cms/zjty/chzjtylocalzdsalereward.do')" 
                        onmouseout="buttonout(this);" onfocus="buttonover(this)" onblur="buttonout(this)"
                        value="<bean:message bundle="public" key="button_export_excel"/>" />
                    <c:if test="${!protoken}">
                    <input type="button" name="btnDelete" class="delete" onmouseover="buttonover(this);"
                        onmouseout="buttonout(this);" onfocus="buttonover(this)" onblur="buttonout(this)"
                        value="<bean:message bundle="public" key="button_delete"/>" 
                        onClick="doDelete('/cms/zjty/chzjtylocalzdsalereward.do')">
                    </c:if>
                </td>
			</tr>
		</table>
	</div>

    <div class="table_div">
      <div class="table_LongTable">
        <table class="table_style" ID="Table2">
            <tr class="table_style_head">
                <c:if test="${!protoken}">
                <td title="<bean:message bundle="public" key="list_title_select"/>">
                    <input type="checkbox" name="allbox" onclick="checkAll();" class="table_checkbox">
                </td>
                </c:if>
                <td><bean:message bundle="chzjtylocalzdsalereward" key="recid"/></td>
                <c:if test="${!protoken}">
                <td><bean:message bundle="chzjtylocalzdsalereward" key="wayname"/></td>
                </c:if>
                <td><bean:message bundle="chzjtylocalzdsalereward" key="cityid"/></td>
                <c:if test="${!protoken}">
                <td><bean:message bundle="chzjtylocalzdsalereward" key="zjtyname"/></td>
                </c:if>
                <td><bean:message bundle="chzjtylocalzdsalereward" key="dzzdxlhyj"/></td>
                <td><bean:message bundle="chzjtylocalzdsalereward" key="dzzdxllhy"/></td>
                <td><bean:message bundle="chzjtylocalzdsalereward" key="dzzdxllj"/></td>
                <td><bean:message bundle="chzjtylocalzdsalereward" key="dzzdxlhj"/></td>
                <td><bean:message bundle="chzjtylocalzdsalereward" key="ysrgdzzdxlhyj"/></td>
                <td><bean:message bundle="chzjtylocalzdsalereward" key="ysrgdzzdxllhy"/></td>
                <td><bean:message bundle="chzjtylocalzdsalereward" key="ysrgdzzdxllj"/></td>
                <td><bean:message bundle="chzjtylocalzdsalereward" key="ysrgdzzdxlhj"/></td>
                <td><bean:message bundle="chzjtylocalzdsalereward" key="dzzdcjhyj"/></td>
                <td><bean:message bundle="chzjtylocalzdsalereward" key="dzzdcjlhy"/></td>
                <td><bean:message bundle="chzjtylocalzdsalereward" key="dzzdcjlj"/></td>
                <td><bean:message bundle="chzjtylocalzdsalereward" key="dzzdcjhj"/></td>
                <td><bean:message bundle="chzjtylocalzdsalereward" key="ysrgdzzdcjhyj"/></td>
                <td><bean:message bundle="chzjtylocalzdsalereward" key="ysrgdzzdcjlhy"/></td>
                <td><bean:message bundle="chzjtylocalzdsalereward" key="ysrgdzzdcjlj"/></td>
                <td><bean:message bundle="chzjtylocalzdsalereward" key="ysrgdzzdcjhj"/></td>
            </tr>
            <c:forEach var="item" items="${requestScope.LIST.datas}">
                 <c:url value="/cms/zjty/chzjtylocalzdsalereward.do?CMD=EDIT" var="urlContent">
                     <%//this param name must "PK" %>
                     <c:param name="PK" value="${item.recid}"/>
                     <%-- <c:param name="PK" value="'${item.id}|${item.id2}'"/> --%>
                 </c:url>
                 <tr class="table_style_content" align="center">
                     <c:if test="${!protoken}">
                     <td>
                         <input type="checkbox" name="_selectitem" value="<c:out value='${item.recid}' />"
                                onclick="checkOne();" class="table_checkbox">
                     </td>
                     </c:if>
                     <td><c:out value="${item.recid}"/></td>
                     <c:if test="${!protoken}">
                     <td><c:out value="${item.wayname}"/></td>
                     </c:if>
                     <td><c:out value="${item.cityid}"/></td>
                     <c:if test="${!protoken}">
                     <td><c:out value="${item.zjtyname}"/></td>
                     </c:if>
                     <td><c:out value="${item.dzzdxlhyj}"/></td>
                     <td><c:out value="${item.dzzdxllhy}"/></td>
                     <td><c:out value="${item.dzzdxllj}"/></td>
                     <td><c:out value="${item.dzzdxlhj}"/></td>
                     <td><c:out value="${item.ysrgdzzdxlhyj}"/></td>
                     <td><c:out value="${item.ysrgdzzdxllhy}"/></td>
                     <td><c:out value="${item.ysrgdzzdxllj}"/></td>
                     <td><c:out value="${item.ysrgdzzdxlhj}"/></td>
                     <td><c:out value="${item.dzzdcjhyj}"/></td>
                     <td><c:out value="${item.dzzdcjlhy}"/></td>
                     <td><c:out value="${item.dzzdcjlj}"/></td>
                     <td><c:out value="${item.dzzdcjhj}"/></td>
                     <td><c:out value="${item.ysrgdzzdcjhyj}"/></td>
                     <td><c:out value="${item.ysrgdzzdcjlhy}"/></td>
                     <td><c:out value="${item.ysrgdzzdcjlj}"/></td>
                     <td><c:out value="${item.ysrgdzzdcjhj}"/></td>
                 </tr>
             </c:forEach>
             <c:if test="${protoken && LIST != null}">
             	<tr class="table_style_content" align="center">
                     <td colspan="2">合计</td>
                     <td><c:out value="${queryTotal[0]}"/></td>
                     <td><c:out value="${queryTotal[1]}"/></td>
                     <td><c:out value="${queryTotal[2]}"/></td>
                     <td><c:out value="${queryTotal[3]}"/></td>
                     <td><c:out value="${queryTotal[4]}"/></td>
                     <td><c:out value="${queryTotal[5]}"/></td>
                     <td><c:out value="${queryTotal[6]}"/></td>
                     <td><c:out value="${queryTotal[7]}"/></td>
                     <td><c:out value="${queryTotal[8]}"/></td>
                     <td><c:out value="${queryTotal[9]}"/></td>
                     <td><c:out value="${queryTotal[10]}"/></td>
                     <td><c:out value="${queryTotal[11]}"/></td>
                     <td><c:out value="${queryTotal[12]}"/></td>
                     <td><c:out value="${queryTotal[13]}"/></td>
                     <td><c:out value="${queryTotal[14]}"/></td>
                     <td><c:out value="${queryTotal[15]}"/></td>
                 </tr>
             </c:if>
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
