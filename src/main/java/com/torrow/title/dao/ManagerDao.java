/**
 * 
 */
package com.torrow.title.dao;

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
		String hql = "from Manager m where m.ma_userName = "+userName+"";
		Manager manager =(Manager)this.uniqueResult(hql);
		if(manager!=null&&manager.getMa_password().equals(password)){
			return manager;
		}
		return null;
	}

	@Override
	public PageCut<Manager> getManager(int page, int pageSize) {
		// TODO Auto-generated method stub
		return null;
	}

	
}
