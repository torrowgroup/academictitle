package com.torrow.title.services;

import java.util.List;

import com.torrow.title.entity.Majors;

/**
 * 
 * @author 马黎明
 *
 * 2017年8月15日上午10:03:40
 */
public interface MajorsService {

	//查询所有专业信息，用于添加专家
	public List<Majors> selectMajors();

}
