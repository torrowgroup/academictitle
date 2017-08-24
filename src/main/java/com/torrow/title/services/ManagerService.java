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

	//张金高
	// 管理员登录
	public Manager login(String userName, String password);
	//根据用户名得到管理员
	public Manager getByUserName(String userName);

	// 查看管理员，分页 马黎明
	public PageCut<Manager> getManager(int page, int pageSize, String ask, String inquiry);
	
	//添加管理员  马黎明
	public boolean addManager(Manager manager);
	
	//根据ID获取管理员的信息
	public Manager selectManager(int ma_id);
	
	//获取除去修改的所有的管理员信息，用于修改账号的对比
	public List<Manager> getAllManager(Manager admain);
	
	//更改管理员信息
	public boolean updateManager(Manager manager);

	//删除管理员信息
	public boolean deletManager(int ma_id);
	
	//获取所有的管理员信息，用于添加账号的对比
	public List<Manager> getAllAdmain();

}
