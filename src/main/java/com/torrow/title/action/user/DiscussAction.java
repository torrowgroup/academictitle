package com.torrow.title.action.user;

import com.opensymphony.xwork2.ModelDriven;
import com.torrow.title.base.BaseAction;
import com.torrow.title.entity.Discuss;
import com.torrow.title.entity.Participator;
import com.torrow.title.util.PageCut;

public class DiscussAction extends BaseAction implements ModelDriven<Discuss>{
	private int page = 1;// 初始页数
	private String ask;// 查询的条件
	private String inquiry;// 查询的内容
	private String partname;//参评人的名字
	private int partid;//参评人的ID
	private Discuss discuss;
	
	public String select() {
		if (ask == null && inquiry == null) {
			ask = (String) session.get("ask");
			inquiry = (String) session.get("inquiry");
		} else if (ask.equals("all")) {
			ask = null;
		}
		PageCut<Discuss> pCut = discussService.getDiscuss(page, 4, ask, inquiry);
		if (pCut.getData().size() == 0) {
			request.put("message", "无此记录");
		}
		request.put("messagenews", pCut);
		session.put("ask", ask);
		session.put("inquiry", inquiry);
		return "select";
	}
	public String toUpdate(){
		Discuss discu = discussService.getDiscussById(discuss.getDi_id());
		request.put("discu", discu);
		return "update";
	}
	
	public String update(){
		Participator participator = participatorService.getParticipatorById(partid);
		participator.setPa_name(partname);
		discuss.setDi_participator(participator);
		boolean sign = discussService.updateDiscussNews(discuss);
		if (sign) {
			request.put("message","修改成功");
		} else {
			request.put("message","修改失败");
		}
		return select();
	}
	
	public String delete(){
		boolean sign = discussService.deleteDiscuss(discuss.getDi_id());
		if (sign) {
			request.put("message","删除成功");
		} else {
			request.put("message","删除失败");
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
	
	public String getPartname() {
		return partname;
	}
	
	public void setPartname(String partname) {
		this.partname = partname;
	}
	
	public int getPartid() {
		return partid;
	}
	
	public void setPartid(int partid) {
		this.partid = partid;
	}
	
	@Override
	public Discuss getModel() {
		if (discuss == null) {
			discuss = new Discuss();
		}
		return discuss;
	}
}
