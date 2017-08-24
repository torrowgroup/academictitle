/**
 * 
 */
package com.torrow.title.action.expert;

import java.util.List;

import com.opensymphony.xwork2.ModelDriven;
import com.torrow.title.base.BaseAction;
import com.torrow.title.entity.Expert;
import com.torrow.title.entity.Majors;
import com.torrow.title.entity.Notice;
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
	private int majorId;//得到修改后的专业id
	private int unitId;//得到修改后的单位id
	private int titleId;//得到修改后的职称id
	private String sort;//判断用户身份用于退出
	
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
		Majors major = majorsService.checkById(majorId);//分别由专业，单位，职称id得到其对象
		Unit unit = unitService.checkById(unitId);
		Title title = titleService.checkById(titleId);
		expert.setEx_major(major);
		expert.setEx_unit(unit);
		expert.setEx_title(title);
		if(expertService.updateExpert(expert)){
			session.put("expert", expert);
			request.put("message", "修改成功");
		} else {
			request.put("message", "修改失败");
		}
		myselfMessage();//得到个人信息
		return "updateMyself";
	}
	//回到首页
	public String back(){
		List<Notice> someNotice = noticeService.getNewNotice();
		if(someNotice.size()>0){
			Notice noticeNew = someNotice.get(0);// 得到最新一条通知
			request.put("noticeNew", noticeNew);
		}
		return "back";
	}
	//退出登录
	public String logOff(){
		return "logOff";
	}
	//清除登录信息
	public String out(){
		session.remove("expert");
		return "out";
	}
	@Override
	public Expert getModel() {
		if(expert==null){
			expert = new Expert();
		}
		return expert;
	}
	public final int getMajorId() {
		return majorId;
	}
	public final void setMajorId(int majorId) {
		this.majorId = majorId;
	}
	public final int getTitleId() {
		return titleId;
	}
	public final void setTitleId(int titleId) {
		this.titleId = titleId;
	}
	public final int getUnitId() {
		return unitId;
	}
	public final void setUnitId(int unitId) {
		this.unitId = unitId;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	
	
}
