package com.torrow.title.base;

import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class BaseAction extends ActionSupport implements SessionAware, RequestAware {

	/**
	 * 这是一些对于session、request的一种定义以便在后来对其直接的引用
	 */
	private static final long serialVersionUID = 1L;

	protected Map<String, Object> session;
	protected Map<String, Object> request;
	// service 注入
	
//	@Resource
//	protected IPaymentService paymentService;

	protected HttpServletResponse getResponse() {
		return ServletActionContext.getResponse();
	}

	protected ServletContext getContext() {
		return ServletActionContext.getServletContext();
	}
	
	public Map<String, Object> getSession() {
		return session;
	}

	public Map<String, Object> getRequest() {
		return request;
	}

//	@Override
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
	
//	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

}
