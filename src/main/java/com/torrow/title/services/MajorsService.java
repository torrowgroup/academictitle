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

	//查询所有专业信息，用于添加专家
	public List<Majors> selectMajors();
	public PageCut<Majors> checkAll( int currentPage,int pageSize);//wqj 查看所有专业

	public boolean add(Majors majors);//wqj 添加专业

}
