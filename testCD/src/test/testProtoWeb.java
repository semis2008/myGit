package test;

import java.net.MalformedURLException;
import java.net.URL;

import org.codehaus.xfire.client.Client;

public class testProtoWeb {

	public static void main(String args[]) throws MalformedURLException, Exception {
		Client c = new Client(new URL("http://www.miitoa.com/services/PortalService?wsdl"));
		Object[] results = c.invoke("getNewFiles", new Object[]{"portal","newFile","menghongtao","NWoZK3kTsExUV00Ywo1G5jlU"});
	} 
}
