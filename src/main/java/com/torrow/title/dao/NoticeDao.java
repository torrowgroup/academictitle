/**
 * 
 */
package com.torrow.title.dao;

import java.util.List;

import org.springframework.stereotype.Service;

import com.torrow.title.base.BaseDao;
import com.torrow.title.entity.Notice;
import com.torrow.title.services.NoticeService;

/**
 * @author 张金高
 *
 * @2017年8月18日下午10:45:20
 */
@Service
public class NoticeDao extends BaseDao<Notice> implements NoticeService {

	@Override
	public List<Notice> allNotice() {
		return this.selectAll();
	}

	
}
