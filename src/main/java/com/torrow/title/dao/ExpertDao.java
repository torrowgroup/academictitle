package com.torrow.title.dao;

import java.util.List;

import org.springframework.stereotype.Service;

import com.torrow.title.base.BaseDao;
import com.torrow.title.entity.Expert;
import com.torrow.title.services.ExpertService;
import com.torrow.title.util.PageCut;

/**
 * @author 张金高
 *
 * @2017年8月14日下午10:35:26
 */
@Service
public class ExpertDao extends BaseDao<Expert> implements ExpertService {

	@Override
	public Expert login(String userName, String password) {
		String hql = "from Expert e where e.ex_userName = '"+userName+"'";
		Expert expert = (Expert)this.uniqueResult(hql);
		if(expert!=null&&expert.getEx_password().equals(password)){
			return expert;
		}
		return null;
	}

	@Override
	public List<Expert> getAlllExpert() {
		return selectAll();
	}

	@Override
	public PageCut<Expert> getExpert(int page, int pageSize, String ask, String inquiry) {
		String hql = null;
		String selecthql = null;
		int count = 0;
		if (ask == null&&inquiry == null) {
			hql = "select count(*) from Expert";
			selecthql = "from Expert";
		} else {
			hql = "select count(*) from Expert where "+ask+"='"+inquiry+"'";
			selecthql = "from Expert where "+ask+"='"+inquiry+"'";
		}
		count = ((Long) this.uniqueResult(hql)).intValue();
		PageCut<Expert> pc = new PageCut<Expert>(page, pageSize, count);
		pc.setData(this.getEntityLimitList(selecthql, (page - 1) * pageSize, pageSize));
		return pc;
	}

	@Override
	public boolean addExpert(Expert expert) {
		return saveEntity(expert);
	}

	@Override
	public Expert selectEcpert(int ex_id) {
		String hql = "from Expert where ex_id='"+ex_id+"'";
		return (Expert) uniqueResult(hql);
	}

	@Override
	public boolean updateExpert(Expert expert) {
		return updateEntity(expert);
	}

	@Override
	public boolean deletExpert(int ex_id) {
		boolean sign = false;
		String hql = "delete from Expert where ex_id='" + ex_id + "'";
		int mark = this.executeUpdate(hql);
		if (mark == 1) {
			sign = true;
		} else {
			sign = false;
		}
		return sign;
	}

	@Override
	public List<Expert> getSomeExpert(Expert experts) {
		String username = experts.getEx_userName();
		String hql = "from Expert where ex_userName!='"+username+"'";
		return getEntityList(hql);
	}

	@Override
	public PageCut<Expert> allExpert(int curr, int pageSize,String inquiry) {
		String hql = "select count(*) from Expert e";
		String selecthql = "from Expert e";
		if (!inquiry.equals("all")) {//模糊查询，匹配专家姓名，专业，单位，职称
			hql += " where e.ex_name like '%"+inquiry+"%' or e.ex_majors.maj_majorName like '%"+inquiry+"%'"
					+ " or e.ex_unit.un_unitName like '%"+inquiry+"%' or e.ex_title.ti_titleName like '%"+inquiry+"%'";
			selecthql += " where e.ex_name like '%"+inquiry+"%' or e.ex_majors.maj_majorName like '%"+inquiry+"%'"
					+ " or e.ex_unit.un_unitName like '%"+inquiry+"%' or e.ex_title.ti_titleName like '%"+inquiry+"%'";
		}
		int count = ((Long) this.uniqueResult(hql)).intValue();
		PageCut<Expert> pc = new PageCut<Expert>(curr, pageSize, count);
		pc.setData(this.getEntityLimitList(selecthql, (curr - 1) * pageSize, pageSize));
		return pc;
	}

	@Override
	public Expert getByUserName(String userName) {
		String hql = "from Expert e where e.ex_userName = '"+userName+"'";
		return (Expert)this.uniqueResult(hql);
	}

	
}
