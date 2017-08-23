package com.torrow.title.dao;

import java.util.List;

import org.springframework.stereotype.Service;

import com.torrow.title.base.BaseDao;
import com.torrow.title.entity.Discuss;
import com.torrow.title.entity.Expert;
import com.torrow.title.entity.Notice;
import com.torrow.title.entity.Record;
import com.torrow.title.services.RecordService;
import com.torrow.title.util.PageCut;
/**
 * 
 * @author 马黎明
 *
 * 2017年8月15日上午11:02:52
 */
@Service
public class RecordDao extends BaseDao<Record> implements RecordService{

	
	@Override
	public PageCut<Record> getPageCut(int curr, int pageSize, String inquiry,Expert expert) {
		String hql = "select count(*) from Record r where r.re_expert.ex_id = "+expert.getEx_id()+"";
		String selectHql = "from Record r where r.re_expert.ex_id = "+expert.getEx_id()+"";
		if(!inquiry.equals("all")){//匹配评议记录的参评人姓名，职称，专家对评议人熟悉程度，总分
			hql += "and (r.re_participator.pa_name like '%"+inquiry+"%' or r.re_participator.pa_title.ti_titleName like '%"+inquiry+"%'"
							+ "or r.re_unfm like '%"+inquiry+"%' or r.re_score like '%"+inquiry+"%')";
			selectHql += "and (r.re_participator.pa_name like '%"+inquiry+"%' or r.re_participator.pa_title.ti_titleName like '%"+inquiry+"%'"
					+ "or r.re_unfm like '%"+inquiry+"%' or r.re_score like '%"+inquiry+"%')";	
		}
		int count = ((Long) this.uniqueResult(hql)).intValue();
		PageCut<Record> pc = new PageCut<Record>(curr,pageSize,count);
		pc.setData(this.getEntityLimitList(selectHql, (curr-1)*pageSize, pageSize));
		return pc;
	}
	
	@Override
	public List<Record> getAllRecord() {
		return this.selectAll();
	}

	@Override
	public List<Record> getByParticipatorId(int pa_id) {
		String hql = "from Record r where r.re_participator.pa_id = "+pa_id+"";
		return this.getEntityList(hql);
	}

	@Override
	public void save(Record record) {
		this.saveEntity(record);
	}

	@Override
	public Record getByRecordId(int re_id) {
		return this.getEntity(re_id);
	}

	@Override
	public void updateRecord(Record record) {
		this.updateEntity(record);
	}

	@Override
	public PageCut<Record> getByDiscussId(int curr, int pageSize, int pa_id) {
		String hql = "select count(*) from Record r where r.re_discuss.di_id = "+pa_id+"";
		String selectHql = "from Record r where r.re_discuss.di_id = "+pa_id+"";
		int count = ((Long) this.uniqueResult(hql)).intValue();
		PageCut<Record> pc = new PageCut<Record>(curr, pageSize, count);
		pc.setData(this.getEntityLimitList(selectHql, (curr - 1) * pageSize, pageSize));
		return pc;
	}

	@Override
	public PageCut<Record> getByParticiptorId(int curr, int pageSize, int id) {
		String hql = "select count(*) from Record r where r.re_participator.pa_id = "+id+"";
		String selectHql = "from Record r where r.re_participator.pa_id = "+id+"";
		int count = ((Long) this.uniqueResult(hql)).intValue();
		PageCut<Record> pc = new PageCut<Record>(curr, pageSize, count);
		pc.setData(this.getEntityLimitList(selectHql, (curr - 1) * pageSize, pageSize));
		return pc;
	}

	@Override
	public boolean emptyRecord() {
		List<Record> allRecord = this.selectAll();
		boolean boo = true;
		for(int i=0;i<allRecord.size();i++){
			boo = this.deleteEntity(allRecord.get(i));
			if(!boo){
				return false;
			}
		}
		return boo;
	}

}
