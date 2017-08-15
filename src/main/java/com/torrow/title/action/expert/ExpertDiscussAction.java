/**
 * 
 */
package com.torrow.title.action.expert;

import java.util.List;

import com.torrow.title.base.BaseAction;
import com.torrow.title.entity.Expert;
import com.torrow.title.entity.Participator;
import com.torrow.title.entity.Record;

/**
 * @author 张金高
 *
 * @2017年8月15日上午11:01:52
 */
public class ExpertDiscussAction extends BaseAction /*implements ModelDriven<T> */{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	//查看该专家未评的参评人
	public String getNoDiscuss(){
		List<Participator> allParticipator = participatorService.getAllParticipator();
		List<Record> allRecord = recordService.getAllRecord();
		Expert expert = (Expert) session.get("expert");
		return "";
	}
	//查看该专家已评的
	public String getAlreadyDiscuss(){
		List<Record> allRecord = recordService.getAllRecord();
		Expert expert = (Expert) session.get("expert");		//得到登录专家的对象
		for(int i=0;i<allRecord.size();i++){
			if(!(allRecord.get(i).getRe_expert()).equals(expert)){
				allRecord.remove(i);
				i--;
			}
		}
		if(allRecord.isEmpty()){
			request.put("message", "你还未参与过评议");
		} else {
			request.put("allRecord", allRecord);
		}
		return "getAlreadyDiscuss";
	}
}
