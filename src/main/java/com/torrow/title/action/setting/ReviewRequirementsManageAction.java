package com.torrow.title.action.setting;

import java.util.List;

import com.torrow.title.base.BaseAction;
import com.torrow.title.entity.Require;
import com.torrow.title.entity.Title;
import com.torrow.title.entity.Unit;
import com.torrow.title.util.PageCut;

public class ReviewRequirementsManageAction extends BaseAction {
	private Require req;
	private int requireId;// 评议ID
	private int titleId;
	private String titleName;

	public String getTitleName() {
		return titleName;
	}

	public void setTitleName(String titleName) {
		this.titleName = titleName;
	}

	public int getTitleId() {
		return titleId;
	}

	public void setTitleId(int titleId) {
		this.titleId = titleId;
	}

	int page = 1;

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

	// 查看所有评议要求
	public String view() {
		PageCut<Require> list = requireService.checkAll(page, 6);
		request.put("method", "view");
		request.put("paCut", list);
		return "view";
	}

	// 添加评议要求
	public String add() {
		List<Require> list = requireService.getAllRequire();
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getRe_title().getTi_id() == titleId) {
				request.put("Message", "已有该职称相关评议");
				return "addReviewRequirements";
			}
		}
		Title title = titleService.checkById(titleId);
		boolean boo = requireService.add(req, title);
		request.put("Message", "该职称评议要求添加成功");
		request.put("reqlist", session.get("reqlist"));
		return "addReviewRequirements";
	}

	// 修改评议要求
	public String update() {
		boolean boo = requireService.update(req, (Title) session.get("title"));
		PageCut<Require> list = requireService.checkAll(page, 6);
		request.put("paCut", list);
		request.put("method", "view");
		return "view";

	}

	// 删除评议要求
	public String delete() {
		boolean boo = requireService.deleteById(requireId);
		PageCut<Require> list = requireService.checkAll(page, 6);
		request.put("paCut", list);
		request.put("method", "view");
		return "view";
	}

	public String searchRequire() {
		Require require = requireService.checkByTitleName(titleName);
		if (require != null) {
			request.put("require", require);
		} else {
			request.put("Message", "暂无该职称相关评审信息");
		}
		return "searchRequire";
	}

	public String getDetails() {
		Require require = requireService.checkById(requireId);
		request.put("require", require);
		return "getDetails";
	}

}
