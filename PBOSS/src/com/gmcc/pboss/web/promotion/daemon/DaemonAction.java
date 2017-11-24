/**
 * auto-generated code
 * Thu Sep 17 10:37:46 CST 2009
 */
package com.gmcc.pboss.web.promotion.daemon;

import com.gmcc.pboss.business.promotion.daemon.DaemonVO;
import com.sunrise.jop.ui.struts2.BaseAction;
import com.gmcc.pboss.business.promotion.daemon.DaemonDBParam;
import com.gmcc.pboss.control.promotion.daemon.Daemon;

/**
 * <p>Title: DaemonAction </p>;
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2006</p>
 * <p>Company: sunrise Tech Ltd.</p>
 * @author 
 * @version 1.0
 */
public class DaemonAction extends BaseAction {

	public DaemonAction() {
		super();

		//以下几个方法是必须的
		this.setForm(new DaemonForm());
		this.setParam(new DaemonWebParam());

		//指定VO类
		setClsVO(DaemonVO.class);
		//指定主键数组，如果是复合主键，则需指定全部复合主键的字段名称
		this.pkNameArray = new String[] { "seqid" };
		this.setClsControl(Daemon.class);
		this.setClsQueryParam(DaemonDBParam.class);

		/**
		 * 如果指定以下两个属性，那么BaseAction的CRUD将会调用指定的Delegate，一般情况下不必指定
		 * this.setClsDelegate(ExampleDelegate.class);
		 * this.setClsQueryParam(ExampleDBParam.class);
		 */
	}
}