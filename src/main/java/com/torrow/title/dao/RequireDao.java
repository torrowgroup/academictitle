package com.torrow.title.dao;

import java.util.List;

import org.springframework.stereotype.Service;

import com.torrow.title.base.BaseDao;
import com.torrow.title.entity.Expert;
import com.torrow.title.entity.Require;
import com.torrow.title.entity.Title;
import com.torrow.title.entity.Unit;
import com.torrow.title.services.RequireService;
import com.torrow.title.util.PageCut;

/**
 * 
 * @author 马黎明
 *
 *         2017年8月15日上午11:04:55
 */
@Service
public class RequireDao extends BaseDao<Require> implements RequireService {

	@Override
	public PageCut<Require> checkAll(int currentPage, int pageSize) {
		String hql = "select count(*) from Require";
		int count = ((Long) this.uniqueResult(hql)).intValue();
		PageCut<Require> pc = new PageCut<Require>(currentPage, pageSize, count);
		pc.setData(this.getEntityLimitList("from Require", (currentPage - 1) * pageSize, pageSize));
		return pc;

	}
	@Override
	public Require getByTitleId(int ti_id) {
		String hql = "from Require r where r.re_title.ti_id = " + ti_id + "";
		return (Require) this.uniqueResult(hql);
	}

	@Override
	public boolean add(Require require ,Title title) {
		require.setRe_title(title);
		return this.saveEntity(require);
	}

	@Override
	public boolean update(Require require ,Title title) {
		require.setRe_title(title);
		return this.updateEntity(require);
	}

	@Override
	public Require checkById(int id) {
		String hql = "from Require   r  Where r.re_id= '" + id + "'";
		Require require = (Require) uniqueResult(hql);
		return require;
	}

	@Override
	public boolean deleteById(int id) {
		boolean sign = false;
		try {
			String hql = "delete from Require  r Where r.re_id= '" + id + "'";
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
	public List<Require> getAllRequire() {
		return selectAll();
	}
	@Override
	public boolean updateRequire(Require require) {
		return updateEntity(require);
	}
	@Override
	public Require checkByTitleName(String titleName) {
		String hql= "from Require r Where r.re_title.ti_titleName= '"+titleName+"'";
		Require require = (Require)uniqueResult(hql);
		return require;
	}
}
