package com.torrow.title.services;

import java.util.List;

import com.torrow.title.entity.Title;

public interface TitleService {

	//查询出所有职称，用于添加专家
	public List<Title> selectTitle();//张金高用
	//张金高
	//由职称名称得到职称对象
	public Title getByName(String titleName);

}
