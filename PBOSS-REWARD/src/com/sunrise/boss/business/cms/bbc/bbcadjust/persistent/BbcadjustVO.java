package com.sunrise.boss.business.cms.bbc.bbcadjust.persistent;

import java.io.Serializable;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;

import com.sunrise.boss.business.cms.bbc.bbcadjustlog.persistent.BbcadjustlogVO;
import com.sunrise.boss.business.common.dblog.OperationLog;

/** @author Hibernate CodeGenerator */
public class BbcadjustVO implements OperationLog {

    /** identifier field */
    private Long seq;

    /** nullable persistent field */
    private String adjustkind;

    /** nullable persistent field */
    private String wayid;

    /** nullable persistent field */
    private String eftmonth;

    /** nullable persistent field */
    private Double adjmoney;

    /** nullable persistent field */
    private String adjusttype;

    /** nullable persistent field */
    private String reasontype;

    /** nullable persistent field */
    private String remark;

    /** nullable persistent field */
    private String createoprcode;

    /** nullable persistent field */
    private java.util.Date createtime;

    /** nullable persistent field */
    private String updateoprcode;

    /** nullable persistent field */
    private java.util.Date updatetime;

    /** nullable persistent field */
    private Long relateseq;

    /** nullable persistent field */
    private Double actualmoney;

    /** nullable persistent field */
    private Short rewardtype;

    /** nullable persistent field */
    private Short islock;

    /** nullable persistent field */
    private String adtoprcode;

    /** nullable persistent field */
    private java.util.Date adttime;

    /** nullable persistent field */
    private String srcmonth;
    
	private Short ossrc;
	
	private String mobile;

    /** full constructor */
    public BbcadjustVO(java.lang.Long seq, java.lang.String adjustkind, java.lang.String wayid, java.lang.String eftmonth, java.lang.Double adjmoney, java.lang.String adjusttype, java.lang.String reasontype, java.lang.String remark, java.lang.String createoprcode, java.util.Date createtime, java.lang.String updateoprcode, java.util.Date updatetime, java.lang.Long relateseq, java.lang.Double actualmoney, java.lang.Short rewardtype, java.lang.Short islock, java.lang.String adtoprcode, java.util.Date adttime, java.lang.String srcmonth, java.lang.Short ossrc, java.lang.String mobile) {
        this.seq = seq;
        this.adjustkind = adjustkind;
        this.wayid = wayid;
        this.eftmonth = eftmonth;
        this.adjmoney = adjmoney;
        this.adjusttype = adjusttype;
        this.reasontype = reasontype;
        this.remark = remark;
        this.createoprcode = createoprcode;
        this.createtime = createtime;
        this.updateoprcode = updateoprcode;
        this.updatetime = updatetime;
        this.relateseq = relateseq;
        this.actualmoney = actualmoney;
        this.rewardtype = rewardtype;
        this.islock = islock;
        this.adtoprcode = adtoprcode;
        this.adttime = adttime;
        this.srcmonth = srcmonth;
        this.ossrc = ossrc;
        this.mobile = mobile;
    }

    /** default constructor */
    public BbcadjustVO() {
    }

    /** minimal constructor */
    public BbcadjustVO(java.lang.Long seq) {
        this.seq = seq;
    }

    public java.lang.Long getSeq() {
        return this.seq;
    }

    public void setSeq(java.lang.Long seq) {
        this.seq = seq;
    }

    public java.lang.String getAdjustkind() {
        return this.adjustkind;
    }

    public void setAdjustkind(java.lang.String adjustkind) {
        this.adjustkind = adjustkind;
    }

    public java.lang.String getWayid() {
        return this.wayid;
    }

    public void setWayid(java.lang.String wayid) {
        this.wayid = wayid;
    }

    public java.lang.String getEftmonth() {
        return this.eftmonth;
    }

    public void setEftmonth(java.lang.String eftmonth) {
        this.eftmonth = eftmonth;
    }

    public java.lang.Double getAdjmoney() {
        return this.adjmoney;
    }

    public void setAdjmoney(java.lang.Double adjmoney) {
        this.adjmoney = adjmoney;
    }

    public java.lang.String getAdjusttype() {
        return this.adjusttype;
    }

    public void setAdjusttype(java.lang.String adjusttype) {
        this.adjusttype = adjusttype;
    }

    public java.lang.String getReasontype() {
        return this.reasontype;
    }

    public void setReasontype(java.lang.String reasontype) {
        this.reasontype = reasontype;
    }

    public java.lang.String getRemark() {
        return this.remark;
    }

    public void setRemark(java.lang.String remark) {
        this.remark = remark;
    }

    public java.lang.String getCreateoprcode() {
        return this.createoprcode;
    }

    public void setCreateoprcode(java.lang.String createoprcode) {
        this.createoprcode = createoprcode;
    }

    public java.util.Date getCreatetime() {
        return this.createtime;
    }

    public void setCreatetime(java.util.Date createtime) {
        this.createtime = createtime;
    }

    public java.lang.String getUpdateoprcode() {
        return this.updateoprcode;
    }

    public void setUpdateoprcode(java.lang.String updateoprcode) {
        this.updateoprcode = updateoprcode;
    }

    public java.util.Date getUpdatetime() {
        return this.updatetime;
    }

    public void setUpdatetime(java.util.Date updatetime) {
        this.updatetime = updatetime;
    }

    public java.lang.Long getRelateseq() {
        return this.relateseq;
    }

    public void setRelateseq(java.lang.Long relateseq) {
        this.relateseq = relateseq;
    }

    public java.lang.Double getActualmoney() {
        return this.actualmoney;
    }

    public void setActualmoney(java.lang.Double actualmoney) {
        this.actualmoney = actualmoney;
    }

    public java.lang.Short getRewardtype() {
        return this.rewardtype;
    }

    public void setRewardtype(java.lang.Short rewardtype) {
        this.rewardtype = rewardtype;
    }

    public java.lang.Short getIslock() {
        return this.islock;
    }

    public void setIslock(java.lang.Short islock) {
        this.islock = islock;
    }

    public java.lang.String getAdtoprcode() {
        return this.adtoprcode;
    }

    public void setAdtoprcode(java.lang.String adtoprcode) {
        this.adtoprcode = adtoprcode;
    }

    public java.util.Date getAdttime() {
        return this.adttime;
    }

    public void setAdttime(java.util.Date adttime) {
        this.adttime = adttime;
    }

    public java.lang.String getSrcmonth() {
        return this.srcmonth;
    }

    public void setSrcmonth(java.lang.String srcmonth) {
        this.srcmonth = srcmonth;
    }

    public String toString() {
        return new ToStringBuilder(this)
            .append("seq", getSeq())
            .toString();
    }

    public boolean equals(Object other) {
        if ( !(other instanceof BbcadjustVO) ) return false;
        BbcadjustVO castOther = (BbcadjustVO) other;
        return new EqualsBuilder()
            .append(this.getSeq(), castOther.getSeq())
            .isEquals();
    }

    public int hashCode() {
        return new HashCodeBuilder()
            .append(getSeq())
            .toHashCode();
    }

	public Class logVOClass() {
		// TODO Auto-generated method stub
		return BbcadjustlogVO.class;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public Short getOssrc() {
		return ossrc;
	}

	public void setOssrc(Short ossrc) {
		this.ossrc = ossrc;
	}

}
