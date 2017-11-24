package com.gmcc.pboss.BgProcess.cjpt;

import java.util.Iterator;

import org.apache.log4j.Logger;

import com.gmcc.pboss.BgProcess.base.BgCommonBase;
import com.gmcc.pboss.business.channel.ctilog.CtilogDBParam;
import com.gmcc.pboss.business.channel.ctilog.CtilogVO;
import com.gmcc.pboss.control.channel.ctilog.Ctilog;
import com.gmcc.pboss.control.channel.ctilog.CtilogBO;
import com.gmcc.pboss.control.service.sms.resetpassword.SMSResetPasswordPr;
import com.gmcc.pboss.control.service.sms.resetpassword.SMSResetPasswordPrBO;
import com.sunrise.jop.common.utils.lang.LoggerUtils;
import com.sunrise.jop.exception.BusinessException;
import com.sunrise.jop.infrastructure.control.BOFactory;
import com.sunrise.jop.infrastructure.db.DataPackage;
import com.sunrise.jop.ui.User;
/**
 * 【合作平台短信密码重置】短厅接口逻辑
 * @author Yedaoe
 *
 */
public class ResetPasswordBgProcess extends BgCommonBase {
	private static Logger logger = Logger.getLogger(ResetPasswordBgProcess.class);
	
	public static void main(String[] args) throws Exception{

		ResetPasswordBgProcess action = new ResetPasswordBgProcess();
		boolean isPass = action.checkArgs(args);
		if (!isPass) {
			return;
		}
		// 获取User
		User user = action.getUser(args[0]);
		// 设置hibernate配置文件路径（相对于class path的路径）
		action.setHibernateConfigPath("/com/gmcc/pboss/BgProcess/cjpt/hibernate.cfg.xml");
		action.setHibernateCommonConfigPath("/com/gmcc/pboss/BgProcess/cjpt/hibernate_bg.hbm.xml");
		action.setMyProfilePath("/cjpt/resetPassword.properties");
		// 初始化
		action.init(args);
		action.resetPassword(user);
		
	}
	
	private void resetPassword(User user) throws Exception {
		try {
			String sleeptimesecond = properties.getProperty("sleeptimesecond");
			if(sleeptimesecond == null || "".equals(sleeptimesecond)){
				sleeptimesecond = "60";
			}
			Long sleeptimesecond_Long = Long.parseLong(sleeptimesecond);
			
			String pagesize = properties.getProperty("pagesize");
			
			SMSResetPasswordPr bo = (SMSResetPasswordPr) BOFactory.build(
					SMSResetPasswordPrBO.class, user);
			Ctilog ctilog = (Ctilog)BOFactory.build(CtilogBO.class, user);
			CtilogDBParam ctiparam = new CtilogDBParam();
			ctiparam.set_ne_smstype("1");//密码重置
			ctiparam.set_snn_cityid("");//cityid不为空
			ctiparam.set_pagesize(pagesize);
			ctiparam.set_orderby("cityid");
			while(1==1){
				DataPackage dp = ctilog.doQuery(ctiparam);
				if (null==dp || dp.getDatas().size()==0){
					logger.info("=============休眠："+sleeptimesecond_Long+"秒  ==========");
					Thread.sleep(1000*sleeptimesecond_Long);
					continue;
				}else{
					for (Iterator it = dp.getDatas().iterator(); it.hasNext();) {
						try{
							CtilogVO vo = (CtilogVO)it.next();
							String mobile = vo.getMobile();
							String cityid = vo.getCityid();
							
							user.setCityid(cityid);
							bo = (SMSResetPasswordPr) BOFactory.build(
									SMSResetPasswordPrBO.class, user);
							
							logger.info("=============处理手机号为："+mobile+"，开始  ==========");
							bo.doResetPassword(mobile, cityid);
							
							ctilog.doRemoveByVO(vo);
							logger.info("=============处理手机号为："+mobile+"，结束  ==========");
						} catch (Exception e) {
							e.printStackTrace();
							logger.error(e.getMessage());
						}
					}
				}
			}
		}catch(BusinessException ex) {
			ex.printStackTrace();
			logger.info(ex.getMessage());
		}catch(Exception ex) {
			ex.printStackTrace();
			LoggerUtils.error(ex, logger);
		}
	}

}
