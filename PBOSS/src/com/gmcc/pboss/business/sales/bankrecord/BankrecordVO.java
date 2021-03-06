package com.gmcc.pboss.business.sales.bankrecord;

import com.gmcc.pboss.business.sales.bankrecordlog.BankrecordlogVO;
import com.sunrise.jop.infrastructure.db.BaseVO;
import com.sunrise.jop.infrastructure.sysadmin.BusinessLog;

import java.io.Serializable;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;

/** @author Hibernate CodeGenerator */
public class BankrecordVO extends BaseVO implements Serializable ,BusinessLog {

    /** identifier field */
    private Long deductid;

    /** nullable persistent field */
    private String orafileid;

    /** nullable persistent field */
    private String account;

    /** nullable persistent field */
    private String accountname;

    /** nullable persistent field */
    private Double amount;

    /** nullable persistent field */
    private java.util.Date completetime;

    /** nullable persistent field */
    private java.util.Date creatdate;

    /** nullable persistent field */
    private String shopnum;

    /** nullable persistent field */
    private String custuserid;

    /** nullable persistent field */
    private String retcode;

    /** nullable persistent field */
    private String errmsg;

    /** nullable persistent field */
    private String remark;

    /** nullable persistent field */
    private String countyid;

    /** nullable persistent field */
    private String recordinfo;

    /** nullable persistent field */
    private Short recordstate;

    /** full constructor */
    public BankrecordVO(java.lang.Long deductid, java.lang.String orafileid, java.lang.String account, java.lang.String accountname, java.lang.Double amount, java.util.Date completetime, java.util.Date creatdate, java.lang.String shopnum, java.lang.String custuserid, java.lang.String retcode, java.lang.String errmsg, java.lang.String remark, java.lang.String countyid, java.lang.String recordinfo, java.lang.Short recordstate) {
        this.deductid = deductid;
        this.orafileid = orafileid;
        this.account = account;
        this.accountname = accountname;
        this.amount = amount;
        this.completetime = completetime;
        this.creatdate = creatdate;
        this.shopnum = shopnum;
        this.custuserid = custuserid;
        this.retcode = retcode;
        this.errmsg = errmsg;
        this.remark = remark;
        this.countyid = countyid;
        this.recordinfo = recordinfo;
        this.recordstate = recordstate;
    }

    /** default constructor */
    public BankrecordVO() {
    }

    /** minimal constructor */
    public BankrecordVO(java.lang.Long deductid) {
        this.deductid = deductid;
    }

    public java.lang.Long getDeductid() {
        return this.deductid;
    }

    public void setDeductid(java.lang.Long deductid) {
        this.deductid = deductid;
    }

    public java.lang.String getOrafileid() {
        return this.orafileid;
    }

    public void setOrafileid(java.lang.String orafileid) {
        this.orafileid = orafileid;
    }

    public java.lang.String getAccount() {
        return this.account;
    }

    public void setAccount(java.lang.String account) {
        this.account = account;
    }

    public java.lang.String getAccountname() {
        return this.accountname;
    }

    public void setAccountname(java.lang.String accountname) {
        this.accountname = accountname;
    }

    public java.lang.Double getAmount() {
        return this.amount;
    }

    public void setAmount(java.lang.Double amount) {
        this.amount = amount;
    }

    public java.util.Date getCompletetime() {
        return this.completetime;
    }

    public void setCompletetime(java.util.Date completetime) {
        this.completetime = completetime;
    }

    public java.util.Date getCreatdate() {
        return this.creatdate;
    }

    public void setCreatdate(java.util.Date creatdate) {
        this.creatdate = creatdate;
    }

    public java.lang.String getShopnum() {
        return this.shopnum;
    }

    public void setShopnum(java.lang.String shopnum) {
        this.shopnum = shopnum;
    }

    public java.lang.String getCustuserid() {
        return this.custuserid;
    }

    public void setCustuserid(java.lang.String custuserid) {
        this.custuserid = custuserid;
    }

    public java.lang.String getRetcode() {
        return this.retcode;
    }

    public void setRetcode(java.lang.String retcode) {
        this.retcode = retcode;
    }

    public java.lang.String getErrmsg() {
        return this.errmsg;
    }

    public void setErrmsg(java.lang.String errmsg) {
        this.errmsg = errmsg;
    }

    public java.lang.String getRemark() {
        return this.remark;
    }

    public void setRemark(java.lang.String remark) {
        this.remark = remark;
    }

    public java.lang.String getCountyid() {
        return this.countyid;
    }

    public void setCountyid(java.lang.String countyid) {
        this.countyid = countyid;
    }

    public java.lang.String getRecordinfo() {
        return this.recordinfo;
    }

    public void setRecordinfo(java.lang.String recordinfo) {
        this.recordinfo = recordinfo;
    }

    public java.lang.Short getRecordstate() {
        return this.recordstate;
    }

    public void setRecordstate(java.lang.Short recordstate) {
        this.recordstate = recordstate;
    }

    public String toString() {
        return new ToStringBuilder(this)
            .append("deductid", getDeductid())
            .toString();
    }

    public boolean equals(Object other) {
        if ( !(other instanceof BankrecordVO) ) return false;
        BankrecordVO castOther = (BankrecordVO) other;
        return new EqualsBuilder()
            .append(this.getDeductid(), castOther.getDeductid())
            .isEquals();
    }

    public int hashCode() {
        return new HashCodeBuilder()
            .append(getDeductid())
            .toHashCode();
    }

	public Class logVOClass() {
		// TODO Auto-generated method stub
		return BankrecordlogVO.class;
	}

}
