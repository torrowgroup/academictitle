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
 * @2017年8月14日下午4:13:22
 */
/*
 * 评议要求类,关联职称
 */
@Entity
@Table(name="t_require")
public class Require {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(length=11)
	private int re_id;
	@OneToOne
	@JoinColumn(name="ti_id")
	private Title re_title; //关联职称
	@Column(length=255)
	private String re_educate; //教学方面
	@Column(length=255)
	private String re_scientific; //科研方面
	@Column(length=255)
	private String re_morality; //师德
	@Column(length=255)
	private String re_spare; //备用
	
	public Require(int re_id, Title re_title, String re_educate, String re_scientific, String re_morality,
			String re_spare) {
		super();
		this.re_id = re_id;
		this.re_title = re_title;
		this.re_educate = re_educate;
		this.re_scientific = re_scientific;
		this.re_morality = re_morality;
		this.re_spare = re_spare;
	}
	public Require() {
		super();
	}
	public int getRe_id() {
		return re_id;
	}
	public void setRe_id(int re_id) {
		this.re_id = re_id;
	}
	public Title getRe_title() {
		return re_title;
	}
	public void setRe_title(Title re_title) {
		this.re_title = re_title;
	}
	public String getRe_educate() {
		return re_educate;
	}
	public void setRe_educate(String re_educate) {
		this.re_educate = re_educate;
	}
	public String getRe_scientific() {
		return re_scientific;
	}
	public void setRe_scientific(String re_scientific) {
		this.re_scientific = re_scientific;
	}
	public String getRe_morality() {
		return re_morality;
	}
	public void setRe_morality(String re_morality) {
		this.re_morality = re_morality;
	}
	public String getRe_spare() {
		return re_spare;
	}
	public void setRe_spare(String re_spare) {
		this.re_spare = re_spare;
	}
	@Override
	public String toString() {
		return "Require [re_id=" + re_id + ", re_title=" + re_title + ", re_educate=" + re_educate + ", re_scientific="
				+ re_scientific + ", re_morality=" + re_morality + ", re_spare=" + re_spare + "]";
	}
	
}
