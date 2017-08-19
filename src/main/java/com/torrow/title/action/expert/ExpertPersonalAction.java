/**
 * 
 */
package com.torrow.title.action.expert;

import java.util.List;

import com.opensymphony.xwork2.ModelDriven;
import com.torrow.title.base.BaseAction;
import com.torrow.title.entity.Expert;
import com.torrow.title.entity.Majors;
import com.torrow.title.entity.Title;
import com.torrow.title.entity.Unit;

/**
 * @author 张金高
 *
 * @2017年8月15日上午11:08:58
 */
public class ExpertPersonalAction extends BaseAction implements ModelDriven<Expert> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Expert expert;
	private String majorName;//得到修改后的专业名称
	private String unitName;//得到修改后的单位名称
	private String titleName;//得到修改后的职称名称
	
	//得到个人信息
	public String myselfMessage(){
		List<Majors> allMajors = majorsService.selectMajors();
		List<Unit> allUnit = unitService.selectUnit();
		List<Title> allTitle = titleService.selectTitle();
		request.put("allMajors", allMajors);
		request.put("allUnit", allUnit);
		request.put("allTitle", allTitle);
		return "getMyself";
	}
	//修改个人信息
	public String updateMyself(){
		Majors major = majorsService.getByName(majorName);//分别由专业，单位，职称名称得到其对象
		Unit unit = unitService.getByName(unitName);
		Title title = titleService.getByName(titleName);
		expert.setEx_major(major);
		expert.setEx_unit(unit);
		expert.setEx_title(title);
		if(expertService.updateExpert(expert)){
			request.put("message", "修改成功");
		} else {
			request.put("message", "修改失败");
		}
		return "updateMyself";
	}
	
	@Override
	public Expert getModel() {
		if(expert==null){
			expert = new Expert();
		}
		return expert;
	}
	public final String getMajorName() {
		return majorName;
	}
	public final void setMajorName(String majorName) {
		this.majorName = majorName;
	}
	public final String getUnitName() {
		return unitName;
	}
	public final void setUnitName(String unitName) {
		this.unitName = unitName;
	}
	public final String getTitleName() {
		return titleName;
	}
	public final void setTitleName(String titleName) {
		this.titleName = titleName;
	}

}
