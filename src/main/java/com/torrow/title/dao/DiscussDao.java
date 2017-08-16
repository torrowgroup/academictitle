package com.torrow.title.dao;

import org.springframework.stereotype.Service;

import com.torrow.title.base.BaseDao;
import com.torrow.title.entity.Discuss;
import com.torrow.title.services.DiscussService;
/**
 * 
 * @author 马黎明
 *
 * 2017年8月15日上午11:00:12
 */
@Service
public class DiscussDao extends BaseDao<Discuss> implements DiscussService{

	@Override
	public Discuss getByParticipatorId(int pa_id) {
		String hql = "from Discuss d where d.di_participator.pa_id = "+pa_id+"";
		return (Discuss)this.uniqueResult(hql);
	}

}
