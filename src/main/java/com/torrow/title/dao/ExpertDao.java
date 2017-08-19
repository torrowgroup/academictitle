package com.torrow.title.dao;

import java.util.List;

import org.springframework.stereotype.Service;

import com.torrow.title.base.BaseDao;
import com.torrow.title.entity.Expert;
import com.torrow.title.entity.Manager;
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
		String hql = "from Expert e where e.ex_userName = "+userName+" ";
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
	public boolean updateExpert(Expert expert) {
		return this.updateEntity(expert);
	}

	
}
