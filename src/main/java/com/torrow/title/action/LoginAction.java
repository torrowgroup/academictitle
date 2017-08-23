/**
 * 
 */
package com.torrow.title.action;

import java.util.List;

import com.torrow.title.base.BaseAction;
import com.torrow.title.entity.Expert;
import com.torrow.title.entity.Manager;
import com.torrow.title.entity.Notice;
import com.torrow.title.entity.Title;

/**
 * @author zjg
 *
 */
public class LoginAction extends BaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String userName;// 用户名
	private String passWord;// 密码

	// 专家和管理员登录
	public String login() {
		Manager manager = managerService.login(userName, passWord);
		Expert expert = expertService.login(userName, passWord);
		if (manager != null) { // 如果用户为管理员，跳转到管理员界面
			session.put("manager", manager);
			return "managerIndex";
		} else if (expert != null) {
			List<Notice> someNotice = noticeService.getNewNotice();
			if (someNotice.size() > 0) {
				Notice noticeNew = someNotice.get(0);// 得到最新一条通知
				request.put("noticeNew", noticeNew);
				session.put("expert", expert);
				return "expertIndex";
			}
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

	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
}
