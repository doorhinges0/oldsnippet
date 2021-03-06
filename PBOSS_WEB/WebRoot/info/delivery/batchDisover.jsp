<%@ page contentType="text/html;charset=GBK" pageEncoding="GBK"%>
<%@ include file="/common/jspHead.jsp"%>
<html>
<head>
<!-- 公共静态文件 -->
<%@ include file="/common/meta_allcss.jsp"%>
</head>
<body>
<!-- 头部导航条 -->
<%@ include file="/common/include/inc_deliveryhead.jsp"%>	
<!--标准内容开始-->
<div class="divspan">
<!-- 左则功能区-->
<%@ include file="/common/include/inc_menu.jsp"%>
<div class="context">
<div class="listmyposition">
	<span class="font_breadcrumbtitle">您现在的位置：</span><span class="font_breadcrumb">${location}</span>
</div>

<s:form action="/delivery/batchDisover.do" method="POST" id="frmQuery" onsubmit="return doSubmit();">
	<input type="hidden" name="parameter.type" id="type" value="1"/>
	<div class="listboxtitle">批量完成配送</div>
    <table class="tb02" width="100%">
	  <tr>
		<td class="input_label">配送单编码：</td>
		<td>
			<textarea id="content" name="parameter.content" rows="10" cols="80">${parameter.content}</textarea>
		</td>
	  </tr>
	  <tr>
		<td>&nbsp;</td>
		<td colspan="4"  align="left">
			<input type="submit" id="submit" value="提 交" class="btn_blue_75" />&nbsp;&nbsp;
			<input type="button" id="reset" value="清 空" class="btn_blue_75" onclick="doReset()"/>
		</td>
	  </tr>
	</table>
</s:form>

<div class="column">
<s:actionmessage/>
<div class="listboxtitle">处理结果</div>
<s:if test="%{processResults.size > 0}">
<table class = "tb_comn" width="100%">	
	<thead >
		<tr align="center">
			<td>配送单编码</td>
			<td>提示信息</td>
		</tr>
	</thead>
	
	<s:iterator value="processResults">
		<tr align="center" onMouseMove="this.bgColor='F0F5F9'" onMouseOut="this.bgColor='#ffffff'">
			<td><s:property value="recid"/></td>
			<td><s:property value="message"/></td>
		</tr>
	</s:iterator>
</table>
</s:if>
</div>
<br>
<!--帮助信息开始-->
<div class="column">
	<div class="listboxtitle">功能说明：</div>
    <div class="reminder">
        <p>1. 通过输入配送单编码进行批量完成配送。</p>
    </div>
</div>
<div class="column">
   <div class="listboxtitle">温馨提醒：</div>
   <div class="reminder">
       <p>1.多个配送单号用半角逗号隔开，例如：<font color="red">100234,100211,100333</font></p>
       <p>2.最多不能输入超过<font color="red">500</font>个配送单编码。</p>
   </div>
</div>

</div>
<!--标准内容结束-->
<%@ include file="/common/include/inc_foot.jsp"%>
</div>
</body>
<%@include file="/common/meta_js.jsp"%>
<script type="text/javascript">
function doSubmit(){
	var content = $.trim($('#content').val());
	if(content=='' || content==null){
		return false;
	}
	var ids = content.split(',');
	if(ids.length>500){
		alert("输入过多，不能超过500个编号");
		return false;
	}
	return true;	
}
function doReset(){
	$("#content").val("");
}
</script>

</html>