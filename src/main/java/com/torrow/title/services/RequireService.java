package com.torrow.title.services;

import java.util.List;

import com.torrow.title.entity.Require;
import com.torrow.title.entity.Title;
import com.torrow.title.util.PageCut;

/**
 * 
 * @author 马黎明
 *
 *         2017年8月15日上午10:41:22
 */
public interface RequireService {

	// 张金高
	// 根据职称获得评议要求
	Require getByTitleId(int ti_id);

	// wqj添加评议要求
	public boolean add(Require require, Title title);

	// wqj更新评议要求f
	public boolean update(Require require, Title title);

	// wqj 通过评议ID查询评议要求
	public Require checkById(int id);

	// wqj 删除评议要求
	public boolean deleteById(int id);

	// wqj查看所有评议
	public PageCut<Require> checkAll(int currentPage, int pageSize);
	
	//获取所有require，不分页
	
	public List<Require> getAllRequire();

	// 更新数据库表
	public boolean updateRequire(Require require);

	// wqj根据职称查询评议要求
	public Require checkByTitleName(String titleName);

}
