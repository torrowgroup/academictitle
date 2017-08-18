/**
 * 
 */
package com.torrow.title.action.expert;

import java.util.List;

import com.opensymphony.xwork2.ModelDriven;
import com.torrow.title.base.BaseAction;
import com.torrow.title.entity.Discuss;
import com.torrow.title.entity.Expert;
import com.torrow.title.entity.Participator;
import com.torrow.title.entity.Record;
import com.torrow.title.entity.Require;

/**
 * @author 张金高
 *
 * @2017年8月15日上午11:01:52
 */
public class ExpertDiscussAction
		extends BaseAction  implements ModelDriven<Record> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int pa_id; //得到参评人员id
	private Record record; //得到评议记录
	
	// 查看该专家未评的参评人
	public String noDiscuss() {
		List<Participator> allParticipator = participatorService.getAllParticipator();
		List<Record> allRecord = recordService.getAllRecord();
		Expert expert = (Expert) session.get("expert");
		for (int i = 0; i < allRecord.size(); i++) {
			if (allRecord.get(i).getRe_expert().equals(expert)) {// 如果评议记录里有这个专家的评议记录，就将这次评议记录里的参评人从全部参评人里删除
				allParticipator.remove(allRecord.get(i).getRe_participator());
			}
		}
		if (allParticipator.isEmpty()) {
			request.put("message", "你没有未评的参评人");
		}
		request.put("noDiscuss", allParticipator);
		return "getNoDiscuss";
	}

	// 查看该专家已评的
	public String alreadyDiscuss() {
		List<Record> allRecord = recordService.getAllRecord();
		Expert expert = (Expert) session.get("expert"); // 得到登录专家的对象
		for (int i = 0; i < allRecord.size(); i++) {
			if (!(allRecord.get(i).getRe_expert()).equals(expert)) {
				allRecord.remove(i);
				i--;
			}
		}
		if (allRecord.isEmpty()) {
			request.put("message", "你还未参与过评议");
		}
		request.put("alreadyDiscuss", allRecord);
		return "getAlreadyDiscuss";
	}
	//到达评议界面
	public String toDiscuss() {
		Participator participator = participatorService.getParticipatorById(pa_id);
		Require require = requireService.getByTitleId(participator.getPa_title().getTi_id());
		request.put("require", require);
		request.put("participator", participator);
		return "toDiscuss";
	}
	//专家对参评人评议
	public String discuss(){
		Discuss discuss = discussService.getByParticipatorId(pa_id);
		Participator participator = participatorService.getParticipatorById(pa_id);
		if(discuss==null){	//如果还没有专家对该参评人评议过，就先生成discuss
			discuss.setDi_participator(participator);
//			discussService.saveDiscuss(discuss);//先保存discuss，以便于record//////////////////
		}
		int score = record.getRe_educate()+record.getRe_scientific()+record.getRe_morality();
		double unfm = 0.6;
		if(record.getRe_unfm().equals("B")){
			unfm = 0.3;
		} else if(record.getRe_unfm().equals("C")) {
			unfm = 0.1;
		}
		record.setRe_score((int)(score*unfm));
		List<Record> allRecord = recordService.getByParticipatorId(pa_id);//得到该评议人的所有评议记录，计算总分，排名 familiarize
		allRecord.add(record);
		double familiarize=0,littleFamiliarize=0,noFamiliarize=0;//记录熟悉的，比较熟悉的，不太熟悉的人数
		double fScore = 0,lFScore = 0,nFScore = 0; //记录熟悉的，比较熟悉的，不太熟悉的总分
		for(int i=0;i<allRecord.size();i++){
			if(allRecord.get(i).getRe_unfm().equals("A")){
				familiarize++;
				fScore += allRecord.get(i).getRe_score();
			} else if(allRecord.get(i).getRe_unfm().equals("B")){
				littleFamiliarize++;
				lFScore += allRecord.get(i).getRe_score();
			} else {
				noFamiliarize++;
				nFScore += allRecord.get(i).getRe_score();
			}
		}
		double di_score = (fScore/familiarize)+(lFScore/littleFamiliarize)+(nFScore/noFamiliarize);
		discuss.setDi_score(di_score);
		return "";
	}
	
	public final int getPa_id() {
		return pa_id;
	}

	public final void setPa_id(int pa_id) {
		this.pa_id = pa_id;
	}

	@Override
	public Record getModel() {
		if(record==null){
			record = new Record();
		}
		return record;
	}

}