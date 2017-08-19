package com.torrow.title.base;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.torrow.title.services.DiscussService;
import com.torrow.title.services.ExpertService;
import com.torrow.title.services.MajorsService;
import com.torrow.title.services.ManagerService;
import com.torrow.title.services.NoticeService;
import com.torrow.title.services.ParticipatorService;
import com.torrow.title.services.RecordService;
import com.torrow.title.services.RequireService;
import com.torrow.title.services.TitleService;
import com.torrow.title.services.UnitService;

public class BaseAction extends ActionSupport implements SessionAware, RequestAware {

	private static final long serialVersionUID = 1L;

	/**
	 * 对于session、request的一种定义
	 */
	protected Map<String, Object> session;
	protected Map<String, Object> request;

	@Resource
	protected ManagerService managerService; // 调用managerSevice接口
	@Resource
	protected ExpertService expertService; // 调用expertService接口
	@Resource
	protected DiscussService discussService;// 调用DiscussService接口
	@Resource
	protected MajorsService majorsService;// 调用MajorsService接口
	@Resource
	protected ParticipatorService participatorService;// 调用ParticipatorService接口
	@Resource
	protected RecordService recordService;// 调用RecordService接口
	@Resource
	protected RequireService requireService;// 调用RequireService接口
	@Resource
	protected TitleService titleService;// 调用TitleService接口
	@Resource
	protected UnitService unitService;// 调用UnitService接口
	@Resource
	protected NoticeService noticeService;//调用NoticeService接口

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
