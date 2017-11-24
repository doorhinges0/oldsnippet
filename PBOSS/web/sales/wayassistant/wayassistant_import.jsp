<%@ page language="java" contentType="text/html;charset=GBK" %>
<%@ include file="/inc/listhead.inc" %>
<html>
<head>
    <title><s:text name="titleUpdate"/></title>
    <script language="JavaScript" type="text/JavaScript">
    
	    function checkProcess(actionUrl){
			var filename = formItem.path.value;
			if(filename != null || filename != ""){
				formItem.btnDeal.disabled=true;
				document.getElementById("tt").href="<%=contextPath%>/sales/wayassistant_import.do?filename="+filename+"&beanname=com.gmcc.pboss.web.sales.wayassistant.WayassistantTaskBean";
	    		document.getElementById("tt").click();
			}
		}
		
		function upload(actionUrl){
			formItem.action=actionUrl;
			var fileName = document.getElementById('doc').value;
			if(fileName == ''){
				 var alertstr = '<span class=\'errorkey\'><span style=\'color:#F00; font-size:12px;\'>��ѡ���ϴ����ļ�</span> ';
				errorMessageShow(alertstr);
				return false;
			}
			formItem.submit();
		}
		
		function dataCheck(){
			
			return ture;
		}
		
		function doReturnList(){
    		window.location.href="<%=contextPath%>/sales/wayassistant_list.do";
    	}	
    </script>
    <base target="_self">
</head>
<body class="list_body" onload="if(window.loadforiframe) loadforiframe();">
<div class="table_container">
<s:form action="/sales/wayassistant_upload.do" cssStyle="formItem" key="formItem" 
			method="post" theme="simple" enctype ="multipart/form-data" onSubmit="return dataCheck()">
   
   <input type="hidden" name="wayid" id="wayid" value="${USER.wayid}"/>
   <input type="hidden" name="step" id="step" value="${step}"/>
   <input type="hidden" name="delaySeconds" id="delaySeconds" value="${delaySeconds}"/>
   
    <a id="tt" href="#"></a>
	<div class="table_top">
		<div class="table_topleft"></div>
		<div class="table_toparea_w">
			<s:i18n name="public">
			<span class="table_toparea">������������ </span>
			<span class="table_toparea_xi">></span>
			<span class="table_toparea">��Ʒ����������Ϣ���� </span>
			<span class="table_toparea_xi">></span>
			<span class="table_toparea_h">��Ʒ����������Ϣ���� </span>
			</s:i18n>
		</div>
	</div>

<input type="hidden" name="filename" id="filename" value='<s:property value="fileName"/>'>
    <input type="hidden" name="path" id="filepath" value='<s:property value="filepath"/>'>
    <input type="hidden" name="iCheckFormat" value="com.gmcc.pboss.web.sales.wayassistant.WayassistantCheck">

    <aa:zone name="errorZone">
		<div class="error_text" id="msg">
			<table class="error_text">
				<s:actionerror /><s:actionmessage/>
			</table>
		</div>
    </aa:zone>
	
	<aa:zone name="listZone">
    <div class="table_div">
    <s:i18n name="public">
         <table class="table_normal">
            <tr>
                <td align="right">��ѡ���ϴ����ļ�:&nbsp</td>
                <td align="left">
					<s:file name="doc" label="File"/>
                </td>
            </tr>
            <tr>
                <td align="right"><s:text name="file_file"/>:&nbsp</td>
                <td align="left">
					<a href='<%=contextPath%>/common/download.jsp?filename=<s:property value="filepath" />'> 
					<s:property value="fileName" /> 
            	</a>
                </td>
            </tr>

            <tr>
                <td align="right">�ļ�����:&nbsp</td>
                <td align="left">
					.txt�ı��ļ�(�ļ��ﲻҪ�����кͶ���Ŀո�)
                </td>
            </tr>
            <tr>
                <td align="right">�ļ���ʽ:&nbsp</td>
                <td align="left">
					<font color="red">�����̱���|�Ƿ�ɷ��𶩹�|�Ƿ��ӡ��Ʊ|�ɷѷ�ʽ|�ͻ���ʽ|�Ƿ�ɶ�������|</font>
                </td>
            </tr>
            <tr>
                <td align="right">����˵��:&nbsp</td>
                <td align="left">
					<font color="red">KFMM0CC88|1|0|BANK|ARRIVEPAY|1|</font>
                </td>
            </tr>
            <tr>
                <td align="right">����˵��:&nbsp</td>
                <td align="left">
					�����̱���:���ڵĺ�����<br>
					�Ƿ�ɷ��𶩹�:ֻ��������0��1<br>
					�Ƿ��ӡ��Ʊ:ֻ��������0��1<br>
					�ɷѷ�ʽ:ADPAY���������̵��ʡ�BANK�������л��ۡ�CASH�����ֽ�POS����POS��<br>
					�ͻ���ʽ:ARRIVEPAY�����������PAYFIRST�������տ����ͻ�<br>
					�Ƿ�ɶ�������:ֻ��������0��1<br>
					<font color="red">ע����ɫ���ֱ�ʾ�����</font>
				</td>
            </tr>
        </table>
        </s:i18n>
    </div>
</aa:zone>
    <div class="table_div">
        <table class="table_button_list">
            <tr>
                <td width="100%" align="center">
                   	<s:i18n name="public">
                    <input type="button" id="btnUpload" name="btnUpload" class="button_2" onmouseover="buttonover(this);" 
                           onmouseout="buttonout(this);" onfocus="buttonover(this)" onblur="buttonout(this)"
                           value="�ϴ�" onclick="upload('/sales/wayassistant_upload.do')"/>
                    
                   
                    <input type="button"  id="btnDeal" name="btnDeal" class="button_2" onmouseover="buttonover(this);" 
                    	   onmouseout="buttonout(this);" onfocus="buttonover(this)" onblur="buttonout(this)"
                           value="<s:text name="button_deal"/>" onclick="checkProcess('/sales/wayassistant_import.do');"/>
					
					 <input type="button" id="btnReturn" name="btnReturn" class="button_Back" onmouseover="buttonover(this);" 
                    	   		onmouseout="buttonout(this);" onfocus="buttonover(this)" onblur="buttonout(this)"
                           		value="<s:text name="button_return"/>" onclick="doReturnList()">
					
					</s:i18n>
                </td>
            </tr>
        </table>
    </div>
    
</s:form>

<iframe src="<%=contextPath%>/common/commonStatus.jsp?beanname=com.gmcc.pboss.web.sales.wayassistant.WayassistantTaskBean" frameborder="0" class="loadframe" id="loadframe" scrolling="no">
</iframe>
</div>
</body>
</html>