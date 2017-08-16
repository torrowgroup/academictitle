/**
 * 
 */
package com.torrow.title.services;

import java.util.List;

import com.torrow.title.entity.Manager;
import com.torrow.title.util.PageCut;

/**
 * @author 张金高
 *
 * @2017年8月14日下午1:11:29
 */
/*
 * 管理员管理接口
 */
public interface ManagerService {

	// 管理员登录
	public Manager login(String userName, String password);

	// 查看管理员，分页 马黎明
	public PageCut<Manager> getManager(int page, int pageSize);
	
	//添加管理员  马黎明
	public boolean addManager(Manager manager);
	//根据ID获取管理员的信息
	public Manager selectManager(int ma_id);
	//获取所有的管理员信息
	public List<Manager> getAllManager();
}
