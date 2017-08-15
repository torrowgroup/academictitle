package com.torrow.title.dao;

import org.springframework.stereotype.Service;

import com.torrow.title.base.BaseDao;
import com.torrow.title.entity.Expert;
import com.torrow.title.services.ExpertService;

/**
 * @author 张金高
 *
 * @2017年8月14日下午10:35:26
 */
@Service
public class ExpertDao extends BaseDao<Expert> implements ExpertService {

	@Override
	public Expert login(String userName, String password) {
		String hql = "from expert e where e.ex.userName = "+userName+" ";
		Expert expert = (Expert)this.uniqueResult(hql);
		if(expert!=null&&expert.getEx_password().equals(password)){
			return expert;
		}
		return null;
	}

	
}
