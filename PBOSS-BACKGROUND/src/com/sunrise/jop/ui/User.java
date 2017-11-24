package com.sunrise.jop.ui;

import java.util.Date;

import com.sunrise.jop.infrastructure.db.DBAccessUser;

/**
 * <p>
 * Title: GDIBOSS
 * </p>
 * 
 * <p>
 * Description:
 * </p>
 * 
 * <p>
 * Copyright: Copyright (c) 2005
 * </p>
 * 
 * <p>
 * Company: sunrise Tech Ltd.
 * </p>
 * 
 * @author HuangBaiming
 * @author He Kun 
 * 
 * @version 1.0
 */
public class User extends DBAccessUser {
	private static final long serialVersionUID = 3628497740671279410L;

	private String opername; //����Ա���� 
	
	private String password; //����Ա����
	
	private String wayid;	//����

	private Date logintime; //��½ʱ��
	
	private String validateCode; //��֤��
	
	private String sessionID;
	
	private boolean provinceUser = false; //�Ƿ�ȫʡ�û�
	
	private String safewordMessage; //ѡ����ŵ�½
	
	private String hwcityid; //��Ϊ���õĵ���ID(����)
	
	public Date getLogintime() {
		return logintime;
	}

	public String getOpername() {
		return opername;
	}

	public String getWayid() {
		return wayid;
	}

	public void setLogintime(Date logintime) {
		this.logintime = logintime;
	}

	public void setOpername(String opername) {
		this.opername = opername;
	}

	public void setWayid(String wayid) {
		this.wayid = wayid;
	}

	public boolean isProvinceUser() {
		return provinceUser;
	}

	public void setProvinceUser(boolean provinceUser) {
		this.provinceUser = provinceUser;
	}
	
	public String getValidateCode() {
		return validateCode;
	}

	public void setValidateCode(String validateCode) {
		this.validateCode = validateCode;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSessionID() {
		return sessionID;
	}

	public void setSessionID(String sessionID) {
		this.sessionID = sessionID;
	}

	public static long getSerialVersionUID() {
		return serialVersionUID;
	}

	public String getSafewordMessage() {
		return safewordMessage;
	}

	public void setSafewordMessage(String safewordMessage) {
		this.safewordMessage = safewordMessage;
	}

	public String getHwcityid() {
		return hwcityid;
	}

	public void setHwcityid(String hwcityid) {
		this.hwcityid = hwcityid;
	}
}