package com.torrow.title.action.setting;

import java.util.List;

import com.torrow.title.base.BaseAction;
import com.torrow.title.entity.Expert;
import com.torrow.title.entity.Require;
import com.torrow.title.entity.Title;
import com.torrow.title.util.PageCut;

public class TitleManageAction extends BaseAction {
	private Title title;
	private int titleId;
	int page = 1;// 当前第几页

	public String view() {
		PageCut<Title> list = titleService.checkAll(page, 3);
		request.put("paCut", list);
		request.put("method", "view");
		return "view";
	}

	public String add() {
		boolean bo = titleService.add(title);
		request.put("method", "view");
		return "addTitle";
	}

	// 修改职称
	public String update() {
		boolean boo = titleService.update(title);
		PageCut<Title> list = titleService.checkAll(page, 3);
		request.put("paCut", list);
		return "view";

	}

	public String delete() {
		List<Expert> allExpert = expertService.getAlllExpert();
		for (int i = 0; i < allExpert.size(); i++) {
			if (allExpert.get(i).getEx_title().getTi_id() == titleId) {
				allExpert.get(i).setEx_title(null);
				expertService.updateExpert(allExpert.get(i));
			}
		}
		List<Require> allRequire = requireService.getAllRequire();
		for (int i = 0; i < allRequire.size(); i++) {
			if (allRequire.get(i).getRe_title().getTi_id() == titleId) {
				allRequire.get(i).setRe_title(null);
				boolean bo = titleService.deleteTitle(allRequire.get(i).getRe_title());
				requireService.updateRequire(allRequire.get(i));
			}
		}
		
		boolean boo = titleService.deleteById(titleId);
		PageCut<Title> list = titleService.checkAll(page, 3);
		request.put("paCut", list);
		return "view";

	}
	public int getTitleId() {
		return titleId;
	}

	public void setTitleId(int titleId) {
		this.titleId = titleId;
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
