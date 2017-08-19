/**
 * 
 */
package com.torrow.title.services;

import java.util.List;

import com.torrow.title.entity.Expert;
import com.torrow.title.util.PageCut;

/**
 * @author 张金高
 *
 * @2017年8月14日下午10:13:52
 */
public interface ExpertService {
	
	//张金高
	//专家登录
	public Expert login(String userName,String password);
	//修改个人资料
	public boolean updateExpert(Expert expert);

	//查询所有专家的信息，用于添加账号的对比
	public List<Expert> getAlllExpert();
	
	//查询所有的专家，分页
	public PageCut<Expert> getExpert(int page, int pageSize, String ask, String inquiry);
	
}
