<%@ page language="java" contentType="text/html;charset=GBK"%>
<%@ include file="/inc/contenthead.inc"%>
<jsp:include page="/inc/acl.jsp">
	<jsp:param name="PID" value="2B1A6FBT14" />
</jsp:include>
<html>
<head>
<title><s:text name="titleUpdate" /></title>
<script language="JavaScript">
	function ev_checkval() {
		addfield('form.wayid', '<s:text name="wayid"/>', 'c', false, 16);
		addfield('form.opmonth', '<s:text name="opmonth"/>', 'c', false, 128);
		addfield('form.calcmonth', '<s:text name="calcmonth"/>', 'c', false,
				128);
		addfield('form.mobile', '<s:text name="mobile"/>', 'c', false, 32)
		return checkval(window);
	}
</script>
</head>
<body>
	<div class="table_container">
		<s:form action="stype_save.do" cssStyle="formList" key="formItem"
			method="post" theme="simple" onsubmit="return ev_checkval();">

			<s:hidden name="CMD" />
			<s:hidden name="param._orderby" />
			<s:hidden name="param._desc" />
			<s:hidden name="param._pageno" />
			<s:hidden name="param._pagesize" />

			<s:hidden name="form.seq" />

			<div class="table_top">
				<div class="table_topleft"></div>
				<div class="table_toparea_w">
					<s:i18n name="public">
						<span class="table_toparea"><s:text name="currentPos" /> </span>
						<span class="table_toparea_xi">></span>
						<span class="table_toparea"><s:text name="������" /> </span>
						<span class="table_toparea_xi">></span>
					</s:i18n>
					<span class="table_toparea_h"><s:text name="titleList" /></span> <span
						class="button_Help"
						onclick="openword('<s:text name="helpTitle"/>','<s:text name="helpContent"/>')"><s:i18n
							name="public">
							<s:text name="help" />
						</s:i18n></span>
				</div>
			</div>

			<div class="error_text">
				<table class="error_text">
					<s:actionerror />
					<s:actionmessage />
				</table>
			</div>

			<div class="table_div">
				<table class="table_normal">
					<tr>
						<td align="right"><s:text name="wayid" />:&nbsp</td>
						<td align="left"><s:if test="CMD != WEB_CMD_SAVE">
								<j:selector definition="#WAYIDINFO" name="form.wayid"/>
							</s:if> <s:else>
								<s:textfield cssStyle="style_input" name="form.wayid"
									disabled="true" />
							</s:else> <font color=red>*</font></td>

					</tr>
					<tr>
						<td align="right"><s:text name="mobile" />:&nbsp</td>
						<td align="left">
							<s:if test="CMD != WEB_CMD_SAVE">
								<s:textfield cssStyle="style_input" name="form.mobile"
									disabled="false" maxlength="20" />
							</s:if> <s:else>
								<s:textfield cssStyle="style_input" name="form.mobile"
									disabled="true" />
							</s:else> <font color=red>*</font></td>
					</tr>
					<tr>
						<td align="right"><s:text name="opmonth" />:&nbsp</td>
						<td align="left">
							<s:if test="CMD != WEB_CMD_SAVE">
								<s:textfield cssStyle="style_input" name="form.opmonth"
									onclick="selectDateYYYYMM();"/>
							</s:if> <s:else>
								<s:textfield cssStyle="style_input" name="form.opmonth"
									 disabled="true" />
							</s:else><font color=red>*</font></td>

					</tr>
					<tr>
						<td align="right"><s:text name="calcmonth" />:&nbsp</td>
						<td align="left">
							<s:if test="CMD != WEB_CMD_SAVE">
								<s:textfield cssStyle="style_input" name="form.calcmonth"
									onclick="selectDateYYYYMM();" />
							</s:if> <s:else>
								<s:textfield cssStyle="style_input" name="form.calcmonth"
								disabled="true" />
							</s:else><font color=red>*</font></td>

					</tr>
					
					
				</table>
			</div>
			<div class="table_div">
				<table class="table_button_list">
					<tr>
						<td width="100%" align="center"><s:i18n name="public">
								<input type="button" id="btnSave" name="btnSave"
									class="button_Save" onmouseover="buttonover(this);"
									onmouseout="buttonout(this);" onfocus="buttonover(this)"
									onblur="buttonout(this)" value="<s:text name="button_save"/>"
									onclick="doSave('/paydetail/paydetail_save.do')"
									<s:if test="CMD == WEB_CMD_SAVE">disabled = "true"</s:if> />
								<input type="button" id="btnReturn" name="btnReturn"
									class="button_Back" onmouseover="buttonover(this);"
									onmouseout="buttonout(this);" onfocus="buttonover(this)"
									onblur="buttonout(this)" value="<s:text name="button_return"/>"
									onclick="doReturn('/paydetail/paydetail_list.do')">
							</s:i18n></td>
					</tr>
				</table>
			</div>
		</s:form>
	</div>
</body>
</html>