<%@ page contentType="text/html;charset=GBK" pageEncoding="GBK"%>
<%@ include file="/common/jspHead.jsp"%>
<html>
<head>
<!-- 公共静态文件 -->
<%@ include file="/common/meta_allcss.jsp"%>
</head>
<body>
	<!-- 头部 -->
	<%@ include file="/common/include/inc_managerhead.jsp"%>	
	<!--标准内容开始-->
	<div class="divspan">
			<!-- 左则功能区-->
		<%@ include file="/common/include/inc_menu.jsp"%>
        <div class="context">
			<div class="listmyposition"> 
				<span class="font_breadcrumbtitle">您现在的位置：</span><span class="font_breadcrumb">${location}</span>
			</div>
			
			<s:form action="/magSaleDetail/regAjax.do" method="POST" id="frmQuery">
			<div class="listboxtitle">查询条件</div>
            <table class="tb02" width="100%">
				  <tr>
					<td class="input_label">网点编码：</td>
					<td>
					<s:textfield cssClass="style_input" name="parameter.wayid" id="wayid"/>
					<input type="button" class="" value="..." id="btnWaySelect" onclick="f_waySelect(this)"/>
					</td>
					<td class="input_label">店员姓名：</td>
					<td>
					  <input type="hidden" name="parameter.oprcode" id="oprcode"/>
					  <s:textfield cssClass="style_input" id="employeename" disabled="true"/>
					  <input type="button" class=""  value="..." id="btnEmployeeSelect" onclick="f_employeeSelect(this)"/>
					</td>
				  </tr>
				  <tr>
					<td class="input_label">分公司：</td>
					<!--td>${_PBOSS_WEB_USER.channel.countyid }</td-->
					<td><s:select list="cntyComd" cssClass="select_3L" name="parameter.countyid" cssStyle="width:132px" id="countyid" onchange="f_clearSvccode()" /></td>
					<td class="input_label">销售服务中心：</td>
					<td>
						<input name="parameter.svccode" id="svccode" class="text_01" value="${parameter.svccode}" disabled="true" style="width:132px"/>
				    	<input type="button" value="..." onclick="showSvccode(this);" />
					</td>
				  </tr>
				  <tr>
					<td class="input_label">业务编码：</td>
					<td>
					  <s:textfield cssClass="style_input" name="parameter.opnid" id="opnid"/>
					  <input type="button" class="" value="..." id="btnOpnSelect" onclick="f_opnSelect(this)"/>
					</td>
					<td class="input_label">品牌：</td>
					<td>
					  <s:select list="brandType" name="parameter.brand" id="brand"></s:select>
					</td>
				  </tr>
				  <tr>
					<td class="input_label">登记起始时间：</td>
					<td>
						<s:textfield name="parameter.timeFrom" cssClass="text_01" id="timeFrom">
							<s:param name="value">
								<s:date name="parameter.timeFrom" format="yyyy-MM-dd"/>
							</s:param>
						</s:textfield>
					</td>
					<td class="input_label">登记到期时间：</td>
					<td>
						<s:textfield name="parameter.timeTo" cssClass="text_01" id="timeTo" >
							<s:param name="value">
								<s:date name="parameter.timeTo" format="yyyy-MM-dd"/>
							</s:param>
						</s:textfield>
					</td>
				  </tr>
			
			  <tr>
				<td valign="top" class="input_label">&nbsp;</td>
				<td colspan="5" align="left">
						<input name="btnQuery" type="button" id="btnQuery" value="查询" class="btn_blue_75" />&nbsp;&nbsp;
						<input name="btnExport" type="button" id="btnExportTxt" value="导出文本" class="btn_blue_75" size="10" style="width:80px"/>&nbsp;&nbsp;
						<input name="btnExport" type="button" id="btnExportExcel" value="导出Excel" class="btn_blue_75" size="10" style="width:80px"/>&nbsp;&nbsp;
						<input name="btnRest" type="reset" id="btnQuery" value="重置" class="btn_blue_75" />
				</td>
			  </tr>
			</table>
			</s:form>
			<div class="listboxlist">
			<div class="listboxtitle">查询结果</div>
			<span id="showTbl"></span>
			<table class="page_table">
				<tr valign="middle">
					<td align="left" height="30">&nbsp;&nbsp;</td>
					<td align="right" style="font-size:12px;" id="navigation"></td>
				</tr>
			</table>
            <br>
            <!--帮助信息开始-->
            <div class="column">
                 <div class="listboxtitle">功能说明：</div>
                 <div class="reminder">
                 <p>1.新业务销售明细查询，可以导出查询结果到Excel和文本文件中。</p>
                   </div>
               </div>
               <div class="column">
                 <div class="listboxtitle">温馨提醒：</div>
                 <div class="reminder">
                  <p>1.登记起始时间和登记结束时间必须同时设置，或者同时为空，查询期限不能超过31天。</p>
                  </div>
               </div>
          </div>
		</div>
		<!--标准内容结束-->
	<%@ include file="/common/include/inc_foot.jsp"%>
</div>
<iframe name="content" style="display: none;"></iframe>
</body>
<%@include file="/common/meta_js.jsp"%>
<script type="text/javascript" src="${ctx}/js/jQuery/table/jquery.table.js" ></script>
<script type="text/javascript" src="${ctx}/js/biz/info/salesDetail/magRegisternewList.js"></script>
<SCRIPT type="text/javascript">
//<!--
// 查询显示列信息
var showCols = ${ShowCols};//取后台列设置类数组，对应如下  //dataKey,key,name,width
//表格配置数组
var optin = {
	showCols:showCols,//显示列
	fmtLink:fmtLink,//用户自定义单元格内容
	pageSize:10,//页内大小
	navigation:$("#navigation"),//翻页位置 jq对象
	unableBtu:$('#btnQuery'),
	width:"100%",
	queryFrom: $("#frmQuery")//查询表单
};
//-->
</SCRIPT>
</html>