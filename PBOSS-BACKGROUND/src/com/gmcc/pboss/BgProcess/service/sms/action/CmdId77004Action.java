package com.gmcc.pboss.BgProcess.service.sms.action;

import org.apache.log4j.Logger;

import com.gmcc.pboss.BgProcess.service.sms.SMSProtocol;
import com.gmcc.pboss.BgProcess.service.sms.annotation.MethodLevelPointcut;
import com.gmcc.pboss.control.service.sms.secconfirm.SMSComOrderSecondConfirm;
import com.gmcc.pboss.control.service.sms.secconfirm.SMSComOrderSecondConfirmBO;
import com.gmcc.pboss.service.sms.exception.SMSException;
import com.gmcc.pboss.service.sms.result.SMSResult;
import com.gmcc.pboss.service.sms.utils.SMSUtils;
import com.sunrise.jop.common.utils.lang.StringUtils;
import com.sunrise.jop.infrastructure.control.BOFactory;
import com.sunrise.jop.infrastructure.db.DBAccessUser;

/**
 * 【商品订购二次确认】短信营业厅接口逻辑
 * @author zsw
 *
 */
public class CmdId77004Action extends BaseSocketAction {

	private static Logger logger = Logger.getLogger(CmdId77004Action.class);
	private static String TITLE_COLUMNSIZE = "订单号"
		+ SMSProtocol.WORD_SLIT_SYMBOL + "客户姓名"
		+ SMSProtocol.WORD_END_SYMBOL + "20" + SMSProtocol.WORD_SLIT_SYMBOL
		+ "30";
	@MethodLevelPointcut
	public void execute() {
		// TODO Auto-generated method stub
		String result = comOrderSecConfirm(getRequest().getDataTrans());
		getResponse().setDataTrans(result);
	}
	/**
	 * 77004命令字格式: 用户号码~工号~返回格式~确认流水号~;
	 * @param contextStr
	 * @return
	 * @throws Exception
	 */
	private String comOrderSecConfirm(String contextStr){
		
		String[] datatrans = StringUtils.split(contextStr, SMSProtocol.WORD_SLIT_SYMBOL);
		if(datatrans.length < 4){
			return SMSProtocol.WRONG_FORMAT;
		}
		DBAccessUser user = super.getDbAccessUser();
		if(StringUtils.isEmpty(user.getCityid())) {
			String message = SMSResult.RET_MESSAGE_FAIL_1 + SMSProtocol.WORD_END_SYMBOL
			+ TITLE_COLUMNSIZE + SMSProtocol.WORD_END_SYMBOL
			+ SMSProtocol.WORD_SLIT_SYMBOL + "客户";
			throw new SMSException(message,SMSResult.RET_TYPE_FAIL_1);
		}
		try {
			SMSComOrderSecondConfirm scBO = (SMSComOrderSecondConfirm) BOFactory
					.build(SMSComOrderSecondConfirmBO.class, user);
			return scBO.doResult(datatrans[0], datatrans[3]);
		}catch(Exception e) {
			return SMSUtils.getErrorResult(e, logger);
		}
	}

}
