/**
 * 
 */
package com.torrow.title.action;


import com.torrow.title.base.BaseAction;
import com.torrow.title.entity.Expert;
import com.torrow.title.entity.Manager;
import com.torrow.title.entity.Notice;

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

	//专家和管理员登录
	public String login(){
		if(userName!=null&&password!=null){
			Manager manager = managerService.login(userName, password);
			Expert expert = expertService.login(userName, password);
			if(manager!=null){	//如果用户为管理员，跳转到管理员界面
				session.put("manager", manager);
				return "managerIndex";
			} else if(expert!=null) {
				Notice noticeNew = noticeService.getNewNotice();
				request.put("noticeNew", noticeNew);
				session.put("expert", expert);
				return "expertIndex";
			}
			request.put("message", "用户名或密码输入错误");
		}
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
