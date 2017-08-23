package com.torrow.title.dao;

import java.util.List;

import org.springframework.stereotype.Service;

import com.torrow.title.base.BaseDao;
import com.torrow.title.entity.Expert;
import com.torrow.title.entity.Majors;
import com.torrow.title.entity.Title;
import com.torrow.title.services.TitleService;
import com.torrow.title.util.PageCut;
/**
 * 
 * @author 马黎明
 *
 * 2017年8月15日上午11:06:16
 */
@Service
public class TitleDao extends BaseDao<Title> implements TitleService{
	
	@Override
	public PageCut<Title> checkAll(int currentPage, int pageSize) {
		String hql = "select count(*) from Title";
		int count = ((Long) this.uniqueResult(hql)).intValue();
		PageCut<Title> pc = new PageCut<Title>(currentPage, pageSize, count);
		pc.setData(this.getEntityLimitList("from Title", (currentPage - 1) * pageSize, pageSize));
		return pc;
	}
		@Override
		public boolean add(Title title) {
				return this.saveEntity(title);
	}
		@Override
		public boolean update(Title title) {
			return this.updateEntity(title);
		}
		@Override
		public Title checkById( int id) {
			String hql = "from Title  t Where t.ti_id= '"+id+"'";
			Title title= (Title) uniqueResult(hql);
			return title;
		}
		@Override
		public boolean  deleteById(int id) {
			boolean sign = false;
			
			try {
				String hql = "delete from Title t Where t.ti_id= '" + id + "'";
			int mark = this.executeUpdate(hql);
			if (mark == 1) {
				sign = true;
			} else {
				sign = false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return sign;
	}
	@Override
	public List<Title> selectTitle() {
		return selectAll();
	}
	@Override
	public boolean updateTitle(Title title) {
		return updateEntity(title);
	}
	@Override
	public boolean deleteTitle(Title title) {
		return this.deleteEntity(title);
	}
	@Override
	public List<Title> getAll(){
		return selectAll();
	}
	@Override
	public Title getTitle(String titleName) {
		String hql = "from Title t Where t.ti_titleName= '"+titleName+"'";
		Title title= (Title) uniqueResult(hql);
		return title;
	}

}
