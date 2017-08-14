package com.torrow.title.base;

import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class BaseAction extends ActionSupport implements SessionAware, RequestAware {

	private static final long serialVersionUID = 1L;

	/**
	 * 对于session、request的一种定义
	 */
	protected Map<String, Object> session;
	protected Map<String, Object> request;

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

	@Override
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
	
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

}
