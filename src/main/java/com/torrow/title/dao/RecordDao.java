package com.torrow.title.dao;

import java.util.List;

import org.springframework.stereotype.Service;

import com.torrow.title.base.BaseDao;
import com.torrow.title.entity.Record;
import com.torrow.title.services.RecordService;
/**
 * 
 * @author 马黎明
 *
 * 2017年8月15日上午11:02:52
 */
@Service
public class RecordDao extends BaseDao<Record> implements RecordService{

	@Override
	public List<Record> getAllRecord() {
		return this.selectAll();
	}

	@Override
	public List<Record> getByParticipatorId(int pa_id) {
		String hql = "from Record r where r.re_participator.pa_id = "+pa_id+"";
		return this.getEntityList(hql);
	}

}
