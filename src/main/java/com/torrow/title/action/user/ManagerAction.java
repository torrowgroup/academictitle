package com.torrow.title.action.user;

import java.util.List;

import com.opensymphony.xwork2.ModelDriven;
import com.torrow.title.base.BaseAction;
import com.torrow.title.entity.Manager;
import com.torrow.title.util.PageCut;

public class ManagerAction extends BaseAction implements ModelDriven<Manager> {
	private int page = 1;// 设置初始页数
	private Manager manager;
	
	//查看全部管理信息
	public String select() {
		PageCut<Manager> pCut = managerService.getManager(page, 4);
		request.put("message", pCut);
		return "select";
	}
	
	//用于转发到添加管理员界面
	public String relay(){
		return "add";
	}
	
	//添加管理员
	public String add(){
		List<Manager> list = managerService.getAllManager();
		for(int i=0;i<list.size();i++){
			if(list.get(i).getMa_userName().equals(manager.getMa_userName())){
				request.put("message", "用户名重复，请重新添加");
			}
		}
		boolean sign = managerService.addManager(manager);
		if (sign) {
			request.put("message", "添加成功");
		} else {
			request.put("message", "添加失败");
		}
		return "add";
	}
	
	//根据id获取管理员信息
	public String toUpdate(){
		Manager admain =  managerService.selectManager(manager.getMa_id());
		return "update";
	}
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	@Override
	public Manager getModel() {
		if (manager == null) {
			manager = new Manager();
		}
		return manager;
	}

}
