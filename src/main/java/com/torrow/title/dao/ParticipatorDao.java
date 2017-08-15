package com.torrow.title.dao;

import java.util.List;

import org.springframework.stereotype.Service;

import com.torrow.title.base.BaseDao;
import com.torrow.title.entity.Participator;
import com.torrow.title.services.ParticipatorService;
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

}
