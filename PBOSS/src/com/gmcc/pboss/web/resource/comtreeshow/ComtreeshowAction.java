/**
 * auto-generated code
 * Wed Sep 09 09:21:23 CST 2009
 */
 package com.gmcc.pboss.web.resource.comtreeshow;

import com.gmcc.pboss.business.resource.comtreeshow.ComtreeshowVO ;
import com.sunrise.jop.ui.struts2.BaseAction ;
import com.gmcc.pboss.business.resource.comtreeshow.ComtreeshowDBParam;
import com.gmcc.pboss.control.resource.comtreeshow.Comtreeshow ;

/**
 * <p>Title: ComtreeshowAction </p>;
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2006</p>
 * <p>Company: sunrise Tech Ltd.</p>
 * @author linli
 * @version 1.0
 */
public class ComtreeshowAction extends BaseAction{
	
	public ComtreeshowAction() {
		super();

		//以下几个方法是必须的
		this.setForm(new ComtreeshowForm());
		this.setParam(new ComtreeshowWebParam());

        //指定VO类
        setClsVO(ComtreeshowVO.class);
        //指定主键数组，如果是复合主键，则需指定全部复合主键的字段名称
        this.pkNameArray=new String[]{"cityid","comclassid","comtype","wayid"};
		this.setClsControl(Comtreeshow.class);
		this.setClsQueryParam(ComtreeshowDBParam.class) ;

		/**
		 * 如果指定以下两个属性，那么BaseAction的CRUD将会调用指定的Delegate，一般情况下不必指定
		 * this.setClsDelegate(ExampleDelegate.class);
		 * this.setClsQueryParam(ExampleDBParam.class);
		 */
	}
}