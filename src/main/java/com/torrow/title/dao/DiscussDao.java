package com.torrow.title.dao;

import java.util.List;

import org.springframework.stereotype.Service;

import com.torrow.title.base.BaseDao;
import com.torrow.title.entity.Discuss;
import com.torrow.title.services.DiscussService;
import com.torrow.title.util.PageCut;
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

	@Override
	public PageCut<Discuss> getDiscuss(int page, int pageSize, String ask, String inquiry) {
		String hql = null;
		String selecthql = null;
		int count = 0;
		if (ask == null&&inquiry == null) {
			hql = "select count(*) from Discuss";
			selecthql = "from Discuss";
		} else {
			hql = "select count(*) from Discuss where "+ask+"='"+inquiry+"'";
			selecthql = "from Discuss where "+ask+"='"+inquiry+"'";
		}
		count = ((Long) this.uniqueResult(hql)).intValue();
		PageCut<Discuss> pc = new PageCut<Discuss>(page, pageSize, count);
		pc.setData(this.getEntityLimitList(selecthql, (page - 1) * pageSize, pageSize));
		return pc;
	}

	@Override
	public boolean deleteDiscuss(int di_id) {
		boolean sign = false;
		String hql = "delete from Discuss where di_id='" + di_id + "'";
		int mark = this.executeUpdate(hql);
		if (mark == 1) {
			sign = true;
		} else {
			sign = false;
		}
		return sign;
	}

	@Override
	public Discuss getDiscussById(int di_id) {
		return getEntity(di_id);
	}

	@Override
	public boolean updateDiscussNews(Discuss discuss) {
		return updateEntity(discuss);
	}

}
