package com.torrow.title.dao;

import java.util.List;

import org.springframework.stereotype.Service;

import com.torrow.title.base.BaseDao;
import com.torrow.title.entity.Unit;
import com.torrow.title.services.UnitService;
import com.torrow.title.util.PageCut;
/**
 * 
 * @author 马黎明
 *
 * 2017年8月15日上午11:08:16
 */
@Service
public class UnitDao extends BaseDao<Unit> implements UnitService{
	@Override
	public PageCut<Unit> checkAll(int currentPage, int pageSize) {
		String hql = "select count(*) from Unit";
		int count = ((Long) this.uniqueResult(hql)).intValue();
		PageCut<Unit> pc = new PageCut<Unit>(currentPage, pageSize, count);
		pc.setData(this.getEntityLimitList("from Unit", (currentPage - 1) * pageSize, pageSize));
		return pc;

	}
	@Override
	public boolean add(Unit  unit) {
			return this.saveEntity(unit);
	}
	@Override
	public boolean update(Unit  unit) {
		return this.updateEntity(unit);
	}
	@Override
	public Unit checkById( int id) {
		String hql = "from Unit  u Where u.un_id= '"+id+"'";
		Unit  unit= (Unit) uniqueResult(hql);
		return unit;
	}
	@Override
	public boolean  deleteById(int id) {
		boolean sign = false;
		try {
		String hql = "delete from Unit  u Where u.un_id= '"+id+"'";
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
	public List<Unit> selectUnit() {
		return this.selectAll();
	}

	@Override
	public Unit checkUnitName( String unitName) {
		String hql = "from Unit  u Where u.un_unitName= '"+unitName+"'";
		Unit  unit= (Unit) uniqueResult(hql);
		return unit;
	}
}
