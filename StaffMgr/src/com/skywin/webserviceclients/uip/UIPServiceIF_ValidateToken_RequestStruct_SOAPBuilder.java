// Helper class generated by xrpcc, do not edit.
// Contents subject to change without notice.

package com.skywin.webserviceclients.uip;

import com.sun.xml.rpc.encoding.*;
import java.lang.IllegalArgumentException;

public class UIPServiceIF_ValidateToken_RequestStruct_SOAPBuilder implements SOAPInstanceBuilder {
    private UIPServiceIF_ValidateToken_RequestStruct _instance;
    private java.lang.String string_1;
    private java.lang.String string_2;
    private static final int mySTRING_1_INDEX = 0;
    private static final int mySTRING_2_INDEX = 1;
    
    public UIPServiceIF_ValidateToken_RequestStruct_SOAPBuilder() {
    }
    
    public void setString_1(java.lang.String string_1) {
        this.string_1 = string_1;
    }
    
    public void setString_2(java.lang.String string_2) {
        this.string_2 = string_2;
    }
    
    public int memberGateType(int memberIndex) {
        switch (memberIndex) {
            case mySTRING_1_INDEX:
                return GATES_INITIALIZATION | REQUIRES_CREATION;
            case mySTRING_2_INDEX:
                return GATES_INITIALIZATION | REQUIRES_CREATION;
            default:
                throw new IllegalArgumentException();
        }
    }
    
    public void construct() {
    }
    
    public void setMember(int index, Object memberValue) {
        switch(index) {
            case mySTRING_1_INDEX:
                _instance.setString_1((java.lang.String)memberValue);
                break;
            case mySTRING_2_INDEX:
                _instance.setString_2((java.lang.String)memberValue);
                break;
            default:
                throw new IllegalArgumentException();
        }
    }
    
    public void initialize() {
    }
    
    public void setInstance(Object instance) {
        _instance = (UIPServiceIF_ValidateToken_RequestStruct)instance;
    }
    
    public Object getInstance() {
        return _instance;
    }
}