package com.torrow.title.action.setting;

import com.torrow.title.base.BaseAction;
import com.torrow.title.entity.Require;
import com.torrow.title.entity.Title;
import com.torrow.title.entity.Unit;
import com.torrow.title.util.PageCut;

public class ReviewRequirementsManageAction extends BaseAction {
	private Require req;
	private int requireId;//评议ID
	private int titleId;
	public int getTitleId() {
		return titleId;
	}
	public void setTitleId(int titleId) {
		this.titleId = titleId;
	}
	int page=1;
	public Require getReq() {
		return req;
	}
	public void setReq(Require req) {
		this.req = req;
	}
	public int getRequireId() {
		return requireId;
	}
	public void setRequireId(int requireId) {
		this.requireId = requireId;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
		//查看所有评议要求
		public String view() {
			PageCut<Require > list =requireService.checkAll(page, 3);
			request.put("paCut", list);
			return "view";
		}
		//添加评议要求
		public String add() {
			Title title=titleService.checkById(titleId);
			boolean boo =requireService.add(req,title);
			return "view";
		}
		// 修改评议要求
		public String update() {
			boolean boo = requireService.update(req);
			PageCut<Require> list = requireService.checkAll(page, 3);
			request.put("paCut", list);
			return "view";

		}
		//删除评议要求
		public String delete() {
			boolean boo = requireService.deleteById(requireId);
			PageCut<Require> list = requireService.checkAll(page, 3);
			request.put("paCut", list);
			return "view";

			
		}

}
