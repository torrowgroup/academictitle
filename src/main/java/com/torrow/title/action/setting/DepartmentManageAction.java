package com.torrow.title.action.setting;


import java.util.List;

import com.torrow.title.base.BaseAction;
import com.torrow.title.entity.Majors;
import com.torrow.title.entity.Unit;
import com.torrow.title.util.PageCut;

public class DepartmentManageAction  extends BaseAction{
	private Unit unit;
	private int unitId;
public int getUnitId() {
		return unitId;
	}
	public void setUnitId(int unitId) {
		this.unitId = unitId;
	}
int page = 1;// 当前第几页
	
	public Unit getUnit() {
	return unit;
}
public void setUnit(Unit unit) {
	this.unit = unit;
}
public int getPage() {
	return page;
}
public void setPage(int page) {
	this.page = page;
}
	//查看所有部门
	public String view() {
		PageCut<Unit> list = unitService.checkAll(page, 3);
		request.put("Method", "view");
		request.put("paCut", list);
		return "view";
	}
	//添加部门
	public String add() {
		boolean allsign = true;
		List<Unit> list = unitService.selectUnit();
		for(int i = 0;i < list.size();i++){
			if (list.get(i).getUn_unitName().equals(unit.getUn_unitName())) {
				allsign = false;
				break;
			}
		}
		if (allsign) {
			boolean boo = unitService.add(unit);
			if(boo) {
				request.put("Message","添加成功");
			}else {
				request.put("Message", "添加失败");
			}
		} else {
			request.put("Message", "已有该单位");
		}
		
		return "addUnit";
	}
	// 修改部门
	public String update() {
		boolean boo = unitService.update(unit);
		PageCut<Unit> list = unitService.checkAll(page, 3);
		request.put("Method", "view");
		request.put("paCut", list);
		return "view";

	}
	//删除部门
	public String delete() {
		boolean boo = unitService.deleteById(unitId);
		PageCut<Unit> list = unitService.checkAll(page, 3);
		request.put("Method", "view");
		request.put("paCut", list);
		return "view";
	}

}
