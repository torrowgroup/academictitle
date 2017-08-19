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

	public PageCut<Majors> checkAll( int currentPage,int pageSize);//wqj 查看所有专业

	public boolean add(Majors majors);//wqj 添加专业

	public List<Majors> checkAll();

	public boolean update(Majors majors);

	public  Majors checkById(int id);

	public boolean deleteById(int id);

	

}
