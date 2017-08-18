package com.torrow.title.services;

import java.util.List;

import com.torrow.title.entity.Title;

public interface TitleService {

	//查询出所有职称，用于添加专家
	public List<Title> selectTitle();

}
