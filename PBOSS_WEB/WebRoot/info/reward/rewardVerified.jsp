<%@ page contentType="text/html;charset=GBK" pageEncoding="GBK"%>
<%@ include file="/common/jspHead.jsp"%>
<html>
<head>
<!-- 公共静态文件css -->
<%@ include file="/common/meta_allcss.jsp"%>
</head>

<body>
	<!-- 头部 -->
	<%@ include file="/common/include/inc_head.jsp"%>	
	<!--标准内容开始-->
	<div class="divspan">
			<!-- 左则功能区-->
		<%@ include file="/common/include/inc_menu.jsp"%>
        <div class="context">
			<div class="listmyposition">
				<span class="font_breadcrumbtitle">您现在的位置：</span><span class="font_breadcrumb">${location}</span>
			</div>
			
			<s:form action="/reward/rewardVerifiedQuery.do" method="POST" id="frmQuery">
			<div class="listboxtitle">查询条件</div>
            <table class="tb02" width="100%">
              <tr>
			  	<td class="input_label">渠道类型：</td>
			  	<td colspan="5">
			  		<select id='wayType' onclick="toWayType('wayType',2,'/reward/bbcRewardVerified.do')">
			  			<option value=1 >社会渠道</option>
			  			<option value=2 >网站渠道</option>
			  		</select>
			  	</td>
  			  </tr>
              <tr>
                <td class="input_label">业务名称：</td>
                <td><input id="opnname" class="text_01" />
                <input type="hidden" name="parameter.opnid" id="opnid"/></td>
                <td class="input_label">酬金类型：</td>
                <td align="left"><s:select list="rewareType" cssClass="select_3L" name="parameter.type" id="realrewardtype" value="5"/></td>
                <td class="input_label">结算月份：</td>
                <td><select name="parameter.month" class="select_3L" id="selMonth" orgval="${parameter.month}">
                </select></td>
              </tr>
              
              <tr>
                <td valign="top" class="input_label">&nbsp;</td>
                <td colspan="5" align="left" style=" padding-top:5px;">
	                <input name="btnQuery" type="button" id="btnQuery" value="查 询" class="btn_blue_75" disabled="disabled" />&nbsp;&nbsp;
	                <input name="btnExport" type="button" id="btnExportExcel" value="导 出" class="btn_blue_75" />&nbsp;&nbsp;
	                <input name="btnRest" type="reset" id="btnQuery" value="重 置" class="btn_blue_75" />
                </td>
              </tr>
            </table>
			</s:form>
          <div class="listboxlist">
          <div class="listboxtitle">查询结果：</div>
			<div id="showTbl"></div>
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
                 <div class="reminder">酬金校验失败信息查询 </div>
               </div>
            	<div class="column">
                 <div class="listboxtitle">温馨提醒：</div>
                 <div class="reminder">
                   <p>1、每个月10到14号结算上个月酬金。</p>
                   <p>2、每次查询前应该选择酬金类型和结算时间。</p>
                  </div>
               </div>    
             </div>
		</div>
		<!--标准内容结束-->
	<%@ include file="/common/include/inc_foot.jsp"%>
	</div>
	<iframe name="content" style="display: none;"></iframe>
</body>
<%-- --%>
<%@include file="/common/meta_js.jsp"%>
<script type="text/javascript" src="${ctx}/js/jQuery/table/jquery.table.js" ></script>
<script type="text/javascript" src="${ctx}/js/jQuery/ac/jquery.autocomplete.js"></script>
<script type="text/javascript" src="${ctx}/js/jQuery/ac/auto.js"></script> 
<script type="text/javascript" src="${ctx}/js/biz/info/reward/rewardVerified.js"></script>
<SCRIPT type="text/javascript">
<!--
// 查询显示列信息
var showCols = ${ShowCols};//取后台列设置类数组，对应如下  //dataKey,key,name,width
var optin = {
	showCols:showCols,//显示列
	fmtLink:fmtLink,//用户自定义单元格内容
	pageSize:10,//页内大小
	navigation:$("#navigation"),//翻页位置 jq对象
	unableBtu:$('#btnQuery'),
	width: "100%",
	queryFrom: $("#frmQuery")//查询表单
};
var operation = "${jqac.OPERATION}";
//-->
</SCRIPT>
</html>