/**
 * 
 */
package com.torrow.title.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 * @author 张金高
 *
 * @2017年8月14日下午2:25:56
 */
/*
 *专家类
 *关联专业表，单位表，职称表，
 */
@Entity
@Table(name="t_expert")
public class Expert {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(length=11)
	private int ex_id;
	@Column(length=20)
	private String ex_userName; //用户名,邮箱
	@Column(length=11)
	private String ex_password; //密码
	@Column(length=11)
	private String ex_name; //姓名
	@OneToOne
	@JoinColumn(name="maj_id")
	private Majors ex_majors; //关联专业
	@OneToOne
	@JoinColumn(name="un_id")
	private Unit ex_unit; //关联单位
	@OneToOne
	@JoinColumn(name="ti_id")
	private Title ex_title; //关联职称
	@Column(length=20)
	private String ex_education; //学历,本科，硕士，博士，博士后
	@Column(length=255)
	private String ex_spare; //备用
	
	public Expert() {
		super();
	}

	public Expert(int ex_id, String ex_userName, String ex_password, String ex_name, Majors ex_majors, Unit ex_unit,
			Title ex_title, String ex_education, String ex_spare) {
		super();
		this.ex_id = ex_id;
		this.ex_userName = ex_userName;
		this.ex_password = ex_password;
		this.ex_name = ex_name;
		this.ex_majors = ex_majors;
		this.ex_unit = ex_unit;
		this.ex_title = ex_title;
		this.ex_education = ex_education;
		this.ex_spare = ex_spare;
	}

	public final int getEx_id() {
		return ex_id;
	}

	public final void setEx_id(int ex_id) {
		this.ex_id = ex_id;
	}

	public final String getEx_userName() {
		return ex_userName;
	}

	public final void setEx_userName(String ex_userName) {
		this.ex_userName = ex_userName;
	}

	public final String getEx_password() {
		return ex_password;
	}

	public final void setEx_password(String ex_password) {
		this.ex_password = ex_password;
	}

	public final String getEx_name() {
		return ex_name;
	}

	public final void setEx_name(String ex_name) {
		this.ex_name = ex_name;
	}

	public final Majors getEx_majors() {
		return ex_majors;
	}

	public final void setEx_major(Majors ex_majors) {
		this.ex_majors = ex_majors;
	}

	public final Unit getEx_unit() {
		return ex_unit;
	}

	public final void setEx_unit(Unit ex_unit) {
		this.ex_unit = ex_unit;
	}

	public final Title getEx_title() {
		return ex_title;
	}

	public final void setEx_title(Title ex_title) {
		this.ex_title = ex_title;
	}

	public final String getEx_education() {
		return ex_education;
	}

	public final void setEx_education(String ex_education) {
		this.ex_education = ex_education;
	}

	public final String getEx_spare() {
		return ex_spare;
	}

	public final void setEx_spare(String ex_spare) {
		this.ex_spare = ex_spare;
	}

	@Override
	public String toString() {
		return "Expert [ex_id=" + ex_id + ", ex_userName=" + ex_userName + ", ex_password=" + ex_password + ", ex_name="
				+ ex_name + ", ex_majors=" + ex_majors + ", ex_unit=" + ex_unit + ", ex_title=" + ex_title
				+ ", ex_education=" + ex_education + ", ex_spare=" + ex_spare + "]";
	}
	
}
