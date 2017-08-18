package com.torrow.title.services;

import com.torrow.title.entity.Require;
import com.torrow.title.entity.Title;

/**
 * 
 * @author 马黎明
 *
 * 2017年8月15日上午10:41:22
 */
public interface RequireService {

	//张金高
	//根据职称获得评议要求
	Require getByTitleId(int ti_id);


}
