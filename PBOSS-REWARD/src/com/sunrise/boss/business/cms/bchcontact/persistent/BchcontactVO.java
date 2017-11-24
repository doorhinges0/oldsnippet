package com.sunrise.boss.business.cms.bchcontact.persistent;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;

import com.sunrise.boss.business.cms.bchcontlog.persistent.BchcontlogVO;
import com.sunrise.boss.business.common.dblog.OperationLog;

/** @author Hibernate CodeGenerator */
public class BchcontactVO implements OperationLog {

	/** identifier field */
	private String wayid;

	/** persistent field */
	private String principal;

	/** persistent field */
	private String principaltel;

	/** persistent field */
	private String linkman;

	/** persistent field */
	private String linkmantel;

	/** nullable persistent field */
	private String hotline;

	/** nullable persistent field */
	private String fax;

	/** nullable persistent field */
	private String address;

	/** nullable persistent field */
	private String zipcode;

	private String principalphone;

	private String principalemail;

	private String linkmanemail;

	private Short bailtype;

	private Short servbound;

	private Integer coplevel;

	private String busnum;

	private Integer certitype;

	private String certinum;

	private String regadress;

	private Long regcapital;

	private String company;
	
	private String provcode;

	private String brole;
	
	private String  companytype;
	
	public String getProvcode() {
		return provcode;
	}

	public void setProvcode(String provcode) {
		this.provcode = provcode;
	}

	public Short getBailtype() {
		return bailtype;
	}

	public void setBailtype(Short bailtype) {
		this.bailtype = bailtype;
	}

	/** full constructor */
	public BchcontactVO(java.lang.String wayid, java.lang.String principal,
			java.lang.String principaltel, java.lang.String linkman,
			java.lang.String linkmantel, java.lang.String hotline,
			java.lang.String fax, java.lang.String address,
			java.lang.String zipcode, String principalphone,
			String principalemail, String linkmanemail,String provcode) {
		this.wayid = wayid;
		this.principal = principal;
		this.principaltel = principaltel;
		this.linkman = linkman;
		this.linkmantel = linkmantel;
		this.hotline = hotline;
		this.fax = fax;
		this.address = address;
		this.zipcode = zipcode;
		this.principalemail = principalemail;
		this.principalphone = principalphone;
		this.linkmanemail = linkmanemail;
		this.provcode=provcode;
	}

	/** default constructor */
	public BchcontactVO() {
	}

	/** minimal constructor */
	public BchcontactVO(java.lang.String wayid, java.lang.String principal,
			java.lang.String principaltel, java.lang.String linkman,
			java.lang.String linkmantel) {
		this.wayid = wayid;
		this.principal = principal;
		this.principaltel = principaltel;
		this.linkman = linkman;
		this.linkmantel = linkmantel;
	}

	public java.lang.String getWayid() {
		return this.wayid;
	}

	public void setWayid(java.lang.String wayid) {
		this.wayid = wayid;
	}

	public java.lang.String getPrincipal() {
		return this.principal;
	}

	public void setPrincipal(java.lang.String principal) {
		this.principal = principal;
	}

	public java.lang.String getPrincipaltel() {
		return this.principaltel;
	}

	public void setPrincipaltel(java.lang.String principaltel) {
		this.principaltel = principaltel;
	}

	public java.lang.String getLinkman() {
		return this.linkman;
	}

	public void setLinkman(java.lang.String linkman) {
		this.linkman = linkman;
	}

	public java.lang.String getLinkmantel() {
		return this.linkmantel;
	}

	public String getLinkmanemail() {
		return linkmanemail;
	}

	public void setLinkmanemail(String linkmanemail) {
		this.linkmanemail = linkmanemail;
	}

	public String getPrincipalemail() {
		return principalemail;
	}

	public void setPrincipalemail(String principalemail) {
		this.principalemail = principalemail;
	}

	public String getPrincipalphone() {
		return principalphone;
	}

	public void setPrincipalphone(String principalphone) {
		this.principalphone = principalphone;
	}

	public void setLinkmantel(java.lang.String linkmantel) {
		this.linkmantel = linkmantel;
	}

	public java.lang.String getHotline() {
		return this.hotline;
	}

	public void setHotline(java.lang.String hotline) {
		this.hotline = hotline;
	}

	public java.lang.String getFax() {
		return this.fax;
	}

	public void setFax(java.lang.String fax) {
		this.fax = fax;
	}

	public java.lang.String getAddress() {
		return this.address;
	}

	public void setAddress(java.lang.String address) {
		this.address = address;
	}

	public java.lang.String getZipcode() {
		return this.zipcode;
	}

	public void setZipcode(java.lang.String zipcode) {
		this.zipcode = zipcode;
	}

	public String toString() {
		return new ToStringBuilder(this).append("wayid", getWayid()).toString();
	}

	public boolean equals(Object other) {
		if (!(other instanceof BchcontactVO))
			return false;
		BchcontactVO castOther = (BchcontactVO) other;
		return new EqualsBuilder()
				.append(this.getWayid(), castOther.getWayid()).isEquals();
	}

	public int hashCode() {
		return new HashCodeBuilder().append(getWayid()).toHashCode();
	}

	public Class logVOClass() {
		return BchcontlogVO.class;
	}

	public Short getServbound() {
		return servbound;
	}

	public void setServbound(Short servbound) {
		this.servbound = servbound;
	}

	public String getBusnum() {
		return busnum;
	}

	public void setBusnum(String busnum) {
		this.busnum = busnum;
	}

	public String getCertinum() {
		return certinum;
	}

	public void setCertinum(String certinum) {
		this.certinum = certinum;
	}

	public Integer getCertitype() {
		return certitype;
	}

	public void setCertitype(Integer certitype) {
		this.certitype = certitype;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public Integer getCoplevel() {
		return coplevel;
	}

	public void setCoplevel(Integer coplevel) {
		this.coplevel = coplevel;
	}

	public String getRegadress() {
		return regadress;
	}

	public void setRegadress(String regadress) {
		this.regadress = regadress;
	}

	public Long getRegcapital() {
		return regcapital;
	}

	public void setRegcapital(Long regcapital) {
		this.regcapital = regcapital;
	}

	public String getBrole() {
		return brole;
	}

	public void setBrole(String brole) {
		this.brole = brole;
	}

	public String getCompanytype() {
		return companytype;
	}

	public void setCompanytype(String companytype) {
		this.companytype = companytype;
	}
}
