/**
 * 
 */
package com.torrow.title.services;

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
	//得到所有通知并分页
	public PageCut<Notice> getPageCut(int curr, int pageSize,String inquiry);//得到符合某种条件的成员
	//得到最新一条通知
	public Notice getNewNotice();
	
}
