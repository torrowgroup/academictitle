package com.torrow.title.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import com.torrow.title.entity.Manager;

/**
 * Servlet Filter implementation class ManagerFilter
 */
@WebFilter("/ManagerFilter")
public class ManagerFilter implements Filter {

	/**
	 * Default constructor.
	 */
	public ManagerFilter() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here

		// pass the request along the filter chain
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8"); // 转码
		HttpServletRequest hRequest = (HttpServletRequest) request;
		Manager manager = (Manager) hRequest.getSession().getAttribute("manager");
		if (manager != null) {
			chain.doFilter(request, response);
		} else { // 当用户为登录或登录超时时提醒并跳转到登录界面
			String returnUrl = hRequest.getContextPath() + "/index.jsp";// 获得登录界面
			response.getWriter().println("<script language=\"javascript\">" + "alert(\"登录失效！请重新登录\");"
					+ "if(window.opener==null){window.top.location.href=\"" + returnUrl
					+ "\";}else{window.opener.top.location.href=\"" + returnUrl + "\";window.close();}</script>");
			return;
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
