package com.torrow.title.base;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.torrow.title.services.ExpertService;
import com.torrow.title.services.ManagerService;

public class BaseAction extends ActionSupport implements SessionAware, RequestAware {

	private static final long serialVersionUID = 1L;

	/**
	 * 对于session、request的一种定义
	 */
	protected Map<String, Object> session;
	protected Map<String, Object> request;

	@Resource
	protected ManagerService managerService;	//调用managerSevice接口
	@Resource
	protected ExpertService expertService; //调用expertService接口
	
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
