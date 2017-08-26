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
	private int majorid;
	private int titleid;
	private int unitid;

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
			request.put("message", "没有专家");
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
		if (majors.size()==0) {
			request.put("news", "并且无专业");
			return select();
		} else if (unit.size()==0) {
			request.put("news", "并且无单位");
			return select();
		} else if(title.size()==0){
			request.put("news", "并且无职称");
			return select();
		} else {
			request.put("majors", majors);
			request.put("unit", unit);
			request.put("title", title);
		}
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
			Majors major = majorsService.checkById(majorid);
			expert.setEx_major(major);
			Unit units = unitService.checkById(unitid);
			expert.setEx_unit(units);
			Title titles = titleService.checkById(titleid);
			expert.setEx_title(titles);
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
		Expert experts = (Expert) session.get("experts");
		if(experts.getEx_userName().equals(expert.getEx_userName())){
			Majors major = majorsService.checkById(majorid);
			expert.setEx_major(major);
			Unit units = unitService.checkById(unitid);
			expert.setEx_unit(units);
			Title titles = titleService.checkById(titleid);
			expert.setEx_title(titles);
			boolean sign = expertService.updateExpert(expert);
			if (sign) {
				request.put("message", "修改成功");
			} else {
				request.put("message", "修改失败");
			}
		} else {
			boolean allsign = true;
			List<Manager> list = managerService.getAllAdmain();
			List<Expert> elist = expertService.getSomeExpert(experts);
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
				Majors major = majorsService.checkById(majorid);
				expert.setEx_major(major);
				Unit units = unitService.checkById(unitid);
				expert.setEx_unit(units);
				Title titles = titleService.checkById(titleid);
				expert.setEx_title(titles);
				boolean sign = expertService.updateExpert(expert);
				if (sign) {
					request.put("message", "修改成功");
				} else {
					request.put("message", "修改失败");
				}
			} else {
				request.put("message", "用户名重复，请重新添加");
			}
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

	public int getMajorid() {
		return majorid;
	}

	public void setMajorid(int majorid) {
		this.majorid = majorid;
	}

	public int getTitleid() {
		return titleid;
	}

	public void setTitleid(int titleid) {
		this.titleid = titleid;
	}

	public int getUnitid() {
		return unitid;
	}

	public void setUnitid(int unitid) {
		this.unitid = unitid;
	}

	@Override
	public Expert getModel() {
		if (expert == null) {
			expert = new Expert();
		}
		return expert;
	}

}
