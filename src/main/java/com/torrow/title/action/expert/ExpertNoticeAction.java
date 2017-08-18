/**
 * 
 */
package com.torrow.title.action.expert;

import com.opensymphony.xwork2.ModelDriven;
import com.torrow.title.base.BaseAction;
import com.torrow.title.entity.Notice;

/**
 * @author 张金高
 *
 * @2017年8月18日下午10:25:59
 */
public class ExpertNoticeAction extends BaseAction implements ModelDriven<Notice> {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2602901656187684334L;
	private Notice notice;
	
	
	
	@Override
	public Notice getModel() {
		if(notice==null){
			notice = new Notice();
		}
		return notice;
	}

	
}
