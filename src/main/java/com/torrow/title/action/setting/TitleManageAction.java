package com.torrow.title.action.setting;

import java.util.List;

import com.torrow.title.base.BaseAction;
import com.torrow.title.entity.Expert;
import com.torrow.title.entity.Participator;
import com.torrow.title.entity.Require;
import com.torrow.title.entity.Title;
import com.torrow.title.util.PageCut;

public class TitleManageAction extends BaseAction {
	private Title title;
	private int titleId;
	private String titleName;
	int page = 1;// 当前第几页
	public String getTitleName() {
		return titleName;
	}

	public void setTitleName(String titleName) {
		this.titleName = titleName;
	}

	

	public String view() {
		PageCut<Title> list = titleService.checkAll(page, 6);
		request.put("paCut", list);
		request.put("method", "view");
		return "view";
	}

	public String add() {
		if(title.getTi_titleName().equals("")) {
			request.put("Message", "添加失败");
		}else {
		boolean allsign = true;
		List<Title> list = titleService.selectTitle();
		for(int i = 0;i<list.size();i++){
			if (list.get(i).getTi_titleName().equals(title.getTi_titleName())) {
				allsign = false;
				break; 
			}
		}
		if(allsign){
			boolean bo = titleService.add(title);
			if(bo) {
				request.put("Message","添加成功");
			}else {
				request.put("Message", "添加失败");
			}
		} else {
			request.put("Message", "已有该职称");
		}
		request.put("method", "view");
		}
		return "addTitle";
	}

	// 修改职称
	public String update() {
		List<Title> allTitle = titleService.getAll();
		for(int i=0;i<allTitle.size();i++) {
			if(allTitle.get(i).getTi_titleName().equals(title.getTi_titleName())) {
				request.put("Message", "修改失败");
				PageCut<Title> list = titleService.checkAll(page, 6);
				request.put("paCut", list);
				request.put("method", "view");
				return "view";
			}
		}
		boolean boo = titleService.update(title);
		PageCut<Title> list = titleService.checkAll(page, 6);
		request.put("paCut", list);
		request.put("method", "view");
		return "view";

	}

	public String delete() {
		List<Expert> allExpert = expertService.getAlllExpert();
		for (int i = 0; i < allExpert.size(); i++) {
			if(allExpert.get(i).getEx_title()!=null) {
			if (allExpert.get(i).getEx_title().getTi_id() == titleId) {
				allExpert.get(i).setEx_title(null);
				expertService.updateExpert(allExpert.get(i));
			}
			}
		}
		List<Require> allRequire = requireService.getAllRequire();
		for (int i = 0; i < allRequire.size(); i++) {
			if(allRequire.get(i).getRe_title()!=null) {
			if (allRequire.get(i).getRe_title().getTi_id() == titleId) {
				allRequire.get(i).setRe_title(null);
				requireService.updateRequire(allRequire.get(i));
			}
			}
		}
		List<Participator> allParticipator = participatorService.getAll();
		for(int i=0;i<allParticipator.size();i++) {
			if(allParticipator.get(i).getPa_title()!=null) {
			if(allParticipator.get(i).getPa_title().getTi_id()==titleId) {
				allParticipator.get(i).setPa_title(null);
				participatorService.updateParticipator(allParticipator.get(i));
			}
			}
		}
		boolean boo = titleService.deleteById(titleId);
		PageCut<Title> list = titleService.checkAll(page, 6);
		request.put("paCut", list);
		return "view";

	}
	public String searchTitle() {
		Title title =titleService.getTitle(titleName);
		if(title!=null) {
		request.put("title", title);
		}else {
			request.put("Message", "暂无该职称");
		}
		return "searchTitle";
		
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
