package com.torrow.title.action.user;

import java.util.List;

import com.opensymphony.xwork2.ModelDriven;
import com.torrow.title.base.BaseAction;
import com.torrow.title.entity.Expert;
import com.torrow.title.entity.Majors;
import com.torrow.title.entity.Title;
import com.torrow.title.entity.Unit;
import com.torrow.title.util.PageCut;

public class ExpertAction extends BaseAction implements ModelDriven<Expert>{
	
	private int page=1;//初始页数
	private Expert expert;
	private String ask;//查询的条件
	private String inquiry;//查询的内容
	
	//查看所有的专家信息
	public String select(){
		if (ask==null&&inquiry==null) {
			ask = (String)session.get("ask");
			inquiry = (String)session.get("inquiry");
		} else if (ask.equals("all")) {
			ask = null;
		}
		PageCut<Expert> pCut = expertService.getExpert(page, 4,ask,inquiry);
		if (pCut.getData().size() == 0) {
			request.put("message", "无此专家");
		}
		request.put("messagenews", pCut);
		session.put("ask", ask);
		session.put("inquiry", inquiry);
		return "select";
	}
	
	//转发到添加专家界面
	public String relay(){
		List<Majors> majors = majorsService.selectMajors();
		List<Unit> unit = unitService.selectUnit();
		List<Title> title = titleService.selectTitle();
		request.put("majors", majors);
		request.put("unit", unit);
		request.put("title", title);
		return "add";
	}
	
	public String add(){
		return "add";
	}
	
	public String getAsk() {
		return ask;
	}

	public void setAsk(String ask) {
		this.ask = ask;
	}

	public String getInquiry() {
		return inquiry;
	}

	public void setInquiry(String inquiry) {
		this.inquiry = inquiry;
	}

	@Override
	public Expert getModel() {
		if (expert == null) {
			expert = new Expert();
		}
		return expert;
	}
	
	
}
