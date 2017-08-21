package com.torrow.title.services;

import java.util.List;

import com.torrow.title.entity.Discuss;
import com.torrow.title.entity.Participator;
import com.torrow.title.util.PageCut;

/**
 * 
 * @author 马黎明
 *
 * 2017年8月15日上午10:03:29
 */
public interface DiscussService {

	//张金高
	//得到评议类排名并分页
	public PageCut<Discuss> discussPageCut(int curr, int pageSize, String ask, String inquiry) ;
	//由参评人id得到评议类
	public Discuss getByParticipatorId(int pa_id);
	//得到所有的评议类
	public List<Discuss> getAllDiscuss();
	//保存评议类
	public void saveDiscuss(Discuss discuss);
	//修改评议类
	public void updateDiscuss(Discuss discussDown);
	//对所有评议以所申请职称和A类专家平均分高低进行排序
	public List<Discuss> rankDiscuss(String titleName);

}
