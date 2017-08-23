package com.torrow.title.dao;


import java.util.ArrayList;
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
	public List<Majors> checkAll(){
		List<Majors> list = new ArrayList<Majors>();
		String hql = "from Majors";
		list=this.getEntityList(hql);
		return list;
	}

	@Override
	public List<Majors> selectMajors() {
		return selectAll();
	}
	
	@Override
	public boolean add(Majors majors) {
			return this.saveEntity(majors);
	}

			
	@Override
	public boolean update(Majors majors) {
		return this.updateEntity(majors);
	}
	@Override
	public Majors checkById( int id) {
		String hql = "from Majors  m Where m.maj_id= '"+id+"'";
		Majors major= (Majors) uniqueResult(hql);
		return major;
	}
		@Override
		public boolean  deleteById(int id) {
			boolean sign = false;
			try {
			String hql = "delete from Majors  m Where m.maj_id= '"+id+"'";
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
		public Majors checkMajorsName( String majorsName) {
			String hql = "from Majors  m Where m.maj_majorName= '"+majorsName+"'";
			Majors major= (Majors) uniqueResult(hql);
			return major;
		}
}
