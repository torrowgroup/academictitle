package com.torrow.title.action.user;

import java.util.List;

import com.opensymphony.xwork2.ModelDriven;
import com.torrow.title.base.BaseAction;
import com.torrow.title.entity.Expert;
import com.torrow.title.entity.Majors;
import com.torrow.title.entity.Participator;
import com.torrow.title.entity.Title;
import com.torrow.title.entity.Unit;
import com.torrow.title.util.PageCut;

public class ParticipatorAction extends BaseAction implements ModelDriven<Participator>{
	
	private int page = 1;// 初始页数
	private Participator participator;
	private String ask;// 查询的条件
	private String inquiry;// 查询的内容
	
	//查看所有的参评人信息
	public String select(){
		if (ask == null && inquiry == null) {
			ask = (String) session.get("ask");
			inquiry = (String) session.get("inquiry");
		} else if (ask.equals("all")) {
			ask = null;
		}
		PageCut<Participator> pCut = participatorService.getParticipator(page, 4, ask, inquiry);
		if (pCut.getData().size() == 0) {
			request.put("message", "无此专家");
		}
		request.put("messagenews", pCut);
		session.put("ask", ask);
		session.put("inquiry", inquiry);
		return "select";
	}
	// 转发到添加界面
		public String relay() {
			List<Majors> majors = majorsService.selectMajors();
			List<Unit> unit = unitService.selectUnit();
			List<Title> title = titleService.selectTitle();
			request.put("majors", majors);
			request.put("unit", unit);
			request.put("title", title);
			return "add";
		}
	//添加参评人信息
	public String add(){
		
		return "add";
	}
	@Override
	public Participator getModel() {
		if (participator == null) {
			participator = new Participator();
		}
		return participator;
	}

}
