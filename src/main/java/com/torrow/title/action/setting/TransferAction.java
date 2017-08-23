


package com.torrow.title.action.setting;

import java.util.List;

import com.torrow.title.base.BaseAction;
import com.torrow.title.entity.Majors;
import com.torrow.title.entity.Require;
import com.torrow.title.entity.Title;
import com.torrow.title.entity.Unit;

public class TransferAction extends BaseAction {
	private int majorsId;
	private int titleId;
	private int unitId;
	private int requireId;

	public int getUnitId() {
		return unitId;
	}

	public void setUnitId(int unitId) {
		this.unitId = unitId;
	}

	public int getRequireId() {
		return requireId;
	}

	public void setRequireId(int requireId) {
		this.requireId = requireId;
	}

	public int getTitleId() {
		return titleId;
	}

	public void setTitleId(int titleId) {
		this.titleId = titleId;
	}

	public int getMajorsId() {
		return majorsId;
	}

	public void setMajorsId(int majorsId) {
		this.majorsId = majorsId;
	}

	public String addMajors() {
		return "addMajors";
	}

	public String addTitle() {
		return "addTitle";
	}

	public String addReviewRequirements() {
		List list = titleService.selectTitle();
		session.put("reqlist", list);
		request.put("reqlist", list);
		return "addReviewRequirements";
	}

	public String addUnit() {
		return "addUnit";
	}
	public String addNotice() {
		return "addNotice";
	}

	public String updateMajors() {
		Majors majors = majorsService.checkById(majorsId);
		request.put("majors", majors);
		return "updateMajors";
	}
	public String updateTitle() {
		Title title = titleService.checkById(titleId);
		request.put("title", title);
		return "updateTitle";
	}
	public String updateUnit() {
		Unit unit = unitService.checkById(unitId);
		request.put("unit", unit);
		return "updateUnit";
	}
	public String updateRequire() {
		Require req = requireService.checkById(requireId);
		request.put("req",req);
		session.put("title", req.getRe_title());
		return "updateRequire";
		
	}
}
