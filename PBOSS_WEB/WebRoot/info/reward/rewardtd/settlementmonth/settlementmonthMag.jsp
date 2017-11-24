<%@ page contentType="text/html;charset=GBK" pageEncoding="GBK"%>
<%@ include file="/common/jspHead.jsp"%>
<html>
<head>
<!-- 公共静态文件 -->
<%@ include file="/common/meta_allcss.jsp"%>
</head>
<body>
	<!-- 头部导航条 -->
<%@ include file="/common/include/inc_managerhead.jsp"%>	
<!--标准内容开始-->
<div class="divspan">
<!-- 左则功能区-->
<%@ include file="/common/include/inc_menu.jsp"%>
        <div class="context">
			<div class="listmyposition">
				<span class="font_breadcrumbtitle">您现在的位置：</span><span class="font_breadcrumb">${location}</span>
			</div>
			
			<s:form action="/managerView/settlementMonthAjax.do" method="POST" id="frmQuery"> 
			<div class="listboxtitle">查询条件</div>
            <table class="tb02" width="100%">
			  <tr>
				<td class="input_label" align="right">网点编码：</td>
				<td>
					<s:textfield cssClass="style_input" name="parameter.wayid" id="wayid"/>
					<font color='red'>*</font>
					<input type="button" class="" value="..." id="btnWaySelect" onclick="f_waySelect()"/>
				</td>
				<td class="input_label" align="right">结算月份：</td>
				<td>
					 <select name="parameter.rwmon" class="select_3L" id="selMonth" orgval="${parameter.rwmon}"></select>  <font color='red'>*</font>  </td>
					 
				</td>
			 </tr>
			 <tr> 
				
				 <td colspan="4"  align="center">
						<input name="btnQuery" type="button" id="btnQuery" value="查询" class="btn_blue_75" />&nbsp;&nbsp;  
						<input name="btnExportExcel" type="button" id="btnExportExcel" value="导出" class="btn_blue_75" />&nbsp;&nbsp;	
				 </td>
				 
		 </tr> 
	  
			</table>
			</s:form>
			<div class="listboxlist">
			<div class="listboxtitle">酬金结果</div>
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
      				  <p>1.统计各业务<font color='red'>业务明细报表（结算月维度）</font>。</p>
    				</div>
               </div>
               <div class="column">
                 <div class="listboxtitle">温馨提醒：</div>
                    <div class="reminder">
                      <p>1.查询条件中<font color='red'>“结算月份”不能为空</font>。
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
<script type="text/javascript" src="${ctx}/js/biz/info/reward/common.js"></script>
<script type="text/javascript" src="${ctx}/js/biz/info/reward/rewardtd/settlementmonth/settlementMonthMag.js"></script> 
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

function f_waySelect(){
	var url="/magSaleDetail/waySelect.do";
	var rtn=window.showModalDialog(url,null,"dialogWidth:900px; dialogHeight:450px; status:no; resizable:no;");
    if (rtn != null && rtn.length) {
	   document.getElementById("wayid").value = rtn;//[0]
	   return rtn;
	}
}

</SCRIPT>
</html>