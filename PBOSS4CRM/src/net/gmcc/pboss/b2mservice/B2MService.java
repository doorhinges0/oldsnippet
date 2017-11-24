package net.gmcc.pboss.b2mservice;

import java.net.MalformedURLException;
import java.net.URL;
import javax.xml.namespace.QName;
import javax.xml.ws.WebEndpoint;
import javax.xml.ws.WebServiceClient;
import javax.xml.ws.WebServiceFeature;
import javax.xml.ws.Service;

/**
 * This class was generated by Apache CXF 2.3.8
 * 2014-01-02T14:13:57.703+08:00
 * Generated source version: 2.3.8
 * 
 */
@WebServiceClient(name = "B2MService", 
                  //wsdlLocation = "file:D:/workspace/PBOSS4CRM/src/data/B2MService.wsdl",
		          wsdlLocation = "data/B2MService.wsdl",
                  targetNamespace = "http://www.gmcc.net/pboss/B2MService/") 
public class B2MService extends Service {

    public final static URL WSDL_LOCATION;

    public final static QName SERVICE = new QName("http://www.gmcc.net/pboss/B2MService/", "B2MService");
    public final static QName B2MServiceSoap = new QName("http://www.gmcc.net/pboss/B2MService/", "B2MServiceSoap");
    static {
        URL url = null;
        try {
            //url = new URL("file:D:/workspace/PBOSS4CRM/src/data/B2MService.wsdl");
        	url = B2MService.class.getClassLoader().getResource("data/B2MService.wsdl");
        } catch (Exception e) {
            java.util.logging.Logger.getLogger(B2MService.class.getName())
                .log(java.util.logging.Level.INFO, 
                     "Can not initialize the default wsdl from {0}", "file:wsdl/B2MService.wsdl");
        }
        WSDL_LOCATION = url;
    }

    public B2MService(URL wsdlLocation) {
        super(wsdlLocation, SERVICE);
    }

    public B2MService(URL wsdlLocation, QName serviceName) {
        super(wsdlLocation, serviceName);
    }

    public B2MService() {
        super(WSDL_LOCATION, SERVICE);
    }
    

    /**
     *
     * @return
     *     returns B2MServicePort
     */
    @WebEndpoint(name = "B2MServiceSoap")
    public B2MServicePort getB2MServiceSoap() {
    	B2MServicePort port = super.getPort(B2MServiceSoap, B2MServicePort.class);
        
        org.apache.cxf.endpoint.Client client = org.apache.cxf.frontend.ClientProxy.getClient(port);
    	org.apache.cxf.endpoint.Endpoint cxfEndpoint = client.getEndpoint();
    	cxfEndpoint.getOutInterceptors().add(new org.apache.cxf.interceptor.LoggingOutInterceptor());
    	cxfEndpoint.getInInterceptors().add(new org.apache.cxf.interceptor.LoggingInInterceptor());
    	
    	return port;
    }

    /**
     * 
     * @param features
     *     A list of {@link javax.xml.ws.WebServiceFeature} to configure on the proxy.  Supported features not in the <code>features</code> parameter will have their default values.
     * @return
     *     returns B2MServicePort
     */
    @WebEndpoint(name = "B2MServiceSoap")
    public B2MServicePort getB2MServiceSoap(WebServiceFeature... features) {
        return super.getPort(B2MServiceSoap, B2MServicePort.class, features);
    }

}
