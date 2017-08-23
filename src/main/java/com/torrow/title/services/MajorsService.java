package com.torrow.title.services;

import java.util.List;

import com.torrow.title.entity.Majors;
import com.torrow.title.util.PageCut;

/**
 * 
 * @author 马黎明
 *
 * 2017年8月15日上午10:03:40
 */
public interface MajorsService {

	
	//查询所有专业信息，用于添加专家，黎明用
	public List<Majors> selectMajors();//张金高用
	
	public PageCut<Majors> checkAll( int currentPage,int pageSize);//wqj 查看所有专业

	public boolean add(Majors majors);//wqj 添加专业

	public List<Majors> checkAll();//wqj 查看所有专业（不分页）

	public boolean update(Majors majors);//wqj更新专业信息

	public  Majors checkById(int id);//张金高用

	public boolean deleteById(int id);//通过ID查询

	public Majors checkMajorsName(String majorsName);//通过专业名称查询

	

}
