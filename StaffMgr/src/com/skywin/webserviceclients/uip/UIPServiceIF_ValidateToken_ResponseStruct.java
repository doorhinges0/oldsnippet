// Helper class generated by xrpcc, do not edit.
// Contents subject to change without notice.

package com.skywin.webserviceclients.uip;


public class UIPServiceIF_ValidateToken_ResponseStruct {
    private com.skywin.webserviceclients.uip.AuthResult result;
    
    public UIPServiceIF_ValidateToken_ResponseStruct() {
    }
    
    public UIPServiceIF_ValidateToken_ResponseStruct(com.skywin.webserviceclients.uip.AuthResult result) {
        this.result = result;
    }
    
    public com.skywin.webserviceclients.uip.AuthResult getResult() {
        return result;
    }
    
    public void setResult(com.skywin.webserviceclients.uip.AuthResult result) {
        this.result = result;
    }
}
