/**
 * 
 */
package com.torrow.title.action.expert;

import java.util.List;

import com.opensymphony.xwork2.ModelDriven;
import com.torrow.title.base.BaseAction;
import com.torrow.title.entity.Notice;
import com.torrow.title.util.PageCut;

/**
 * @author 张金高
 *
 * @2017年8月18日下午10:25:59
 */
public class ExpertNoticeAction extends BaseAction implements ModelDriven<Notice> {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2602901656187684334L;
	private Notice notice;
	private int page = 1;//记录页码
	private String inquiry;//得到查询的内容
	
	//查看所有的通知
	public String allNotice(){
		if(inquiry==null){
			inquiry = (String)session.get("inquiry");
		}
		PageCut<Notice> pCut=noticeService.getPageCut(page,4,inquiry);
		if(pCut.getData().isEmpty()){
			request.put("message", "没有发布通知");
		}
		request.put("pCut", pCut);
		session.put("inquiry", inquiry);//将查询内容放在session中，以便在点上一页，下一页时使用
		return "allNotice";
	}
	//查看通知详情
	public String noticeDetail(){
		Notice noticeDb = noticeService.getById(notice.getNo_id());
		request.put("notice", noticeDb);
		return "noticeDetail";
	}
	
	
	
	@Override
	public Notice getModel() {
		if(notice==null){
			notice = new Notice();
		}
		return notice;
	}
	public final int getPage() {
		return page;
	}
	public final void setPage(int page) {
		this.page = page;
	}
	public final String getInquiry() {
		return inquiry;
	}
	public final void setInquiry(String inquiry) {
		this.inquiry = inquiry;
	}

	
}
