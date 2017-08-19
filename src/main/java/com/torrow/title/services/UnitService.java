package com.torrow.title.services;

import com.torrow.title.entity.Majors;
import com.torrow.title.entity.Unit;
import com.torrow.title.util.PageCut;

/**
 * 
 * @author 马黎明
 *
 * 2017年8月15日上午10:48:11
 */
public interface UnitService {
	
	//查看所有部门
	public PageCut<Unit> checkAll(int currentPage, int pageSize);
	//添加部门
	public boolean add(Unit unit);
	//修改部门
	public boolean update(Unit unit);
	//以部门ID查询部门
	public Unit checkById(int id);
	//以部门ID删除
	public boolean deleteById(int id);

}
