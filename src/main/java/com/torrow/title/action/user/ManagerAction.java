package com.torrow.title.action.user;

import java.util.List;

import com.opensymphony.xwork2.ModelDriven;
import com.torrow.title.base.BaseAction;
import com.torrow.title.entity.Expert;
import com.torrow.title.entity.Manager;
import com.torrow.title.util.PageCut;

public class ManagerAction extends BaseAction implements ModelDriven<Manager> {
	private int page = 1;// 设置初始页数
	private Manager manager;
	private String ask;//查询的条件
	private String inquiry;//查询的内容
	// 查看全部管理信息
	public String select() {
		if(ask == null&&inquiry == null){
			ask = (String) session.get("ask");
			inquiry = (String) session.get("inquiry");
		} else if (ask.equals("all")) {
			ask=null;
		}
		PageCut<Manager> pCut = managerService.getManager(page, 4,ask,inquiry);
		if (pCut.getData().size() == 0) {
			request.put("message", "无此管理员");
		}
		request.put("messagenews", pCut);
		session.put("ask", ask);
		session.put("inquiry", inquiry);
		return "select";
	}

	// 用于转发到添加管理员界面
	public String relay() {
		return "add";
	}

	// 添加管理员
	public String add() {
		boolean allsign = true;
		List<Manager> list = managerService.getAllManager();
		List<Expert> elist = expertService.getAlllExpert();
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getMa_userName().equals(manager.getMa_userName())) {
				allsign = false;
				break;
			} else {
				for (int j = 0; j < elist.size(); j++) {
					if (elist.get(j).getEx_userName().equals(manager.getMa_userName())) {
						allsign = false;
						break;
					}
				}
			}
		}
		if (allsign) {
			boolean sign = managerService.addManager(manager);
			if (sign) {
				request.put("message", "添加成功");
			} else {
				request.put("message", "添加失败");
			}
		} else {
			request.put("message", "用户名重复，请重新添加");
		}
		return "add";
	}

	// 根据id获取管理员信息
	public String toUpdate() {
		Manager admain = managerService.selectManager(manager.getMa_id());
		request.put("messagenews", admain);
		return "update";
	}

	// 修改管理员
	public String update() {
		boolean sign = managerService.updateManager(manager);
		if (sign) {
			request.put("message", "修改成功");
		} else {
			request.put("message", "修改失败");
		}
		return select();
	}

	// 删除管理员
	public String delet() {
		boolean sign = managerService.deletManager(manager.getMa_id());
		if (sign) {
			request.put("message", "删除成功");
		} else {
			request.put("message", "删除失败");
		}
		return select();
	}
	

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
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

	@Override
	public Manager getModel() {
		if (manager == null) {
			manager = new Manager();
		}
		return manager;
	}

}
