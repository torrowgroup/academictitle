/**
 * 
 */
package com.torrow.title.action.expert;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ModelDriven;
import com.torrow.title.base.BaseAction;
import com.torrow.title.entity.Discuss;
import com.torrow.title.entity.Expert;
import com.torrow.title.entity.Participator;
import com.torrow.title.entity.Record;
import com.torrow.title.entity.Require;
import com.torrow.title.util.PageCut;

/**
 * @author 张金高
 *
 * @2017年8月15日上午11:01:52
 */
public class ExpertDiscussAction extends BaseAction implements ModelDriven<Record> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int pa_id; // 得到参评人员id
	private Record record; // 得到评议记录
	private int page = 1;//记录页码
	private String inquiry;//得到查询的内容
	
	// 查看该专家未评的参评人
	public String noDiscuss() {
		if(inquiry==null){
			inquiry = (String)session.get("inquiry");
		}
		PageCut<Participator> noDiscussP = noDiscussList(page,4,inquiry);//模糊查询List集合，匹配参评人姓名，专业名，单位名，职称名
		if (noDiscussP.getData().isEmpty()) {
			request.put("message", "查询不到未评的参评人");
		}
		session.put("inquiry", inquiry);
		request.put("noDiscuss", noDiscussP);
		return "getNoDiscuss";
	}
	
	// 查看该专家已评的
	public String alreadyDiscuss() {
		if(inquiry == null){
			inquiry = (String)session.get("inquiry");
		}
		Expert expert = (Expert) session.get("expert"); // 得到登录专家的对象
		PageCut<Record> alreadyDiscuss = recordService.getPageCut(page,4,inquiry,expert);
		if (alreadyDiscuss.getData().isEmpty()) {
			request.put("message", "没有评议纪录");
		}
		session.put("inquiry", inquiry);
		request.put("alreadyDiscuss", alreadyDiscuss);
		return "getAlreadyDiscuss";
	}

	// 到达评议界面
	public String toDiscuss() {
		Participator participator = participatorService.getParticipatorById(pa_id);
		Require require = requireService.getByTitleId(participator.getPa_title().getTi_id());
		request.put("require", require);
		request.put("participator", participator);
		return "toDiscuss";
	}

	// 专家对参评人评议
	public String discuss() {
		if((record.getRe_unfm()==null)){
			request.put("message", "没有填写熟悉程度");
			return toDiscuss();//返回评议界面
		}
		Discuss discuss = discussService.getByParticipatorId(pa_id);
		Participator participator = participatorService.getParticipatorById(pa_id);// 获得参评人
		record.setRe_expert((Expert) (session.get("expert")));
		record.setRe_participator(participator);
		if (discuss == null) { // 如果还没有专家对该参评人评议过，就先生成discuss
			discuss = new Discuss();
			discuss.setDi_participator(participator);
			discussService.saveDiscuss(discuss);
		}
		re_score(); // 调用计算专家给这位参评人分数方法
		List<Record> allRecord = recordService.getByParticipatorId(pa_id);// 得到该评议人的所有评议记录，计算总分，排名
		allRecord.add(record);
		discuss = di_average(allRecord, discuss);
		discussService.updateDiscuss(discuss);
		di_rank(discuss); // 调用方法对所有参评人进行排名，并保存评议
		Discuss discussDb = discussService.getByParticipatorId(pa_id);
		record.setRe_discuss(discussDb);
		recordService.save(record);
		request.put("message", "评议成功");
		noDiscuss(); // 调用未评方法，到未评界面
		return "getNoDiscuss"; 
	}

	// 计算专家给的评分，该专家首次对参评人评议或修改评议记录
	public void re_score() {
		int score = record.getRe_educate() + record.getRe_scientific() + record.getRe_morality();
		double unfm = 0.6;
		if (record.getRe_unfm().equals("B")) {
			unfm = 0.3;
		} else if (record.getRe_unfm().equals("C")) {
			unfm = 0.1;
		}
		record.setRe_score((int) (score * unfm));
	}

	// 计算该参评人熟悉型专家评分平均分，该专家首次对参评人评议或修改评议记录
	public Discuss di_average(List<Record> allRecord, Discuss discussTemp) {
		double familiarize = 1, littleFamiliarize = 1, noFamiliarize = 1;// 记录熟悉的人数
		double fScore = 0, lFScore = 0, nFScore = 0; // 记录熟悉的总分
		double di_averageA = 0, di_averageB = 0, di_averageC = 0;// 平均分
		for (int i = 0; i < allRecord.size(); i++) {
			if (allRecord.get(i).getRe_unfm().equals("A")) {
				familiarize++;
				fScore += allRecord.get(i).getRe_score();
				di_averageA = fScore / (familiarize - 1);
			} else if (allRecord.get(i).getRe_unfm().equals("B")) {
				littleFamiliarize++;
				lFScore += allRecord.get(i).getRe_score();
				di_averageB = lFScore / (littleFamiliarize - 1);
			} else if (allRecord.get(i).getRe_unfm().equals("C")) {
				noFamiliarize++;
				nFScore += allRecord.get(i).getRe_score();
				di_averageC = nFScore / (noFamiliarize - 1);
			}
		}
		//保留两位小数
		discussTemp.setDi_averageA(new BigDecimal(di_averageA).setScale(2, RoundingMode.UP).doubleValue());
		discussTemp.setDi_averageB(new BigDecimal(di_averageB).setScale(2, RoundingMode.UP).doubleValue());
		discussTemp.setDi_averageC(new BigDecimal(di_averageC).setScale(2, RoundingMode.UP).doubleValue());
		return discussTemp;
	}

	// 对参评人进行排名，按照a型专家平均分
	public void di_rank(Discuss discuss) {
		String titleName = discuss.getDi_participator().getPa_title().getTi_titleName();// 得到评议人申请职称
		List<Discuss> allDiscuss = discussService.rankDiscuss(titleName);// 以评议人所申请职称和A类专家平均分数排序
		for (int i = 0; i < allDiscuss.size(); i++) {
			allDiscuss.get(i).setDi_rank(i + 1);
			discussService.updateDiscuss(allDiscuss.get(i));
		}
	}

	// 到达修改评议记录界面
	public String toUpdateRecord() {
		record = recordService.getByRecordId(record.getRe_id());
		int titleId = record.getRe_participator().getPa_title().getTi_id();
		Require require = requireService.getByTitleId(titleId);
		request.put("require", require);// 将评议要求封装进request
		request.put("record", record);
		return "toUpdateRecord";
	}

	// 修改评议记录
	public String updateRecord() {
		Record recordDb = recordService.getByRecordId(record.getRe_id());// 得到评议记录，将评议类，参评人，专家set进前台传来的评议记录里
		record.setRe_discuss(recordDb.getRe_discuss());
		record.setRe_participator(recordDb.getRe_participator());
		record.setRe_expert(recordDb.getRe_expert());
		re_score();// 计算专家修改后的评分
		recordService.updateRecord(record);
		Discuss discuss = recordDb.getRe_discuss();
		List<Record> allRecord = recordService.getByParticipatorId(record.getRe_participator().getPa_id());// 得到该评议人的所有评议记录，计算总分，排名
		discuss = di_average(allRecord, discuss);
		discussService.updateDiscuss(discuss);
		di_rank(discuss);
		alreadyDiscuss();// 调用已评方法，到达已评界面
		request.put("message", "修改成功");
		return "getAlreadyDiscuss";
	}

	// 得到未评的List
	public PageCut<Participator> noDiscussList(int curr, int pageSize, String inquiry) {
		List<Participator> allParticipator = participatorService.getAllParticipator();
		List<Record> allRecord = recordService.getAllRecord();
		Expert expert = (Expert) session.get("expert");
		for (int i = 0; i < allRecord.size(); i++) {
			if (allRecord.get(i).getRe_expert().getEx_id() == expert.getEx_id()) {// 如果评议记录里有这个专家的评议记录，就将这次评议记录里的参评人从全部参评人里删除
				for (int j = 0; j < allParticipator.size(); j++) {
					if (allParticipator.get(j).getPa_id() == allRecord.get(i).getRe_participator().getPa_id()) {
						allParticipator.remove(j);
						j--;
					}
				}
			}
		}
		if(!inquiry.equals("all")){//模糊查询List集合，匹配参评人姓名，专业名，单位名，职称名
			for(int i=0;i<allParticipator.size();i++ ){
				if((!allParticipator.get(i).getPa_name().contains(inquiry))&&
						(!allParticipator.get(i).getPa_majors().getMaj_majorName().contains(inquiry))&&
						(!allParticipator.get(i).getPa_unit().getUn_unitName().contains(inquiry))&&
						(!allParticipator.get(i).getPa_title().getTi_titleName().contains(inquiry))){
					allParticipator.remove(i);
					i--;
				}
			}
		}
		int count = allParticipator.size();// 分页总数量等于未评人数
		PageCut<Participator> pCut = new PageCut<Participator>(curr, pageSize, count);
		List<Participator> pData = new ArrayList<Participator>();
		for (int i = (curr - 1) * pageSize; i < allParticipator.size(); i++) {// 得到当前页的未评人集合，如果未评人不足一页，则跳出
			pData.add(allParticipator.get(i));
			if (i == (curr * pageSize - 1)) {
				break;
			}
		}
		pCut.setData(pData);
		return pCut;
	}
	
	
	public final int getPa_id() {
		return pa_id;
	}

	public final void setPa_id(int pa_id) {
		this.pa_id = pa_id;
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

	@Override
	public Record getModel() {
		if (record == null) {
			record = new Record();
		}
		return record;
	}

}