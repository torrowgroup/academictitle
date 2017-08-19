package com.torrow.title.services;

import java.util.List;

import com.torrow.title.entity.Record;

/**
 * 
 * @author 马黎明
 *
 * 2017年8月15日上午10:37:32
 */
public interface RecordService {

	//张金高
	//得到全部参评记录
	public List<Record> getAllRecord();
	//得到该参评人的所有评议记录
	public List<Record> getByParticipatorId(int pa_id);
	//保存评议记录
	public void save(Record record);
	//根据评议记录得到评议记录
	public Record getByRecordId(int re_id);
	//修改评议记录
	public void updateRecord(Record record);

}
