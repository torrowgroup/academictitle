package com.torrow.title.action.setting;

import java.util.List;

import com.torrow.title.base.BaseAction;
import com.torrow.title.entity.Majors;
import com.torrow.title.util.PageCut;

public class MajorsManageAction extends BaseAction {
	private Majors majors;
	private int majorsId;
	

	public int getMajorsId() {
		return majorsId;
	}

	public void setMajorsId(int majorsId) {
		this.majorsId = majorsId;
	}

	int page = 1;// 当前第几页

	// 查看所有专业
	public String view() {
		PageCut<Majors> list = majorsService.checkAll(page, 3);
		request.put("paCut", list);
		return "view";

	}

	// 添加专业
	public String add() {
		boolean boo = majorsService.add(majors);
		return "view";
	}

	// 修改专业
	public String update() {
		boolean boo = majorsService.update(majors);
		PageCut<Majors> list = majorsService.checkAll(page, 1);
		request.put("paCut", list);
		return "view";

	}
	public String delete() {
		boolean boo = majorsService.deleteById(majorsId);
		PageCut<Majors> list = majorsService.checkAll(page, 1);
		request.put("paCut", list);
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
