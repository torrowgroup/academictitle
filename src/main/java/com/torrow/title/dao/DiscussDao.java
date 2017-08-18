package com.torrow.title.dao;

import java.util.List;

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

	@Override
	public List<Discuss> getAllDiscuss() {
		return selectAll();
	}

	@Override
	public void saveDiscuss(Discuss discussDown) {
		this.saveEntity(discussDown);
	}

	@Override
	public void updateDiscuss(Discuss discuss) {
		this.updateEntity(discuss);
	}

	@Override
	public List<Discuss> rankDiscuss(String titleName) {
		String hql = "from Discuss s order by di_averageA desc";
		List<Discuss> allDiscuss = this.getEntityList(hql);
		for(int i=0;i<allDiscuss.size();i++){
			String titleNameDb = allDiscuss.get(i).getDi_participator().getPa_title().getTi_titleName();
			if(!titleNameDb.equals(titleName)){
				allDiscuss.remove(i);
				i--;
			}
		}
		return allDiscuss;
	}

}
