package com.torrow.title.dao;

import java.util.List;

import org.springframework.stereotype.Service;

import com.torrow.title.base.BaseDao;
import com.torrow.title.entity.Unit;
import com.torrow.title.services.UnitService;
/**
 * 
 * @author 马黎明
 *
 * 2017年8月15日上午11:08:16
 */
@Service
public class UnitDao extends BaseDao<Unit> implements UnitService{

	@Override
	public List<Unit> selectUnit() {
		return selectAll();
	}

	@Override
	public Unit getByName(String unitName) {
		String hql = "from Unit u where u.un_unitName = "+unitName+"";
		return (Unit) this.uniqueResult(hql);
	}
 
}
