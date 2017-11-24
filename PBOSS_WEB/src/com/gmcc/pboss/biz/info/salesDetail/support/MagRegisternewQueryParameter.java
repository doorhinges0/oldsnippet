package com.gmcc.pboss.biz.info.salesDetail.support;

import java.util.Date;

import com.gmcc.pboss.common.support.QueryParameter;

public class MagRegisternewQueryParameter extends QueryParameter {

	//网店编码
	private String wayid;
	public String getWayid() {
		return wayid;
	}
	public void setWayid(String wayid) {
		this.wayid = wayid;
	}
	//店员姓名-工号
	private String oprcode;
	public void setOprcode(String oprcode){
		this.oprcode = oprcode;
	}
	public String getOprcode(){
		return this.oprcode;
	}
	//分公司
	private String countyid;
	public String getCountyid() {
		return countyid;
	}
	public void setCountyid(String countyid) {
		this.countyid = countyid;
	}
	//销售服务中心
	private String svccode;
	public String getSvccode() {
		return svccode;
	}
	public void setSvccode(String svccode) {
		this.svccode = svccode;
	}
	//业务编码
	private String opnid;
	public void setOpnid(String opnid){
		this.opnid = opnid;
	}
	public String getOpnid(){
		return this.opnid;
	}
	//品牌
	private String brand;
	public void setBrand(String b){
		this.brand = b;
	}
	public String getBrand(){
		return this.brand;
	}
	//开始时间
	private Date timeFrom;
	public void setTimeFrom(Date timeFrom){
		this.timeFrom = timeFrom;
	}
	public Date getTimeFrom(){
		return this.timeFrom;
	}
	//结束时间
	private Date timeTo;
	public void setTimeTo(Date timeTo){
		this.timeTo = timeTo;
	}
	public Date getTimeTo(){			
		return this.timeTo;
	}
	
	//地市id
	private String cityid;
	public String getCityid() {
		return cityid;
	}
	public void setCityid(String cityid) {
		this.cityid = cityid;
	}
	
	//经理人员id-在用户查询未限定网点编码的情况下，
	//限定只能查询经理所属网点，否则查询范围会放大
	private String waymagcode;
	public String getWaymagcode() {
		return waymagcode;
	}
	public void setWaymagcode(String waymagcode) {
		this.waymagcode = waymagcode;
	}
}
