/**
 * 
 */
package com.torrow.title.dao;

import org.springframework.stereotype.Service;

import com.torrow.title.base.BaseDao;
import com.torrow.title.entity.Manager;
import com.torrow.title.services.ManagerService;

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
	public boolean login(String userName, String password) {
		String hql = "from Manager m where m.userName = "+userName+"";
		Manager manager =(Manager)this.uniqueResult(hql);
		if(manager!=null&&manager.getMa_userName().equals(userName)
					&&manager.getMa_password().equals(password)){
			return true;
		}
		return false;
	}

	
}
