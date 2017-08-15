/**
 * 
 */
package com.torrow.title.services;

import com.torrow.title.entity.Manager;

/**
 * @author 张金高
 *
 * @2017年8月14日下午1:11:29
 */
/*
 * 管理员管理接口
 */
public interface ManagerService {

	//管理员登录
	public Manager login(String userName,String password);
}
