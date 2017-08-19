package com.torrow.title.dao;

import java.util.List;

import org.springframework.stereotype.Service;

import com.torrow.title.base.BaseDao;
import com.torrow.title.entity.Participator;
import com.torrow.title.services.ParticipatorService;
import com.torrow.title.util.PageCut;
/**
 * 
 * @author 马黎明
 *
 * 2017年8月15日上午11:00:19
 */
@Service
public class ParticipatorDao extends BaseDao<Participator> implements ParticipatorService{

	@Override
	public List<Participator> getAllParticipator() {
		return this.selectAll();
	}

	@Override
	public Participator getParticipatorById(int pa_id) {
		return this.getEntity(pa_id);
	}

	@Override
	public PageCut<Participator> getParticipator(int page, int pageSize, String ask, String inquiry) {
		String hql = null;
		String selecthql = null;
		int count = 0;
		if (ask == null&&inquiry == null) {
			hql = "select count(*) from Participator";
			selecthql = "from Participator";
		} else {
			hql = "select count(*) from Participator where "+ask+"='"+inquiry+"'";
			selecthql = "from Participator where "+ask+"='"+inquiry+"'";
		}
		count = ((Long) this.uniqueResult(hql)).intValue();
		PageCut<Participator> pc = new PageCut<Participator>(page, pageSize, count);
		pc.setData(this.getEntityLimitList(selecthql, (page - 1) * pageSize, pageSize));
		return pc;
	}

}
