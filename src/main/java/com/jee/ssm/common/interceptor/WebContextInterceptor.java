package com.jee.ssm.common.interceptor;

import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.WebApplicationContext;

import javax.servlet.ServletContext;

public class WebContextInterceptor extends ContextLoaderListener {
	
	@Override
	public WebApplicationContext initWebApplicationContext(ServletContext servletContext) {
/*		if (!SystemService.printKeyLoadMessage()){
			return null;
		}*/
		return super.initWebApplicationContext(servletContext);
	}
}
