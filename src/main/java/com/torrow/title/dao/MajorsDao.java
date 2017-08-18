package com.torrow.title.dao;

import java.util.List;

import org.springframework.stereotype.Service;

import com.torrow.title.base.BaseDao;
import com.torrow.title.entity.Majors;
import com.torrow.title.services.MajorsService;
/**
 * 
 * @author 马黎明
 *
 * 2017年8月15日上午11:01:12
 */
@Service
public class MajorsDao extends BaseDao<Majors> implements MajorsService{

	@Override
	public List<Majors> selectMajors() {
		return selectAll();
	}

}
