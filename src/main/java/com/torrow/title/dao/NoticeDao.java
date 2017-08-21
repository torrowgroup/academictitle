/**
 * 
 */
package com.torrow.title.dao;

import java.util.List;

import org.springframework.stereotype.Service;

import com.torrow.title.base.BaseDao;
import com.torrow.title.entity.Notice;
import com.torrow.title.services.NoticeService;
import com.torrow.title.util.PageCut;

/**
 * @author 张金高
 *
 * @2017年8月18日下午10:45:20
 */
@Service
public class NoticeDao extends BaseDao<Notice> implements NoticeService {

	@Override
	public Notice getById(int no_id) {
		return this.getEntity(no_id);
	}

	@Override
	public PageCut<Notice> getPageCut(int curr, int pageSize, String inquiry) {
		String hql = "select count(*) from Notice";
		String selectHql =  "from Notice ";
		if(!inquiry.equals("all")){
			hql = "select count(*) from Notice n where n.no_head like '%"+inquiry+"%'"
					+ "or n.no_issueData like '%"+inquiry+"%'";
			selectHql =  "from Notice n where n.no_head like '%"+inquiry+"%'"	
					+ "or n.no_issueData like '%"+inquiry+"%'";
		}
		int count = ((Long) this.uniqueResult(hql)).intValue();
		PageCut<Notice> pc = new PageCut<Notice>(curr,pageSize,count);
		pc.setData(this.getEntityLimitList(selectHql, (curr-1)*pageSize, pageSize));
		return pc;
	}
	
}
