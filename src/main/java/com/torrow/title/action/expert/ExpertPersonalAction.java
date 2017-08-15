/**
 * 
 */
package com.torrow.title.action.expert;

import com.opensymphony.xwork2.ModelDriven;
import com.torrow.title.base.BaseAction;
import com.torrow.title.entity.Expert;

/**
 * @author 张金高
 *
 * @2017年8月15日上午11:08:58
 */
public class ExpertPersonalAction extends BaseAction implements ModelDriven<Expert> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	//得到个人信息
	public String getPersonal(){
		
		return "";
	}
	
	@Override
	public Expert getModel() {
		// TODO Auto-generated method stub
		return null;
	}

}
