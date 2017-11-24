/**
 * auto-generated code
 * Tue Jan 17 09:54:18 CST 2012
 */
 package com.gmcc.pboss.web.sales.bankrecordlog;

import com.gmcc.pboss.business.sales.bankrecordlog.BankrecordlogVO ;
import com.sunrise.jop.ui.struts2.BaseAction ;
import com.gmcc.pboss.business.sales.bankrecordlog.BankrecordlogDBParam;
import com.gmcc.pboss.control.sales.bankrecordlog.Bankrecordlog ;

/**
 * <p>Title: BankrecordlogAction </p>;
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2006</p>
 * <p>Company: sunrise Tech Ltd.</p>
 * @author dengxingxin
 * @version 1.0
 */
public class BankrecordlogAction extends BaseAction{
	
	public BankrecordlogAction() {
		super();

		//以下几个方法是必须的
		this.setForm(new BankrecordlogForm());
		this.setParam(new BankrecordlogDBParam());

        //指定VO类
        setClsVO(BankrecordlogVO.class);
        //指定主键数组，如果是复合主键，则需指定全部复合主键的字段名称
        this.pkNameArray=new String[]{"logid"};
		this.setClsControl(Bankrecordlog.class);
		this.setClsQueryParam(BankrecordlogDBParam.class) ;

		/**
		 * 如果指定以下两个属性，那么BaseAction的CRUD将会调用指定的Delegate，一般情况下不必指定
		 * this.setClsDelegate(ExampleDelegate.class);
		 * this.setClsQueryParam(ExampleDBParam.class);
		 */
	}
}