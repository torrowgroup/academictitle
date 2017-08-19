package com.torrow.title.services;

import com.torrow.title.entity.Title;
import com.torrow.title.util.PageCut;

public interface TitleService {
	
	//查看所有职称
	public PageCut<Title> checkAll(int currentPage, int pageSize);
	//添加职称
	public boolean add(Title title);
	//更新职称
	public  boolean update(Title title);
	//根据ID查询职称
	public Title checkById(int id);
	//根据ID删除
	public boolean deleteById(int id);

}
