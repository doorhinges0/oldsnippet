<%@ page contentType="text/html;charset=GBK" pageEncoding="GBK"%>
<%@ include file="/common/jspHead.jsp"%>
<html>
<head>
	<title>渠道选择</title>
	<!-- 公共静态文件 -->
	<%@ include file="/common/meta_allcss.jsp"%>
</head>
<body>
	<div class="divspan">
			<s:form action="wayAjax.do" method="POST" id="frmQuery">
			<div class="listboxtitle">查询条件</div>
			<input type="hidden" name="popup" value="${true}" id="popup"/>
			<table class="tb02" width="100%">
 <tr>
 	<td class="input_label">渠道编码：</td>
 	<td>
	<input name="wayid" id="wayid" class="text_01" onFocus="shover(this,'text_01_02')" onBlur="shover(this,'text_01')" 
				   value="${wayid}" size="22"  maxlength="22" />
	</td>
	<td class="input_label">渠道名称：</td>
	<td>
	<input name="wayname" id="wayname" class="text_01" onFocus="shover(this,'text_01_02')" onBlur="shover(this,'text_01')" 
				   value="${wayname}" size="22"  maxlength="22" />
	</td>
</tr>
<tr>
	<td valign="top" class="input_label">&nbsp;</td>
	<td colspan="5" align="left">
		<input name="btnQuery" type="button" id="btnQuery" value="查询" class="btn_blue_75" onMouseOver="shover(this,'btn_blue_75_02')" onMouseOut="shover(this,'btn_blue_75')"/>
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
          </div>
          <div class="column">
                 <div class="listboxtitle">功能说明：</div>
                 <div class="reminder">
                  	 可以根据渠道编码和渠道名称模糊查询。 </div>
          </div>
	</div>
</body>
<%@include file="/common/meta_js.jsp"%>
<script type="text/javascript" src="${ctx}/js/jQuery/table/jquery.table.js" ></script>
<script type="text/javascript" src="${ctx}/js/biz/info/salesDetail/wayselect.js"></script>
<SCRIPT type="text/javascript">
//<!--
// 查询显示列信息
var showCols = ${ShowColsPopup};//取后台列设置类数组，对应如下  //dataKey,key,name,width
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