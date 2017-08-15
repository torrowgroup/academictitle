/**
 * 
 */
package com.torrow.title.action.expert;

import java.util.List;

import com.torrow.title.base.BaseAction;
import com.torrow.title.entity.Participator;

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

	//查看未评参评人
	public String getNoDiscuss(){
		List<Participator> list = participatorService.getAllParticipator();
		return "";
	}
}
