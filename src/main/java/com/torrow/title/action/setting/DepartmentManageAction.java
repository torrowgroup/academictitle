package com.torrow.title.action.setting;

import java.util.List;

import com.torrow.title.base.BaseAction;
import com.torrow.title.entity.Expert;
import com.torrow.title.entity.Majors;
import com.torrow.title.entity.Participator;
import com.torrow.title.entity.Unit;
import com.torrow.title.util.PageCut;

public class DepartmentManageAction extends BaseAction {
	private Unit unit;
	private int unitId;
	private String unitName;

	public String getUnitName() {
		return unitName;
	}

	public void setUnitName(String unitName) {
		this.unitName = unitName;
	}

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

	// 查看所有单位
	public String view() {
		PageCut<Unit> list = unitService.checkAll(page, 6);
		request.put("method", "view");
		request.put("paCut", list);
		return "view";
	}

	// 添加单位
	public String add() {
		if (unit.getUn_unitName().equals("")) {
			request.put("Message", "添加失败");
		} else {
			boolean allsign = true;
			List<Unit> list = unitService.selectUnit();
			for (int i = 0; i < list.size(); i++) {
				if (list.get(i).getUn_unitName().equals(unit.getUn_unitName())) {
					allsign = false;
					break;
				}
			}
			if (allsign) {
				boolean boo = unitService.add(unit);
				if (boo) {
					request.put("Message", "添加成功");
				} else {
					request.put("Message", "添加失败");
				}
			} else {
				request.put("Message", "已有该单位");
			}
		}

		return "addUnit";
	}

	// 修改单位
	public String update() {
		List<Unit> allUnit = unitService.selectUnit();
		for (int i = 0; i < allUnit.size(); i++) {
			if (allUnit.get(i).getUn_unitName().equals(unit.getUn_unitName())) {
				request.put("Message", "修改失败");
				PageCut<Unit> list = unitService.checkAll(page, 6);
				request.put("method", "view");
				request.put("paCut", list);
				return "view";
			}
		}
		boolean boo = unitService.update(unit);
		PageCut<Unit> list = unitService.checkAll(page, 6);
		request.put("method", "view");
		request.put("paCut", list);
		return "view";

	}

	// 删除单位
	public String delete() {
		List<Participator> allParticipator = participatorService.getAll();
		for (int i = 0; i < allParticipator.size(); i++) {
			if (allParticipator.get(i).getPa_unit() != null) {
				if (allParticipator.get(i).getPa_unit().getUn_id() == unitId) {
					allParticipator.get(i).setPa_unit(null);
					participatorService.updateParticipator(allParticipator.get(i));
				}
			}
		}
		List<Expert> allExpert = expertService.getAlllExpert();
		for (int i = 0; i < allExpert.size(); i++) {
			if (allExpert.get(i).getEx_unit() != null) {
				if (allExpert.get(i).getEx_unit().getUn_id() == unitId) {
					allExpert.get(i).setEx_unit(null);
					expertService.updateExpert(allExpert.get(i));
				}
			}
		}
		boolean boo = unitService.deleteById(unitId);
		PageCut<Unit> list = unitService.checkAll(page, 6);
		request.put("method", "view");
		request.put("paCut", list);
		return "view";
	}

	public String searchUnit() {
		Unit unit = unitService.checkUnitName(unitName);
		if (unit != null) {
			request.put("unit", unit);
		} else {
			request.put("Message", "暂无该单位");
		}
		return "searchUnit";
	}

}
