/**
 * 
 */
package com.torrow.title.action.setting;

import java.io.UnsupportedEncodingException;
import java.util.List;

import com.torrow.title.base.BaseAction;
import com.torrow.title.entity.Discuss;
import com.torrow.title.entity.Expert;
import com.torrow.title.entity.Majors;
import com.torrow.title.entity.Participator;
import com.torrow.title.entity.Record;
import com.torrow.title.entity.Title;
import com.torrow.title.entity.Unit;
import com.torrow.title.util.PageCut;

/**
 * @author 张金高
 *
 * @2017年8月20日下午2:50:16
 */
public class StatisticsAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	private int page = 1;
	private String ask; //得到查询条件
	private String inquiry;//得到查询内容,查看评议详情时是评议类id，
	private int id; //对某个专家评议统计时的专家id,参评人统计方法中的参评人id
	
	//选择排名方式
	public String chooseRank(){
		List<Title> allTitle = titleService.selectTitle();
		List<Majors> allMajors = majorsService.selectMajors();
		List<Unit> allUnit = unitService.selectUnit();
		request.put("allTitle", allTitle);
		request.put("allMajors", allMajors);
		request.put("allUnit",allUnit);
		return "chooseRank";
	}
	
	//查看排名，以及按专业，职称，单位查询，
	public String rank() throws UnsupportedEncodingException{
		if(ask==null){
			ask =(String)session.get("ask");
			inquiry = (String)session.get("inquiry");
		} else {	//不对从session中获取的inquiry转码，否则会出现？？？
			inquiry = new String(inquiry.getBytes("ISO8859-1"), "UTF-8");
		}
		PageCut<Discuss> rank = discussService.discussPageCut(page,4,ask,inquiry);
		if(rank.getData().size()==0){
			request.put("message", "没有排名信息");
		}
		request.put("discussRank", rank);
		session.put("ask", ask);
		session.put("inquiry", inquiry);
		chooseRank();//将专业，职称，单位等存进request
		return "rank";
	}

	//得到评议详情
	public String discussDetails(){
		int pa_id = 0;
		if(inquiry==null){
			pa_id=(int)session.get("pa_id");
		} else {
			pa_id = Integer.parseInt(inquiry);//此时inquiry查询参数是评议类id
		}
		PageCut<Record> recordPCut = recordService.getByDiscussId(page,4,pa_id);
		request.put("recordList", recordPCut);
		session.put("pa_id", pa_id);
		return "discussDetails";
	}
	//专家评议，得到所有专家，查询专家
	public String expertStatistics(){
		if(inquiry==null){
			inquiry = (String)session.get("inquiry");
		}
		PageCut<Expert> pCut = expertService.allExpert(page, 4,inquiry);
		if (pCut.getData().size() == 0) {
			request.put("message", "没有专家");
		}
		request.put("allExpert", pCut);
		session.put("inquiry", inquiry);
		return "expertStatistics";
	}
	//某个专家评议统计
	public String statistics(){
		if(inquiry == null){
			inquiry = (String)session.get("inquiry");
		}
		Expert expert = new Expert();
		if(id==0){
			id=(int)session.get("id");
		}
		expert.setEx_id(id);
		PageCut<Record> expertDiscuss = recordService.getPageCut(page,4,inquiry,expert);
		if (expertDiscuss.getData().isEmpty()) {
			request.put("message", "没有评议纪录");
		}
		session.put("inquiry", inquiry);
		session.put("id", id);
		request.put("expertDiscuss", expertDiscuss);
		return "statistics";
	}

	//清空评议记录，评议，及参评人
	public String empty(){
		boolean emptyRecord = recordService.emptyRecord();
		boolean emptyDiscuss = discussService.emptyDiscuss();
		boolean emptyParticipator = participatorService.emptyParticipator();
		if(emptyDiscuss&&emptyRecord&&emptyParticipator){
			request.put("message", "清空评议记录和参评人成功");
		} else {
			request.put("message", "清空评议记录和参评人成功");
		}
		chooseRank();
		return "rank";
	}
	
	public final String getAsk() {
		return ask;
	}

	public final void setAsk(String ask) {
		this.ask = ask;
	}

	public final int getPage() {
		return page;
	}

	public final void setPage(int page) {
		this.page = page;
	}

	public final String getInquiry() {
		return inquiry;
	}

	public final void setInquiry(String inquiry) {
		this.inquiry = inquiry;
	}

	public final int getId() {
		return id;
	}

	public final void setId(int id) {
		this.id = id;
	}
	
}
