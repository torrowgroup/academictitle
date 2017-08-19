package com.torrow.title.action.setting;

import java.util.List;

import com.torrow.title.base.BaseAction;
import com.torrow.title.entity.Majors;
import com.torrow.title.util.PageCut;

public class MajorsManageAction extends BaseAction {
	private Majors majors;


	int page = 1;// 当前第几页
	
	//查看所有专业
	public String view() {
		PageCut<Majors> list = majorsService.checkAll(page, 1);
		request.put("paCut", list);
		return "view";

	}
	//添加专业
	public String add() {
		boolean boo = majorsService.add(majors);
		if(boo){
			request.put("addMsg", "添加成功");
		} else {
			request.put("addMsg", "添加失败！该ID已被使用");
		}
		return "view";
	}
		
	
	public Majors getMajors() {
		return majors;
	}
	public void setMajors(Majors majors) {
		this.majors = majors;
	}
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

}
