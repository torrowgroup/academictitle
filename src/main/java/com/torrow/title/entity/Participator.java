/**
 * 
 */
package com.torrow.title.entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Type;

/**
 * @author 张金高
 *
 * @2017年8月14日下午4:18:48
 */
/*
 * 参评人类,关联专业，单位，职称
 */
@Entity
@Table(name="t_participator")
public class Participator {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(length=11)
	private int pa_id;
	@Column(length=11)
	private String pa_name; //参评人姓名
	@Column(length=30)
	private String pa_email; //邮箱,必填项
	@OneToOne
	@JoinColumn(name="maj_id")
	private Majors pa_majors; //关联专业
	@OneToOne
	@JoinColumn(name="un_id")
	private Unit pa_unit; //关联单位
	@OneToOne
	@JoinColumn(name="ti_id")
	private Title pa_title; //关联职称
	@Column(length=255)
	private String pa_imageUrl; //图片地址
	@Basic(fetch = FetchType.LAZY)   
	@Type(type="text")  
	@Column(name="pa_introduce", nullable=true) 
	private String pa_introduce; //简介
	@Column(length=255)
	private String pa_spare; //备用
	
	public Participator(int pa_id, String pa_name,String pa_email,  Majors pa_majors, Unit pa_unit, Title pa_title, String pa_imageUrl,
			String pa_introduce,String pa_spare) {
		super();
		this.pa_id = pa_id;
		this.pa_name = pa_name;
		this.pa_email = pa_email;
		this.pa_majors = pa_majors;
		this.pa_unit = pa_unit;
		this.pa_title = pa_title;
		this.pa_imageUrl = pa_imageUrl;
		this.pa_introduce = pa_introduce;
		this.pa_spare = pa_spare;
	}
	public Participator() {
		super();
	}
	public final int getPa_id() {
		return pa_id;
	}
	public final void setPa_id(int pa_id) {
		this.pa_id = pa_id;
	}
	public final String getPa_name() {
		return pa_name;
	}
	public final void setPa_name(String pa_name) {
		this.pa_name = pa_name;
	}
	public final Majors getPa_majors() {
		return pa_majors;
	}
	public final void setPa_majors(Majors pa_majors) {
		this.pa_majors = pa_majors;
	}
	public final Unit getPa_unit() {
		return pa_unit;
	}
	public final void setPa_unit(Unit pa_unit) {
		this.pa_unit = pa_unit;
	}
	public final Title getPa_title() {
		return pa_title;
	}
	public final void setPa_title(Title pa_title) {
		this.pa_title = pa_title;
	}
	public final String getPa_imageUrl() {
		return pa_imageUrl;
	}
	public final void setPa_imageUrl(String pa_imageUrl) {
		this.pa_imageUrl = pa_imageUrl;
	}
	public final String getPa_introduce() {
		return pa_introduce;
	}
	public final void setPa_introduce(String pa_introduce) {
		this.pa_introduce = pa_introduce;
	}
	public final String getPa_spare() {
		return pa_spare;
	}
	public final void setPa_spare(String pa_spare) {
		this.pa_spare = pa_spare;
	}
	
	public final String getPa_email() {
		return pa_email;
	}
	public final void setPa_email(String pa_email) {
		this.pa_email = pa_email;
	}
	@Override
	public String toString() {
		return "Participator [pa_id=" + pa_id + ", pa_name=" + pa_name + ",pa_email="+pa_email+", pa_majors=" + pa_majors + ", pa_unit="
				+ pa_unit + ", pa_title=" + pa_title + ", pa_imageUrl=" + pa_imageUrl + ", pa_introduce=" + pa_introduce
				+ ", pa_spare=" + pa_spare + "]";
	}
	
}
