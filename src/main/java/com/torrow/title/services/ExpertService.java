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
	//查询专家，分页，模糊查询
	public PageCut<Expert> allExpert(int page, int pageSize,String inquiry);
	//根据用户名得到专家
	public Expert getByUserName(String userName);
	//马黎明
	//查询所有专家的信息，用于添加账号的对比
	public List<Expert> getAlllExpert();
	
	//查询所有的专家，分页
	public PageCut<Expert> getExpert(int page, int pageSize, String ask, String inquiry);
	
	//添加专家的信息
	public boolean addExpert(Expert expert);
	
	//得到修改专家的信息
	public Expert selectEcpert(int ex_id);
	
	//修改专家信息,修改个人资料，金高用
	public boolean updateExpert(Expert expert);

	//根据ID删除专家
	public boolean deletExpert(int ex_id);
	
	//得到除了修改的专家之外的所有专家
	public List<Expert> getSomeExpert(Expert experts);
}
