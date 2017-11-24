package net.gmcc.pboss.b2mservice;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;
import javax.xml.bind.annotation.XmlSeeAlso;

/**
 * This class was generated by Apache CXF 2.3.8
 * 2014-01-02T14:13:57.664+08:00
 * Generated source version: 2.3.8
 * 
 */
@WebService(targetNamespace = "http://www.gmcc.net/pboss/B2MService/", name = "B2MServicePort")
@XmlSeeAlso({ObjectFactory.class})
@SOAPBinding(parameterStyle = SOAPBinding.ParameterStyle.BARE)
public interface B2MServicePort {

    @WebResult(name = "singlerecordresponse", targetNamespace = "http://www.gmcc.net/pboss/B2MService/", partName = "response")
    @WebMethod(action = "http://www.gmcc.net/pboss/B2MService/singlerecord")
    public Singlerecordresponse singlerecord(
        @WebParam(partName = "request", name = "singlerecordrequest", targetNamespace = "http://www.gmcc.net/pboss/B2MService/")
        Singlerecordrequest request
    );

    @WebResult(name = "monthstatisticresponse", targetNamespace = "http://www.gmcc.net/pboss/B2MService/", partName = "response")
    @WebMethod(action = "http://www.gmcc.net/pboss/B2MService/monthstatistic")
    public Monthstatisticresponse monthstatistic(
        @WebParam(partName = "request", name = "monthstatisticrequest", targetNamespace = "http://www.gmcc.net/pboss/B2MService/")
        Monthstatisticrequest request
    );

    @WebResult(name = "sumstatisticresponse", targetNamespace = "http://www.gmcc.net/pboss/B2MService/", partName = "response")
    @WebMethod(action = "http://www.gmcc.net/pboss/B2MService/sumstatistic")
    public Sumstatisticresponse sumstatistic(
        @WebParam(partName = "request", name = "sumstatisticrequest", targetNamespace = "http://www.gmcc.net/pboss/B2MService/")
        Sumstatisticrequest request
    );

    @WebResult(name = "monthdetailresponse", targetNamespace = "http://www.gmcc.net/pboss/B2MService/", partName = "response")
    @WebMethod(action = "http://www.gmcc.net/pboss/B2MService/monthdetail")
    public Monthdetailresponse monthdetail(
        @WebParam(partName = "request", name = "monthdetailrequest", targetNamespace = "http://www.gmcc.net/pboss/B2MService/")
        Monthdetailrequest request
    );
    
    @WebResult(name = "smsbosynresponse", targetNamespace = "http://www.gmcc.net/pboss/B2MService/", partName = "response")
    @WebMethod(action = "http://www.gmcc.net/pboss/B2MService/smsbosyn")
    public Smsbosynresponse smsbosyn(
        @WebParam(partName = "request", name = "smsbosynrequest", targetNamespace = "http://www.gmcc.net/pboss/B2MService/")
        Smsbosynrequest request
    );
}
