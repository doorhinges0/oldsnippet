/**
* auto-generated code
* Tue Jul 09 12:03:37 CST 2013
*/
package com.sunrise.boss.ui.cms.zjty.chzjtynogotonedetail;

import com.sunrise.boss.ui.base.BaseActionForm;

/**
 * <p>Title: ChZjtyNogotonedetailForm</p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2006</p>
 * <p>Company: sunrise Tech Ltd.</p>
 * @author hejw
 * @version 1.0
 */
public class ChZjtyNogotonedetailForm extends BaseActionForm {

    private java.lang.Long recid;
    private java.lang.Long mark;
    private java.lang.String datacontent;
    private java.lang.String type;

    private String _ne_recid;
    private String _ne_mark;
    private String _sk_city;
    private String _se_rewardreporttime;
    
    private boolean query;

    public boolean isQuery() {
		return query;
	}

	public void setQuery(boolean query) {
		this.query = query;
	}

	public java.lang.Long getRecid(){
        return recid;
    }

    public void setRecid(java.lang.Long recid){
        this.recid = recid;
    }
    public java.lang.Long getMark(){
        return mark;
    }

    public void setMark(java.lang.Long mark){
        this.mark = mark;
    }
    public java.lang.String getDatacontent(){
        return datacontent;
    }

    public void setDatacontent(java.lang.String datacontent){
        this.datacontent = datacontent;
    }
    public java.lang.String getType(){
        return type;
    }

    public void setType(java.lang.String type){
        this.type = type;
    }

    public String get_ne_recid(){
        return _ne_recid;
    }

    public void set_ne_recid(String _ne_recid){
        this._ne_recid = _ne_recid;
    }
    public String get_ne_mark(){
        return _ne_mark;
    }

    public void set_ne_mark(String _ne_mark){
        this._ne_mark = _ne_mark;
    }

	public String get_sk_city() {
		return _sk_city;
	}

	public void set_sk_city(String _sk_city) {
		this._sk_city = _sk_city;
	}

	public String get_se_rewardreporttime() {
		return _se_rewardreporttime;
	}

	public void set_se_rewardreporttime(String _se_rewardreporttime) {
		this._se_rewardreporttime = _se_rewardreporttime;
	}

}
