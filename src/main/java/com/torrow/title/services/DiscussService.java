package com.torrow.title.services;

import com.torrow.title.entity.Discuss;

/**
 * 
 * @author 马黎明
 *
 * 2017年8月15日上午10:03:29
 */
public interface DiscussService {

	//由参评人id得到评议类
	public Discuss getByParticipatorId(int pa_id);

}
