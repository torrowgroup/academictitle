package com.torrow.title.dao;


import java.util.List;

import org.springframework.stereotype.Service;

import com.torrow.title.base.BaseDao;
import com.torrow.title.entity.Majors;
import com.torrow.title.services.MajorsService;
import com.torrow.title.util.PageCut;

/**
 * 
 * @author 马黎明
 *
 *         2017年8月15日上午11:01:12
 */
@Service
public class MajorsDao extends BaseDao<Majors> implements MajorsService {
	@Override
	public PageCut<Majors> checkAll(int currentPage, int pageSize) {
		String hql = "select count(*) from Majors";
		int count = ((Long) this.uniqueResult(hql)).intValue();
		PageCut<Majors> pc = new PageCut<Majors>(currentPage, pageSize, count);
		pc.setData(this.getEntityLimitList("from Majors", (currentPage - 1) * pageSize, pageSize));
		return pc;

	}

	@Override
	public List<Majors> selectMajors() {
		return selectAll();
	}
	
	@Override
	public boolean add(Majors majors) {
			return this.saveEntity(majors);
	}
			
}
