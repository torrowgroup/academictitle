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
public class LoginAction extends BaseAction{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String userName;//用户名
	private String passWord;//密码

	//专家和管理员登录
	public String login(){
		if(userName!=null&&passWord!=null){
			Manager manager = managerService.login(userName, passWord);
			Expert expert = expertService.login(userName, passWord);
			List<Notice> someNotice = noticeService.getNewNotice();//降序得到6条通知
			if(manager!=null){	//如果用户为管理员，跳转到管理员界面
				List<Title> someTitle = titleService.selectTitle();//得到全部职称取6条职称
				for(int i=5;i<someTitle.size();i++){
					someTitle.remove(i);
					i--;
				}
//				session.put("someTitle", someTitle);
//				session.put("someNotice", someNotice);
				session.put("manager", manager);
				return "managerIndex";
			} else if(expert!=null) {
				Notice noticeNew = someNotice.get(0);//得到最新一条通知
				session.put("noticeNew", noticeNew);
				session.put("expert", expert);
				return "expertIndex";
			}
			request.put("message", "用户名或密码输入错误");
		}
		return LOGIN;
	}

	//管理元首页内容
	public void managerIndex(){
		
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
