<%@ page language="java" contentType="text/html;charset=GBK" %>
<%@ include file="/inc/listhead.inc" %>
<html>
<head>
    <title><s:text name="��Դ����"/></title>
    <script language="JavaScript" type="text/JavaScript">
	    function checkProcess(){
			var filename = formItem.path.value;
			if(filename != null || filename != ""){
	    		formItem.btnDeal.disabled=true;
	    		document.getElementById("importUrl").href="<%=contextPath%>/resource/comressmp_rescallback.do?filename="+filename+"&beanname=com.gmcc.pboss.web.resource.comressmp.RescallbackTaskBean";
	    		document.getElementById("importUrl").click();
				
			}
		}
	$(document).ready(function(){ 
		var filename ="<s:property value="fileName" />";
	     if(filename == null || filename == '' ){
	   	 	$("#btnDeal").attr('disabled',true);
	     }
	     else{
		      $("#btnDeal").attr('disabled',false);
		      
	      }
        $(":select[name='callbacktype']").val('<s:property value="formMap.callbacktype" />');
   });
   
   
   function disablediv(select){
			var oDiv = select.value;
			
			if(oDiv == "EMPTYSIM" ){
				document.getElementById("emptysim_div").innerHTML = "<font color=red>�հ׿����к�|��Ʒ��ʶ|</font>";
			}else{
				document.getElementById("emptysim_div").innerHTML = "<font color=red>��Ʒ��Դ���|��Ʒ��ʶ|</font>";
			} 
		} 
   
   
   
    </script>
    <base target="_self">
</head>
<body class="list_body" onload="if(window.loadforiframe) loadforiframe();">
<div class="table_container">
<s:form action="/resource/comressmp_rescallbackupload.do" cssStyle="formItem" key="formItem" 
			method="post" theme="simple" enctype ="multipart/form-data" >
    <a id="importUrl" href="#"></a>
	<div class="table_top">
		<div class="table_topleft"></div>
		<div class="table_toparea_w">
			<s:i18n name="public">
			<span class="table_toparea"><s:text name="currentPos"/> </span>
			<span class="table_toparea_xi">></span>
			<span class="table_toparea"><s:text name="resource"/> </span>
			<span class="table_toparea_xi">></span>
			<span class="table_toparea_h">��Դ����</span>
			</s:i18n>
		</div>
	</div>

<input type="hidden" name="filename" value='<s:property value="fileName"/>'>
    <input type="hidden" name="path" value='<s:property value="filepath"/>'>
    <input type="hidden" name="iCheckFormat" value="com.gmcc.pboss.web.resource.comressmp.RescallbackCheck">
    <aa:zone name="errorZone">
		<div class="error_text" >
			<table class="error_text">
				<s:actionerror /><s:actionmessage/>
			</table>
		</div>
    </aa:zone>
	
	<aa:zone name="listZone">
    <div class="table_div">
    <s:i18n name="public">
         <table class="table_normal">
            <tr >
                <td align="right">��ѡ���ϴ��ļ�:&nbsp</td>
                <td align="left">
					<s:file name="doc" label="File"/>
                </td>
            </tr>
            <tr >
                <td align="right"><s:text name="file_file"/>:&nbsp</td>
                <td align="left">
					<a href='<%=contextPath%>/common/download.jsp?filename=<s:property value="filepath" />'> 
					<s:property value="fileName" /> 
            	</a>
                </td>
            </tr>
            <tr >
                <td align="right">��Դ���:&nbsp</td>
                <td align="left">
					 <j:selector definition="CALLBACKTYPE" name="callbacktype" onchange="disablediv(this)"/><font color=red>*</font>
                </td>
            </tr>
            <tr >
                <td align="right"><s:text name="file_type"/>:&nbsp</td>
                <td align="left">
					<s:text name="file_type_txt_describe"/>
                </td>
            </tr>
            <tr >
                <td align="right"><s:text name="file_format"/>:&nbsp</td>
                <td align="left"  id="emptysim_div" >
                	
                </td>
            </tr>
            <tr >
                <td align="right" ><s:text name="file_example"/>:&nbsp</td>
                <td align="left" >
                	�׿�<font color=red>13800138000|75701400000294|</font><br>
                	��ֵ��<font color=red>09421195011430190|66002100001175|</font><br>
                                        �հ�SIM��<font color=red>9421195011430190|310008000000077|</font>
                </td>
            </tr>
             <tr >
                <td align="right">����˵��:&nbsp</td>
                <td align="left">
					�ļ���ʽ���ú�ɫ��ǵ��ֶ�Ϊ������ļ������ޱ�����<br>
					��Դ���֧�ֳ�ֵ�����׿��Ϳհ�SIM��������Դ<br/>
					��Ʒ��Դ��ţ���ֵ�������кŻ��׿��ĺ��룬�������ͣ���󳤶�32λ<br/>
					�հ׿����кţ��հ׿������кţ��������ͣ���󳤶�21λ<br/>
					��Ʒ��ʶ���������ͣ���󳤶�18λ<br/>
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
                    <input type="submit" id="btnUpload" name="btnUpload" class="button_2" onmouseover="buttonover(this);" 
                           onmouseout="buttonout(this);" onfocus="buttonover(this)" onblur="buttonout(this)"
                           value="<s:text name="button_upload"/>" />
                    
                   
                    <input type="button"  id="btnDeal" name="btnDeal" class="button_2" onmouseover="buttonover(this);" 
                    	   onmouseout="buttonout(this);" onfocus="buttonover(this)" onblur="buttonout(this)"
                           value="<s:text name="button_deal"/>" onclick="checkProcess();"/>
					</s:i18n>
                </td>
            </tr>
        </table>
    </div>
    
</s:form>
</div>
<iframe src="<%=contextPath%>/common/commonStatus.jsp?beanname=com.gmcc.pboss.web.resource.comressmp.RescallbackTaskBean" frameborder="0" class="loadframe" id="loadframe" scrolling="no">
</iframe>

</body>
</html>