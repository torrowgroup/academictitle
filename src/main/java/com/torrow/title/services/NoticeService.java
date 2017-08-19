/**
 * 
 */
package com.torrow.title.services;

import java.util.List;

import com.torrow.title.entity.Notice;

/**
 * @author 张金高
 *
 * @2017年8月18日下午10:43:18
 */
public interface NoticeService {

	//张金高
	//得到所有的通知
	public List<Notice> allNotice();
	//由通知id得到通知
	public Notice getById(int no_id);

}
