/**
 * 
 */
package com.torrow.title.action;


import javax.annotation.Resource;

import com.torrow.title.base.BaseAction;
import com.torrow.title.services.ManagerService;

/**
 * @author zjg
 *
 */
public class LoginAction extends BaseAction{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String userName;//用户名
	private String password;//密码
	@Resource
	private ManagerService managerService;

	//登录
	public String login(){
		if(managerService.login(userName, password)){
			return SUCCESS;	
		}
		request.put("message", "用户名或密码输入错误");
		return LOGIN;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
