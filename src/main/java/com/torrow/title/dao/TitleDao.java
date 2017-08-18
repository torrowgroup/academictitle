package com.torrow.title.dao;

import java.util.List;

import org.springframework.stereotype.Service;

import com.torrow.title.base.BaseDao;
import com.torrow.title.entity.Title;
import com.torrow.title.services.TitleService;
/**
 * 
 * @author 马黎明
 *
 * 2017年8月15日上午11:06:16
 */
@Service
public class TitleDao extends BaseDao<Title> implements TitleService{

	@Override
	public List<Title> selectTitle() {
		return selectAll();
	}

}
