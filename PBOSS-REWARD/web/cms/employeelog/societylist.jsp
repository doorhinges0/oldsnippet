<%@ page language="java" contentType="text/html;charset=GBK"%>
<%@ include file="/inc/listhead.inc"%>
<jsp:include page="/inc/acl.jsp">
	<jsp:param name="PID" value="" />
</jsp:include>
<%
String ID_query = "CH_PW_SOTYEMPLOYEE_BATCHLOGQUERY";
%>
<html>
	<head>
		<title><bean:message bundle="logquery"
				key="societyemployeelog" />
		</title>
		<script language="JavaScript" type="text/JavaScript">
        function ev_check() {
      
            return checkval(window);
        }
    </script>
	</head>

	<body onload="if(window.loadforiframe) loadforiframe();">
		<div class="table_container">
			<html:form action="/cms/employeelog.do?CMD=SOCIETYLIST"
				styleId="formList" method="post" onsubmit="return ev_check();">
				<html:hidden property="_orderby" />
				<html:hidden property="_desc" />
				<html:hidden property="_pageno" />
				<html:hidden property="_pagesize" />
				<input type="hidden" name="_rowcount"
					value="<c:out value='${requestScope.LIST.rowCount}' />">

				<!--##################################���ӱ�������##################################################-->
				<div class="table_div">
					<table class="top_table">
						<tr>
							<td>
								<bean:message bundle="logquery" key="societyemployeelog" />
							</td>
						</tr>
					</table>
				</div>
				<div class="table_div">
					<table width="100%" class="error_text">
						<html:errors />
						<s:Msg />
					</table>
				</div>
				<div class="table_div">
					<table class="form_table">
						<tr>
							<td width="126" height="20" align="right"
								class="form_table_right">
								<bean:message bundle="employeelog" key="optime" />
								&gt;=:
							</td>
							<td class="form_table_left">
								<html:text styleClass="form_input_1x" property="_dnl_optime"
									onclick="this.value=selectDatetime();" readonly="true" />
							</td>
							<td width="126" height="20" align="right"
								class="form_table_right">
								<bean:message bundle="employeelog" key="optime" />
								&lt;=:
							</td>
							<td class="form_table_left">
								<html:text styleClass="form_input_1x" property="_dnm_optime"
									onclick="this.value=selectDatetime();" readonly="true" />
							</td>
							<td width="126" height="20" align="right"
								class="form_table_right">
								<bean:message bundle="employeelog" key="oprcode" />
								:
							</td>
							<td class="form_table_left">
								<html:text styleClass="form_input_1x" property="_sk_oprcode"></html:text>
							</td>
						</tr>
						<tr>
							<td width="126" height="20" align="right"
								class="form_table_right">
								<bean:message bundle="employeelog" key="oprtype" />
								:
							</td>
							<td class="form_table_left">
								<html:select property="_se_oprtype">
									<option></option>
									<s:Options definition="$OPRTYPE" />
								</html:select>
							</td>
							<td width="126" height="20" align="right"
								class="form_table_right">
								<bean:message bundle="employeelog" key="success" />
								:
							</td>
							<td class="form_table_left">
								<html:select property="_se_success">
									<option></option>
									<s:Options definition="$OPRRESULT" />
								</html:select>
							</td>
							<td width="80" height="20" align="right" class="form_table_right">
								&nbsp;
							</td>
							<td class="form_table_left">
								&nbsp;
							</td>
						</tr>
					</table>
				</div>
				<div class="table_div">
					<table class="table_button_list">
						<tr>
							<td align=right>
								<s:PurChk2 controlid="<%=ID_query%>">
									<input type="button" class="query" onclick="doQuery();" 
										onmouseover="buttonover(this);" onmouseout="buttonout(this);"
										onfocus="buttonover(this)" onblur="buttonout(this)"
										value="<bean:message bundle="public" key="button_search"/>" />
								</s:PurChk2>
							</td>
						</tr>
					</table>
				</div>

				<div class="table_div">
					<div class="table_LongTable">
						<table class="table_style" ID="Table2">
							<tr class="table_style_head">
								<td>
									<a href="javascript:doOrderby('logid')"><bean:message
											bundle="employeelog" key="logid" />
									</a>
									<s:OrderImg form="/cms/employeelog/employeelogForm"
										field="logid" />
								</td>
								<td>
									<a href="javascript:doOrderby('optime')"><bean:message
											bundle="employeelog" key="optime" />
									</a>
									<s:OrderImg form="/cms/employeelog/employeelogForm"
										field="optime" />
								</td>
								<td>
									<a href="javascript:doOrderby('oprcode')"><bean:message
											bundle="employeelog" key="oprcode" />
									</a>
									<s:OrderImg form="/cms/employeelog/employeelogForm"
										field="oprcode" />
								</td>
								<td>
									<a href="javascript:doOrderby('oprtype')"><bean:message
											bundle="employeelog" key="oprtype" />
									</a>
									<s:OrderImg form="/cms/employeelog/employeelogForm"
										field="oprtype" />
								</td>
								<td>
									<a href="javascript:doOrderby('success')"><bean:message
											bundle="employeelog" key="success" />
									</a>
									<s:OrderImg form="/cms/employeelog/employeelogForm"
										field="success" />
								</td>
								<td>
									<a href="javascript:doOrderby('employeeid')"><bean:message
											bundle="employeelog" key="employeeid" />
									</a>
									<s:OrderImg form="/cms/employeelog/employeelogForm"
										field="employeeid" />
								</td>
								<td>
									<a href="javascript:doOrderby('employeename')"><bean:message
											bundle="employee" key="employeename" />
									</a>
									<s:OrderImg form="/cms/employee/employeeForm"
										field="employeename" />
								</td>
								<td>
									<a href="javascript:doOrderby('birthday')"><bean:message
											bundle="employee" key="birthday" />
									</a>
									<s:OrderImg form="/cms/employee/employeeForm" field="birthday" />
								</td>
								<td>
									<a href="javascript:doOrderby('sex')"><bean:message
											bundle="employee" key="sex" />
									</a>
									<s:OrderImg form="/cms/employee/employeeForm" field="sex" />
								</td>
								<td>
									<a href="javascript:doOrderby('cardid')"><bean:message
											bundle="employee" key="cardid" />
									</a>
									<s:OrderImg form="/cms/employee/employeeForm" field="cardid" />
								</td>
								<td>
									<a href="javascript:doOrderby('telephone')"><bean:message
											bundle="employee" key="telephone" />
									</a>
									<s:OrderImg form="/cms/employee/employeeForm" field="telephone" />
								</td>
								<td>
									<a href="javascript:doOrderby('cityid')"><bean:message
											bundle="employee" key="cityid" />
									</a>
									<s:OrderImg form="/cms/employee/employeeForm" field="cityid" />
								</td>
								<td>
									<a href="javascript:doOrderby('countyid')"><bean:message
											bundle="employee" key="countyid" />
									</a>
									<s:OrderImg form="/cms/employee/employeeForm" field="countyid" />
								</td>
								<td>
									<a href="javascript:doOrderby('svccode')"><bean:message
											bundle="employee" key="svccode" />
									</a>
							  		<s:OrderImg form="/cms/employee/employeeForm" field="svccode" />
								</td>
								<td>
									<a href="javascript:doOrderby('wayid')"><bean:message
											bundle="employee" key="wayid3" />
									</a>
									<s:OrderImg form="/cms/employee/employeeForm" field="wayid" />
								</td>
								<td>
									<a href="javascript:doOrderby('intime')"><bean:message
											bundle="employee" key="intime" />
									</a>
									<s:OrderImg form="/cms/employee/employeeForm" field="intime" />
								</td>
								<td>
									<a href="javascript:doOrderby('employtype')"><bean:message
											bundle="employee" key="employtype" />
									</a>
									<s:OrderImg form="/cms/employee/employeeForm"
										field="employtype" />
								</td>
								<td>
									<a href="javascript:doOrderby('bail')"><bean:message
											bundle="employeelog" key="bail" />
									</a>
									<s:OrderImg form="/cms/employee/employeeForm" field="bail" />
								</td>

								<td>
									<a href="javascript:doOrderby('empstatus')"><bean:message
											bundle="employee" key="empstatus" />
									</a>
									<s:OrderImg form="/cms/employeelog/employeelogForm"
										field="empstatus" />
								</td>


								<td>
									<a href="javascript:doOrderby('contacttype')"><bean:message
											bundle="employee" key="contacttype" />
									</a>
									<s:OrderImg form="/cms/employeelog/employeelogForm"
										field="contacttype" />
								</td>

								<td>
									<a href="javascript:doOrderby('officetel')"><bean:message
											bundle="employee" key="officetel2" />
									</a>
									<s:OrderImg form="/cms/employeelog/employeelogForm"
										field="officetel" />
								</td>
								<td>
									<a href="javascript:doOrderby('edulevel')"><bean:message
											bundle="employee" key="edulevel" />
									</a>
									<s:OrderImg form="/cms/employeelog/employeelogForm"
										field="edulevel" />
								</td>
								<td>
									<a href="javascript:doOrderby('ofcphone')"><bean:message
											bundle="employee" key="ofcphone" />
									</a>
									<s:OrderImg form="/cms/employeelog/employeelogForm"
										field="ofcphone" />
								</td>
								<td>
									<a href="javascript:doOrderby('pvtemail')"><bean:message
											bundle="employee" key="pvtemail" />
									</a>
									<s:OrderImg form="/cms/employeelog/employeelogForm"
										field="pvtemail" />
								</td>
								<td>
                    				<a href="javascript:doOrderby('isopen')"><bean:message bundle="employeelog" key="isopen"/></a>
                    				<s:OrderImg form="/cms/employeelog/employeelogForm" field="isopen"/>
                				</td>
                				<td>
                    				<a href="javascript:doOrderby('isnet')"><bean:message bundle="employeelog" key="isnet"/></a>
                    				<s:OrderImg form="/cms/employeelog/employeelogForm" field="isnet"/>
                				</td>
                				<td>
                    				<a href="javascript:doOrderby('netpass')"><bean:message bundle="employeelog" key="netpass"/></a>
                    				<s:OrderImg form="/cms/employeelog/employeelogForm" field="netpass"/>
                				</td>							
							</tr>
							<c:forEach var="item" items="${requestScope.LIST.datas}">
								<c:url value="/cms/employeelog.do?CMD=EDIT" var="urlContent">
									<%
									//this param name must "PK"
									%>
									<c:param name="PK" value="${item.logid}" />
									<%-- <c:param name="PK" value="'${item.id}|${item.id2}'"/> --%>
								</c:url>
								<tr class="table_style_content" align="center">
									<td>
										<c:out value="${item.logid}" />
									</td>
									<td>
										<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
											value="${item.optime}" />
									</td>
									<td>
										<c:out value="${item.oprcode}" />
									</td>
									<td>
										<s:Code2Name code="${item.oprtype}" definition="$OPRTYPE" />
									</td>
									<td>
										<s:Code2Name code="${item.success}" definition="$OPRRESULT" />
									</td>
									<td>
										<c:out value="${item.employeeid}" />
									</td>
									<td>
										<c:out value="${item.employeename}" />
									</td>
									<td>
										<c:out value="${item.birthday}" />
									</td>
									<td>
										<s:Code2Name code="${item.sex}" definition="$CH_SEX" />
									</td>
									<td>
										<c:out value="${item.cardid}" />
									</td>
									<td>
										<c:out value="${item.telephone}" />
									</td>
									<td>
										<s:Code2Name code="${item.cityid}" definition="#CITYCOMPANY" />
									</td>
									<td>
										<s:Code2Name code="${item.countyid}" definition="#CNTYCOMPANY" />
									</td>
									<td>
										<s:Code2Name code="${item.svccode}" definition="#CH_SERVCENT" />
									</td>
									<td>
										<s:Code2Name code="${item.wayid}" definition="#WAY" />
									</td>
									<td>
										<c:out value="${item.intime}" />
									</td>
									<td>
										<s:Code2Name code="${item.employtype}"
											definition="$CH_EMPLOYTYPE" />
									</td>
									<td>
										<c:out value="${item.bail}" />
									</td>

									<td>

										<s:Code2Name code="${item.empstatus}"
											definition="$CH_EMPSTATUS" />

									</td>


									<td>
										<s:Code2Name code="${item.contacttype}"
											definition="$CH_CONTACTTYPE" />

									</td>

									<td>
										<c:out value="${item.officetel}" />
									</td>
									<td>

										<s:Code2Name code="${item.edulevel}" definition="$CH_EDULEVEL" />

									</td>
									<td>
										<c:out value="${item.ofcphone}" />
									</td>
									<td>
										<c:out value="${item.pvtemail}" />
									</td>
									<td><s:Code2Name code="${item.isopen}"  definition="$CH_ISOPEN"/></td>
                     				<td><s:Code2Name code="${item.isnet}"  definition="$CH_ISNET"/></td>
                     				<td><c:out value="${item.netpass}"/></td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>

				<div class="table_div">
					<s:PageNav dpName="LIST" />
				</div>
			</html:form>
		</div>
	</body>
</html>
