/**
 * 
 */
package com.torrow.title.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.mail.MessagingException;

import com.torrow.title.base.BaseAction;
import com.torrow.title.entity.Expert;
import com.torrow.title.entity.Manager;
import com.torrow.title.entity.Notice;
import com.torrow.title.util.Email;

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
	private String password;// 密码
	private String code; // 验证码

	// 专家和管理员登录
	public String login() {
		Manager manager = managerService.login(userName, password);
		Expert expert = expertService.login(userName, password);
		if (manager != null) { // 如果用户为管理员，跳转到管理员界面
			session.put("manager", manager);
			return "managerIndex";
		} else if (expert != null) {
			List<Notice> someNotice = noticeService.getNewNotice();
			if (someNotice.size() > 0) {
				Notice noticeNew = someNotice.get(0);// 得到最新一条通知
				request.put("noticeNew", noticeNew);
			}
			session.put("expert", expert);
			return "expertIndex";
		}
		request.put("message", "邮箱或密码输入错误");
		return LOGIN;
	}

	// 找回密码
	public String forgetPassword() {
		Manager manager = managerService.getByUserName(userName);// 根据用户名即邮箱得到对象
		Expert expert = expertService.getByUserName(userName);
		if (manager != null || expert != null) {
			if (manager != null) { // 如果为管理员
				session.put("backManager", manager);
			} else if (expert != null) {
				session.put("backExpert", expert);
			}
			String code = "";
			for (int i = 0; i < 6; i++) {
				int c = (int) (Math.random() * 9);
				code += c;
			}
			try {
				Email.subject("找回密码")
				.from("职称评审系统")
				.to(userName)
				.text(userName + "您好，欢迎您使用职称评审系统，您的验证码是" + code)
				.send();
			} catch (MessagingException e) {
				request.put("message", "你输入的邮箱不存在");
			}
			session.put("code", code);
		} else {
			request.put("message", "你输入的用户尚未注册");
			return "forgetPassword";
		}
		return "compareCode";
	}

	// 比较验证码
	public String compareCode() {
		String codeUser = (String) session.get("code");
		session.remove("code");
		if (codeUser.equals(code)) {
			return "resetPassword";
		} else {
			request.put("message", "验证失败");
		}
		return "forgetPassword";// 回到输入邮箱界面
	}

	// 重置密码
	public String reset() {
		Manager manager = (Manager) session.get("backManager");
		Expert expert = (Expert) session.get("backExpert");
		if (manager != null) {
			manager.setMa_password(password);
			managerService.updateManager(manager);
		} else {
			expert.setEx_password(password);
			expertService.updateExpert(expert);
		}
		try {
			this.getResponse().setContentType("text/html;charset=UTF-8");
			this.getResponse().setCharacterEncoding("UTF-8");
			PrintWriter out = this.getResponse().getWriter();
			out.println("<script language=\"javascript\">"
					+ "alert(\"修改密码成功\");window.opener=null;window.open('','_self');window.close();</script>");
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "resetPassword";
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

	public final String getCode() {
		return code;
	}

	public final void setCode(String code) {
		this.code = code;
	}

}
