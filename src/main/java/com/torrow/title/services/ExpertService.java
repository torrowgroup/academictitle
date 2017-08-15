/**
 * 
 */
package com.torrow.title.services;

import com.torrow.title.entity.Expert;

/**
 * @author 张金高
 *
 * @2017年8月14日下午10:13:52
 */
public interface ExpertService {

	//专家登录
	public Expert login(String userName,String password);
}
