<%@ page language="java" contentType="text/html;charset=GBK"%>
<%@ include file="/inc/listhead.inc" %>
<html>
<head>
    <title><s:text name="titleList"/></title>
    <script language="JavaScript" type="text/JavaScript">
        function ev_check() {
            addfield('param._ne_logid', '<s:text name="logid"/>', 'f', true, '14');
            addfield('param._se_wayid', '<s:text name="wayid"/>', 'c', true, '18');
            addfield('param._se_cityid', '<s:text name="cityid"/>', 'c', true, '14');
            return checkval(window);
        }
    </script>
</head>

<body class="list_body">
<div class="table_container">
<s:form action="loginlog_list.do" key="formList" cssStyle="formList" theme="simple" onsubmit="return ev_check();">
	<%//下面的控件给Action提供数据，用来分页%>
    <s:hidden name="param._orderby"/>
    <s:hidden name="param._desc"/>
    <s:hidden name="param._pageno"/>
    <s:hidden name="param._pagesize"/>
    <s:hidden name="param.queryAll"/>
    <input type="hidden" name="_rowcount" value="<s:property value="dp.rowCount" />"/>
    
	<div class="table_top">
		<div class="table_topleft"></div>
		<div class="table_toparea_w">
			<s:i18n name="public">
			<span class="table_toparea"><s:text name="currentPos"/> </span>
			<span class="table_toparea_xi">></span>
			<span class="table_toparea"><s:text name="base"/> </span>
			<span class="table_toparea_xi">></span>
			</s:i18n>
			<span class="table_toparea_h"><s:text name="titleList"/></span>
			<span class="button_Help" onclick="openword('<s:text name="helpTitle"/>','<s:text name="helpContent"/>')"><s:i18n name="public"><s:text name="help"/></s:i18n></span>
		</div>
	</div>
    
    <aa:zone name="errorZone">
		<div class="error_text" >
			<table class="error_text">
				<s:actionerror /><s:actionmessage/>
			</table>
		</div>
    </aa:zone>

	<div class="table_div">
        <table class="table_normal">
            <tr>
                <td align="center"><s:text name="logid"/>:</td>
                <td align="left">
                    <s:textfield cssStyle="style_input" name="param._ne_logid" />
                </td>
                <td align="center"><s:text name="wayid"/>:</td>
                <td align="left">
                    <s:textfield cssStyle="style_input" name="param._se_wayid" />
                </td>
                <td align="center"><s:text name="cityid"/>:</td>
                <td align="left">
                    <s:textfield cssStyle="style_input" name="param._se_cityid" />
                </td>
            </tr>
        </table>
    </div>
    
    <div class="table_div">
		<table class="table_button_list">
			<tr>
				<td>
                	<s:i18n name="public">
                	<input type="button" id="btnQuery" name="btnQuery" class="button_Query" onmouseover="buttonover(this);"
                        onmouseout="buttonout(this);" onfocus="buttonover(this)" onblur="buttonout(this)"
                        value="<s:text name="button_search"/>" onClick="doQuery('/base/loginlog_list.do');">
                	
                    <input type="button" id="btnNew" name="btnNew" class="button_New" onmouseover="buttonover(this);"
                        onmouseout="buttonout(this);" onfocus="buttonover(this)" onblur="buttonout(this)"
                        value="<s:text name="button_new"/>" onClick="doNew('/base/loginlog_new.do')">
                    
                    <input type="button" id="btnDelete" name="btnDelete" class="button_Delete" onmouseover="buttonover(this);"
                        onmouseout="buttonout(this);" onfocus="buttonover(this)" onblur="buttonout(this)"
                        value="<s:text name="button_delete"/>" onClick="doDelete('/base/loginlog_delete.do')">
                   </s:i18n>
				</td>
			</tr>
		</table>
	</div>

	<aa:zone name="listZone">
    <div class="table_div">
    	<div class="table_LongTable">
        <table class="table_style">
            <tr class="table_style_head">
               	<s:i18n name="public">
                <td title="<s:text name="list_title_select"/>">
                    <input type="checkbox" name="allbox" onclick="checkAll();"/>
                </td>
                </s:i18n>
                <td>
                    <j:orderByImg href="javascript:doOrderby('logid')"><s:text name="logid"/></j:orderByImg>                 
                </td>
                <td>
                    <j:orderByImg href="javascript:doOrderby('oprcode')"><s:text name="oprcode"/></j:orderByImg>                 
                </td>
                <td>
                    <j:orderByImg href="javascript:doOrderby('wayid')"><s:text name="wayid"/></j:orderByImg>                 
                </td>
                <td>
                    <j:orderByImg href="javascript:doOrderby('cityid')"><s:text name="cityid"/></j:orderByImg>                 
                </td>
                <td>
                    <j:orderByImg href="javascript:doOrderby('logintime')"><s:text name="logintime"/></j:orderByImg>                 
                </td>
                <td>
                    <j:orderByImg href="javascript:doOrderby('clientname')"><s:text name="clientname"/></j:orderByImg>                 
                </td>
                <td>
                    <j:orderByImg href="javascript:doOrderby('macaddress')"><s:text name="macaddress"/></j:orderByImg>                 
                </td>
                <td>
                    <j:orderByImg href="javascript:doOrderby('ipaddress')"><s:text name="ipaddress"/></j:orderByImg>                 
                </td>
                <td>
                    <j:orderByImg href="javascript:doOrderby('logintype')"><s:text name="logintype"/></j:orderByImg>                 
                </td>
                <td>
                    <j:orderByImg href="javascript:doOrderby('issuccess')"><s:text name="issuccess"/></j:orderByImg>                 
                </td>
                <td>
                    <j:orderByImg href="javascript:doOrderby('memo')"><s:text name="memo"/></j:orderByImg>                 
                </td>
            </tr>
            <s:iterator value="dp.datas">
                 <tr class="table_style_content" align="center" onMouseMove="this.bgColor='F0F5F9'" onMouseOut="this.bgColor='#ffffff'">
					 <%-- 复合主键用“|”间隔开 --%>
                     <td>
                         <input type="checkbox" name="param._selectitem" value="<s:property value="logid"/>" onclick="checkOne();">
                     </td>
                     <td><a href='<s:url action="loginlog_edit.do">
	                         <s:param name="param._pk" value="logid"/>
	                     	</s:url>'>
							<s:property value="logid"/>
                         </a>
					 </td>
                     <td><s:property value="oprcode" /></td>
                     <td><s:property value="wayid" /></td>
                     <td><s:property value="cityid" /></td>
                     <td><s:property value="logintime" /></td>
                     <td><s:property value="clientname" /></td>
                     <td><s:property value="macaddress" /></td>
                     <td><s:property value="ipaddress" /></td>
                     <td><s:property value="logintype" /></td>
                     <td><s:property value="issuccess" /></td>
                     <td><s:property value="memo" /></td>
                 </tr>
             </s:iterator>
        </table>
        </div>
    </div>
    <div class="table_div">
		<%@ include file="/common/pageNav.jsp"%>
   	</div>
    </aa:zone>
</s:form>
</div>
<script language="javascript"> 
	ajaxAnywhere.getZonesToReload = function(url,submitButton) {
		return "errorZone,listZone";  
	}
	ajaxAnywhere.substituteFormSubmitFunction();  
	ajaxAnywhere.substituteSubmitButtonsBehaviorByIDs(true,"btnQuery,btnDelete");
</script> 
</body>
</html>
