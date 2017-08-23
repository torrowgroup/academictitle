package com.torrow.title.services;

import java.util.List;

import com.torrow.title.entity.Expert;
import com.torrow.title.entity.Record;
import com.torrow.title.util.PageCut;

/**
 * 
 * @author 马黎明
 *
 * 2017年8月15日上午10:37:32
 */
public interface RecordService {

	//张金高
	//分页得到参评记录,根据专家已评的
	public PageCut<Record> getPageCut(int page, int i, String inquiry,Expert expert);
	//得到全部记录
	public List<Record> getAllRecord();
	//得到该参评人的所有评议记录
	public List<Record> getByParticipatorId(int pa_id);
	//保存评议记录
	public void save(Record record);
	//根据评议记录得到评议记录
	public Record getByRecordId(int re_id);
	//修改评议记录
	public void updateRecord(Record record);
	//根据评议类id得到评议记录
	public PageCut<Record> getByDiscussId(int page, int i, int pa_id);
	//分页，根据参评人id得到评议记录
	public PageCut<Record> getByParticiptorId(int page, int i, int id);
	//清空评议表
	public boolean emptyRecord();

}
