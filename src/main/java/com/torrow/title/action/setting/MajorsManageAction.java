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
		request.put("method", "view");
		request.put("paCut", list);
		return "view";

	}

	// 添加专业
	public String add() {
		boolean allsign = true;
		List<Majors> list = majorsService.selectMajors();
		for(int i = 0;i < list.size(); i++){
			if (list.get(i).getMaj_majorName().equals(majors.getMaj_majorName())) {
				allsign = false;
				break;
			}
		}
		if (allsign) {
			boolean boo = majorsService.add(majors);
			if(boo) {
				request.put("Message","专业添加成功");
			}else {
				request.put("Message", "添加失败");
			}
		} else {
			request.put("Message","已有该专业");
		}
		return "addMajors";
	}

	// 修改专业
	public String update() {
		boolean boo = majorsService.update(majors);
		PageCut<Majors> list = majorsService.checkAll(page, 3);
		request.put("method", "view");
		request.put("paCut", list);
		return "view";

	}
	public String delete() {
		boolean boo = majorsService.deleteById(majorsId);
		PageCut<Majors> list = majorsService.checkAll(page, 3);
		request.put("method", "view");
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
