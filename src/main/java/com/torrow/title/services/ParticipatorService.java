package com.torrow.title.services;

import java.util.List;

import com.torrow.title.entity.Participator;
import com.torrow.title.util.PageCut;

/**
 * 
 * @author 马黎明
 *
 * 2017年8月15日上午10:34:37
 */
public interface ParticipatorService {
	//张金高
	//得到全部的参评人员
	public List<Participator> getAllParticipator();
	//分页，模糊查询
	public PageCut<Participator> allParticipator(int page, int i, String inquiry);
	//清空评议人员
	public boolean emptyParticipator();
	
	//根据id得到参评人
	public Participator getParticipatorById(int pa_id);//张金高用
	
	//得到全部的参评人员,分页
	public PageCut<Participator> getParticipator(int page, int pageSize, String ask, String inquiry);

	//添加参平人
	public boolean addParticipator(Participator participator);
	
	//修改参评人
	public boolean updateParticipator(Participator participator);
	
	//删除参评人
	public boolean deletParticipator(int pa_id);
	public List<Participator> getAll();


}
