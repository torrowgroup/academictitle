package com.torrow.title.action.setting;

import java.util.List;

import com.torrow.title.base.BaseAction;
import com.torrow.title.entity.Expert;
import com.torrow.title.entity.Majors;
import com.torrow.title.entity.Participator;
import com.torrow.title.util.PageCut;

public class MajorsManageAction extends BaseAction {
	private Majors majors;
	private int majorsId;
	private String majorsName;
	

	public String getMajorsName() {
		return majorsName;
	}

	public void setMajorsName(String majorsName) {
		this.majorsName = majorsName;
	}

	public int getMajorsId() {
		return majorsId;
	}

	public void setMajorsId(int majorsId) {
		this.majorsId = majorsId;
	}

	int page = 1;// 当前第几页

	// 查看所有专业
	public String view() {
		PageCut<Majors> list = majorsService.checkAll(page, 6);
		request.put("method", "view");
		request.put("paCut", list);
		return "view";

	}

	// 添加专业
	public String add() {
		if(majors.getMaj_majorName().equals("")) {
			request.put("Message", "添加失败");
		}else {
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
		}
		
		return "addMajors";
	}

	// 修改专业
	public String update() {
		List<Majors> allMajors = majorsService.checkAll();
		for(int i=0;i<allMajors.size();i++) {
			if(allMajors.get(i).getMaj_majorName().equals(majors.getMaj_majorName())) {
				System.out.println(allMajors.get(i).getMaj_majorName());
				request.put("Message", "修改失败");
				PageCut<Majors> list = majorsService.checkAll(page, 6);
				request.put("method", "view");
				request.put("paCut", list);
				return "view";
			}
		}
		boolean boo = majorsService.update(majors);
		PageCut<Majors> list = majorsService.checkAll(page, 6);
		request.put("method", "view");
		request.put("paCut", list);
		return "view";

	}
	public String delete() {
		List<Participator> allParticipator = participatorService.getAll();
		for(int i=0;i<allParticipator.size();i++) {
			if(allParticipator.get(i).getPa_majors()!=null) {
			if(allParticipator.get(i).getPa_majors().getMaj_id()==majorsId) {
				allParticipator.get(i).setPa_majors(null);
				participatorService.updateParticipator(allParticipator.get(i));
			}
			}
		}
		List<Expert> allExport = expertService.getAlllExpert();
		for(int i=0;i<allExport.size();i++) {
			System.out.println(allParticipator);
			if(allExport.get(i).getEx_majors()!=null) {
			if(allExport.get(i).getEx_majors().getMaj_id()==majorsId) {
				allExport.get(i).setEx_major(null);
				expertService.updateExpert(allExport.get(i));
			}
			}
		}
		boolean boo = majorsService.deleteById(majorsId);
		PageCut<Majors> list = majorsService.checkAll(page, 6);
		request.put("method", "view");
		request.put("paCut", list);
		return "view";

		
	}
	public String searchMajors() {
		Majors majors = majorsService.checkMajorsName(majorsName);
		if(majors!=null) {
		request.put("majors", majors);
		}else{
			request.put("Message", "暂无该专业");

		}
			return "searchMajors";
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
