package com.torrow.title.action.setting;

import java.util.Date;
import java.util.List;

import com.torrow.title.base.BaseAction;
import com.torrow.title.entity.Manager;
import com.torrow.title.entity.Notice;

public class NoticeManageAction extends BaseAction {
	private int noticeId;
	private Notice notice;
	int page = 1;
	public int getNoticeId() {
		return noticeId;
	}
	public void setNoticeId(int noticeId) {
		this.noticeId = noticeId;
	}
	public Notice getNotice() {
		return notice;
	}
	public void setNotice(Notice notice) {
		this.notice = notice;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
public String view() {
	List<Notice> list= (List<Notice>) noticeService.checkAll(page, 5);
	System.out.println(list);
	request.put("notice", list);
	return "view";
}
public String delete() {
	boolean boo=noticeService.deleteById(noticeId);
	List<Notice> list= (List<Notice>) noticeService.checkAll(page, 5);
	System.out.println(list);
	request.put("notice", list);
	return "view";
}
public String add() {
	Date date = new Date();
	
	boolean boo = noticeService.add(notice,(Manager) session.get("manager"),date);
	return "addMajors";
}
}
