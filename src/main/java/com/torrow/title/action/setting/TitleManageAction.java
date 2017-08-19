package com.torrow.title.action.setting;


import com.torrow.title.base.BaseAction;
import com.torrow.title.entity.Majors;
import com.torrow.title.entity.Title;
import com.torrow.title.util.PageCut;

public class TitleManageAction extends BaseAction {
	private Title title;
	private int titleId;
	public int getTitleId() {
		return titleId;
	}
	public void setTitleId(int titleId) {
		this.titleId = titleId;
	}
	int page=1;//当前第几页
	public String view() {
		PageCut<Title> list = titleService.checkAll(page,3);
		request.put("paCut", list);
		return "view";
	}
	public String add() {
		System.out.println(title);
		boolean bo =titleService.add(title);
		System.out.println(bo);
		return "view";
	}
	//修改职称
	public String update() {
		boolean boo=titleService.update(title);
		PageCut<Title> list =titleService.checkAll(page,3);
		request.put("paCut", list);
		return "view";
		
	}
	public String delete() {
		boolean boo = titleService.deleteById(titleId);
		PageCut<Title> list = titleService.checkAll(page,3);
		request.put("paCut", list);
		return "view";

		
	}
	public Title getTitle() {
		return title;
	}
	public void setTitle(Title title) {
		this.title = title;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}

}
