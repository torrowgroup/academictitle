/**
 * 
 */
package com.torrow.title.dao;

import java.util.List;

import org.springframework.stereotype.Service;

import com.torrow.title.base.BaseDao;
import com.torrow.title.entity.Manager;
import com.torrow.title.services.ManagerService;
import com.torrow.title.util.PageCut;

/**
 * @author 张金高
 *
 * @2017年8月14日下午1:12:52
 */
/*
 * 管理员管理类业务层，dao层
 */
@Service
public class ManagerDao extends BaseDao<Manager> implements ManagerService {

	@Override
	public Manager login(String userName, String password) {
		String hql = "from Manager m where m.ma_userName = " + userName + "";
		Manager manager = (Manager) this.uniqueResult(hql);
		if (manager != null && manager.getMa_password().equals(password)) {
			return manager;
		}
		return null;
	}

	@Override
	public PageCut<Manager> getManager(int page, int pageSize) {
		String hql;
		int count = 0;
		hql = "select count(*) from Manager";
		count = ((Long) this.uniqueResult(hql)).intValue();
		PageCut<Manager> pc = new PageCut<Manager>(page, pageSize, count);
		pc.setData(this.getEntityLimitList("from Manager", (page - 1) * pageSize, pageSize));
		return pc;
	}

	@Override
	public boolean addManager(Manager manager) {
		return saveEntity(manager);
	}

	@Override
	public Manager selectManager(int ma_id) {
		String hql = "from Manager where ma_id='"+ma_id+"'";
		return (Manager) uniqueResult(hql);
	}

	@Override
	public List<Manager> getAllManager() {
		return selectAll();
	}

}
