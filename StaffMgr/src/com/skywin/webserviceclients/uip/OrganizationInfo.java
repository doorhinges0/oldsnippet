// Helper class generated by xrpcc, do not edit.
// Contents subject to change without notice.

package com.skywin.webserviceclients.uip;


public class OrganizationInfo {
    private int queryResult;
    private com.skywin.webserviceclients.uip.OrgDetail[] orgInfo;
    
    public OrganizationInfo() {
    }
    
    public OrganizationInfo(int queryResult, com.skywin.webserviceclients.uip.OrgDetail[] orgInfo) {
        this.queryResult = queryResult;
        this.orgInfo = orgInfo;
    }
    
    public int getQueryResult() {
        return queryResult;
    }
    
    public void setQueryResult(int queryResult) {
        this.queryResult = queryResult;
    }
    
    public com.skywin.webserviceclients.uip.OrgDetail[] getOrgInfo() {
        return orgInfo;
    }
    
    public void setOrgInfo(com.skywin.webserviceclients.uip.OrgDetail[] orgInfo) {
        this.orgInfo = orgInfo;
    }
}
