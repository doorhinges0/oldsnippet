<%@ page contentType="text/html;charset=GBK" pageEncoding="GBK"%>
<%@ include file="/common/jspHead.jsp"%>
<html>
<head>
<!-- ������̬�ļ� -->
<%@ include file="/common/meta_allcss.jsp"%>
</head>
<body>
	<!-- ͷ�� -->
	<%@ include file="/common/include/inc_head.jsp"%>	
	<!--��׼���ݿ�ʼ-->
	<div class="divspan">
			<!-- ��������-->
		<%@ include file="/common/include/inc_menu.jsp"%>
        <div class="context">
			<div class="listmyposition">
				<span class="font_breadcrumbtitle">�����ڵ�λ�ã�</span><span class="font_breadcrumb">${location}</span>
			</div>
			
			<s:form action="/registernewmagcntd/regAjax.do" method="POST" id="frmQuery">
            <table class="tb02" width="100%">
            	<input type="hidden" name="parameter.employeename" id="employeename" value="${parameter.employeename}">
            	<input type="hidden" name="parameter.officetel" id="officetel" value="${parameter.officetel}">
            	<input type="hidden" name="parameter.opnid" id="opnid" value="${parameter.opnid}">
            	<input type="hidden" name="parameter.brand" id="brand" value="${parameter.brand}">
            	<input type="hidden" name="parameter.dateFrom" id="dateFrom" value="${parameter.dateFrom}"/>
            	<input type="hidden" name="parameter.dateTo" id="dateTo" value="${parameter.dateTo}"/>
			</table>
			</s:form>
			<div class="listboxlist">
			<div class="listboxtitle">��ѯ���</div>
			<span id="showTbl"></span>
			<table class="page_table">
				<tr valign="middle">
					<td align="left" height="30">&nbsp;&nbsp;</td>
					<td align="right" style="font-size:12px;" id="navigation"></td>
				</tr>
			</table>
            <br>
            <input type="button" class="btn_blue"  onclick="location='/registernewmagcnt/list.do'" value="������ҵ�����ۻ��ܲ�ѯ" />
            <!--������Ϣ��ʼ-->
            <div class="column">
                 <div class="listboxtitle">����˵����</div>
                 <div class="reminder">
                   </div>
               </div>
               <div class="column">
                 <div class="listboxtitle">��ܰ���ѣ�</div>
                 <div class="reminder">
                  </div>
               </div>
          </div>
		</div>
		<!--��׼���ݽ���-->
	<%@ include file="/common/include/inc_foot.jsp"%>
</div>
</body>
<%@include file="/common/meta_js.jsp"%>
<script type="text/javascript" src="${ctx}/js/jQuery/table/jquery.table.js" ></script>
<script type="text/javascript" src="${ctx}/js/biz/info/registernewmagcnt/registernewList.js"></script>
<SCRIPT type="text/javascript">
//<!--
// ��ѯ��ʾ����Ϣ
var showCols = ${ShowStCols};//ȡ��̨�����������飬��Ӧ����  //dataKey,key,name,width
//������������
var optin = {
	showCols:showCols,//��ʾ��
	fmtLink:fmtLink,//�û��Զ��嵥Ԫ������
	pageSize:10,//ҳ�ڴ�С
	navigation:$("#navigation"),//��ҳλ�� jq����
	unableBtu:$('#btnQuery'),
	width:"100%",
	queryFrom: $("#frmQuery")//��ѯ����
};
//-->
</SCRIPT>
</html>