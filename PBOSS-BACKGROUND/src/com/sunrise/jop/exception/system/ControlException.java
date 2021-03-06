package com.sunrise.jop.exception.system;

import com.sunrise.jop.exception.JOPException;

/**
 * <p>Title: GDIBOSS</p>
 *
 * <p>Description: </p>
 *
 * <p>Copyright: Copyright (c) 2005</p>
 *
 * <p>Company: sunrise Tech Ltd.</p>
 *
 * @author HuangBaiming
 *
 * @version 1.0
 */
public class ControlException extends JOPException {
	public static final String ERROR_CODE_CONTROL_COMMON = "control.common";
	/**
	 * @param errorCode  �������
	 */
	public ControlException(String errorCode) {
		super (toMessage(JOPException.class, checkErrorCode(errorCode), ""));
		setErrorCode(errorCode);
	}
	
	public ControlException(String message, Throwable cause) {
		super(message, cause);
	}

	public ControlException(String errorCode, String[] msgParam, Throwable cause) {
		super (toMessage(ServiceLocatorException.class, checkErrorCode(errorCode),msgParam), cause);
		setErrorCode(errorCode);
	}

	public ControlException(String errorCode, String msgParam, Throwable cause) {
		super (toMessage(ServiceLocatorException.class, checkErrorCode(errorCode), msgParam), cause);
		setErrorCode(errorCode);
	}

	protected static String checkErrorCode(String errorCode){
		return (errorCode==null)?ERROR_CODE_CONTROL_COMMON:errorCode;
	}

}
