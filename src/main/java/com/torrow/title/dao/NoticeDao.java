/**
 * 
 */
package com.torrow.title.dao;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import com.torrow.title.base.BaseDao;
import com.torrow.title.entity.Majors;
import com.torrow.title.entity.Manager;
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
	@Override
	public PageCut<Notice> checkAll(int currentPage, int pageSize) {
		String hql = "select count(*) from Notice";
		int count = ((Long) this.uniqueResult(hql)).intValue();
		PageCut<Notice> pc = new PageCut<Notice>(currentPage, pageSize, count);
		pc.setData(this.getEntityLimitList("from Notice", (currentPage - 1) * pageSize, pageSize));
		return pc;

	}
	@Override
	public boolean add(Notice  notice ,String userName,Date date) {
		notice.setNo_managerName(userName);
		notice.setNo_issueData(date);
		return this.saveEntity(notice);
	}
	@Override
	public boolean  deleteById(int id) {
		boolean sign = false;
		try {
		String hql = "delete from Notice  n Where n.no_id= '"+id+"'";
		int mark = this.executeUpdate(hql);
		if (mark == 1) {
			sign = true;
		} else {
			sign = false;
		}

	} catch (Exception e) {
		e.printStackTrace();
	}
	return sign;
}

	@Override
	public Notice getNewNotice() {
		String hql = "from Notice where no_id = (select max(no_id) from Notice)";
		return (Notice)this.uniqueResult(hql);
	}
	
}
