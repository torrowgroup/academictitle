package com.torrow.title.action.user;

import com.torrow.title.base.BaseAction;
import com.torrow.title.entity.Manager;
import com.torrow.title.util.PageCut;

public class ManagerAction extends BaseAction {
	private int page=1;//设置初始页数
	
	public String select(){
		PageCut<Manager> pCut = managerService.getManager(page, 8);
		return null;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}
	
}
