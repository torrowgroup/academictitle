package com.torrow.title.services;

import java.util.List;

import com.torrow.title.entity.Unit;

/**
 * 
 * @author 马黎明
 *
 * 2017年8月15日上午10:48:11
 */
public interface UnitService {

	//查看所有单位信息，用于添加专家
	public List<Unit> selectUnit();

}
