package com.torrow.title.action.setting;

import com.torrow.title.base.BaseAction;
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
	List<Notice> list= noticeService.getPageCut(curr, pageSize, inquiry)
	return "view";
}
public String delete() {
	return "view";
}
public String add() {
	return "addNotice";
}
}
