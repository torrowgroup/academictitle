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

	@Override
	public boolean addParticipator(Participator participator) {
		return saveEntity(participator);
	}

	@Override
	public boolean updateParticipator(Participator participator) {
		return updateEntity(participator);
	}

	@Override
	public boolean deletParticipator(int pa_id) {
		boolean sign = false;
		String hql = "delete from Participator where pa_id='" + pa_id + "'";
		int mark = this.executeUpdate(hql);
		if (mark == 1) {
			sign = true;
		} else {
			sign = false;
		}
		return sign;
	}

	@Override
	public PageCut<Participator> allParticipator(int curr, int pageSize, String inquiry) {
		String hql = "select count(*) from Participator p ";
		String selecthql = "from Participator p ";
		if (!inquiry.equals("all")) {//匹配参评人姓名，专业，单位，申报职称
			hql += " where p.pa_name like '%"+inquiry+"%' or p.pa_majors.maj_majorName like '%"+inquiry+"%'"
					+ " or p.pa_unit.un_unitName like '%"+inquiry+"%' or p.pa_title.ti_titleName like '%"+inquiry+"%'";
			selecthql += " where p.pa_name like '%"+inquiry+"%' or p.pa_majors.maj_majorName like '%"+inquiry+"%'"
					+ " or p.pa_unit.un_unitName like '%"+inquiry+"%' or p.pa_title.ti_titleName like '%"+inquiry+"%'";
		}
		int count = ((Long) this.uniqueResult(hql)).intValue();
		PageCut<Participator> pc = new PageCut<Participator>(curr, pageSize, count);
		pc.setData(this.getEntityLimitList(selecthql, (curr - 1) * pageSize, pageSize));
		return pc;
	}

	@Override
	public boolean emptyParticipator() {
		List<Participator> allParticipator = this.selectAll();
		boolean boo = true;
		for(int i=0;i<allParticipator.size();i++){
			boo = this.deleteEntity(allParticipator.get(i));
			if(!boo){
				return false;
			}
		}
		return true;
	}
	@Override
	public List<Participator> getAll(){
		return selectAll();
		
	}

}
