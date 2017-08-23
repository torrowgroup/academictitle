package com.torrow.title.services;

import com.torrow.title.entity.Majors;
import com.torrow.title.entity.Unit;
import com.torrow.title.util.PageCut;
import java.util.List;

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
	public Unit checkById(int id);//张金高用
	//以部门ID删除
	public boolean deleteById(int id);

	//查看所有单位信息，用于添加专家
	public List<Unit> selectUnit();//张金高用
	public Unit checkUnitName(String unitName);

}
