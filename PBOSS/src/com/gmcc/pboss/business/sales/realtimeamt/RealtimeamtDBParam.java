/**
 * auto-generated code
 * Tue Oct 13 09:42:25 CST 2009
 */
package com.gmcc.pboss.business.sales.realtimeamt;

import com.sunrise.jop.infrastructure.db.DBQueryParam;

/**
 * <p>Title: RealtimeamtDBParam </p>;
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2006</p>
 * <p>Company: sunrise Tech Ltd.</p>
 * @author 
 * @version 1.0
 */
public class RealtimeamtDBParam extends DBQueryParam {
	private String _sk_wayid;
	private String _se_brand;
	private String _se_wayid;
	
	public String get_sk_wayid() {
		return _sk_wayid;
	}
	public void set_sk_wayid(String _sk_wayid) {
		this._sk_wayid = _sk_wayid;
	}
	public String get_se_brand() {
		return _se_brand;
	}
	public void set_se_brand(String _se_brand) {
		this._se_brand = _se_brand;
	}
	public String get_se_wayid() {
		return _se_wayid;
	}
	public void set_se_wayid(String _se_wayid) {
		this._se_wayid = _se_wayid;
	}
}
