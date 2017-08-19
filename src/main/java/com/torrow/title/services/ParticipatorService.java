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
	
	//根据id得到参评人
	public Participator getParticipatorById(int pa_id);
	
	//得到全部的参评人员,分页
	public PageCut<Participator> getParticipator(int page, int pageSize, String ask, String inquiry);

}
