/**
 * 
 */
package com.torrow.title.services;

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
}
