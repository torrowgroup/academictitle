package com.torrow.title.action.user;

import java.util.List;

import com.opensymphony.xwork2.ModelDriven;
import com.torrow.title.base.BaseAction;
import com.torrow.title.entity.Expert;
import com.torrow.title.entity.Majors;
import com.torrow.title.entity.Manager;
import com.torrow.title.entity.Title;
import com.torrow.title.entity.Unit;
import com.torrow.title.util.PageCut;

public class ExpertAction extends BaseAction implements ModelDriven<Expert> {

	private int page = 1;// 初始页数
	private Expert expert;
	private String ask;// 查询的条件
	private String inquiry;// 查询的内容
	private String unitName;
	private String majorName;
	private String titleName;

	// 查看所有的专家信息
	public String select() {
		if (ask == null && inquiry == null) {
			ask = (String) session.get("ask");
			inquiry = (String) session.get("inquiry");
		} else if (ask.equals("all")) {
			ask = null;
		}
		PageCut<Expert> pCut = expertService.getExpert(page, 4, ask, inquiry);
		if (pCut.getData().size() == 0) {
			request.put("message", "无此专家");
		}
		request.put("messagenews", pCut);
		session.put("ask", ask);
		session.put("inquiry", inquiry);
		return "select";
	}

	// 转发到添加专家界面
	public String relay() {
		List<Majors> majors = majorsService.selectMajors();
		List<Unit> unit = unitService.selectUnit();
		List<Title> title = titleService.selectTitle();
		request.put("majors", majors);
		request.put("unit", unit);
		request.put("title", title);
		return "add";
	}

	// 添加专家信息
	public String add() {
		boolean allsign = true;
		List<Manager> list = managerService.getAllAdmain();
		List<Expert> elist = expertService.getAlllExpert();
		List<Majors> majors = majorsService.selectMajors();
		List<Unit> unit = unitService.selectUnit();
		List<Title> title = titleService.selectTitle();
		for (int i = 0; i < elist.size(); i++) {
			if (elist.get(i).getEx_userName().equals(expert.getEx_userName())) {
				allsign = false;
				break;
			} else {
				for (int j = 0; j < list.size(); j++) {
					if (list.get(j).getMa_userName().equals(expert.getEx_userName())) {
						allsign = false;
						break;
					}
				}
			}
		}
		if (allsign) {
			for (int i = 0; i < majors.size(); i++) {
				if (majors.get(i).getMaj_majorName().equals(majorName)) {
					expert.setEx_major(majors.get(i));
				}
			}
			for (int i = 0; i < unit.size(); i++) {
				if (unit.get(i).getUn_unitName().equals(unitName)) {
					expert.setEx_unit(unit.get(i));
				}
			}
			for (int i = 0; i < title.size(); i++) {
				if (title.get(i).getTi_titleName().equals(titleName)) {
					expert.setEx_title(title.get(i));
				}
			}
			boolean sign = expertService.addExpert(expert);
			if (sign) {
				request.put("message", "添加成功");
			} else {
				request.put("message", "添加失败");
			}
		} else {
			request.put("message", "用户名重复，请重新添加");
		}
		request.put("majors", majors);
		request.put("unit", unit);
		request.put("title", title);
		return "add";
	}

	// 转发到专家修改页面，并且根据id获得修改专家的信息
	public String toUpdate() {
		List<Majors> majors = majorsService.selectMajors();
		List<Unit> unit = unitService.selectUnit();
		List<Title> title = titleService.selectTitle();
		Expert experts = expertService.selectEcpert(expert.getEx_id());
		request.put("majors", majors);
		request.put("unit", unit);
		request.put("title", title);
		request.put("experts", experts);
		session.put("experts", experts);
		return "update";
	}

	// 根据id修改专家的信息
	public String update() {
		List<Majors> majors = majorsService.selectMajors();
		List<Unit> unit = unitService.selectUnit();
		List<Title> title = titleService.selectTitle();
		for (int i = 0; i < majors.size(); i++) {
			if (majors.get(i).getMaj_majorName().equals(majorName)) {
				expert.setEx_major(majors.get(i));
			}
		}
		for (int i = 0; i < unit.size(); i++) {
			if (unit.get(i).getUn_unitName().equals(unitName)) {
				expert.setEx_unit(unit.get(i));
			}
		}
		for (int i = 0; i < title.size(); i++) {
			if (title.get(i).getTi_titleName().equals(titleName)) {
				expert.setEx_title(title.get(i));
			}
		}
		boolean sign = expertService.updateExpert(expert);
		if (sign) {
			request.put("message", "修改成功");
		} else {
			request.put("message", "修改失败");
		}
		return select();
	}

	// 根据ID删除专家
	public String delet() {
		boolean sign = expertService.deletExpert(expert.getEx_id());
		if (sign) {
			request.put("message", "删除成功");
		} else {
			request.put("message", "删除失败");
		}
		return select();
	}

	public String getAsk() {
		return ask;
	}

	public void setAsk(String ask) {
		this.ask = ask;
	}

	public String getInquiry() {
		return inquiry;
	}

	public void setInquiry(String inquiry) {
		this.inquiry = inquiry;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public String getUnitName() {
		return unitName;
	}

	public void setUnitName(String unitName) {
		this.unitName = unitName;
	}

	public String getMajorName() {
		return majorName;
	}

	public void setMajorName(String majorName) {
		this.majorName = majorName;
	}

	public String getTitleName() {
		return titleName;
	}

	public void setTitleName(String titleName) {
		this.titleName = titleName;
	}

	@Override
	public Expert getModel() {
		if (expert == null) {
			expert = new Expert();
		}
		return expert;
	}

}
