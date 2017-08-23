package com.torrow.title.services;

import java.util.List;
import java.util.Date;
import com.torrow.title.entity.Notice;
import com.torrow.title.util.PageCut;

/**
 * @author 张金高
 *
 * @2017年8月18日下午10:43:18
 */
public interface NoticeService {

	//张金高
	//由通知id得到通知
	public Notice getById(int no_id);
	public PageCut<Notice> getPageCut(int curr, int pageSize,String inquiry);//得到符合某种条件的成员
	//得到最新1条或6条通知
	public List<Notice> getNewNotice();
	//分页查询所有通知
	public PageCut<Notice> checkAll(int currentPage, int pageSize);
	//添加通知
	public boolean add(Notice notice, String uaerName,Date date);
	//根据ID删除通知
	public boolean deleteById(int id);
	
}
