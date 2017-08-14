/**
 * 
 */
package com.torrow.title.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author 张金高
 *
 * @2017年8月14日下午3:13:27
 */
/*
 * 职称类
 */
@Entity
@Table(name="t_title")
public class Title {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(length=11)
	private int ti_id;
	@Column(length=20)
	private String ti_titleName;	//职称名称
	@Column(length=255)
	private String ti_spare; //备用
	
	public Title() {
		super();
	}

	public Title(int ti_id, String ti_titleName, String ti_spare) {
		super();
		this.ti_id = ti_id;
		this.ti_titleName = ti_titleName;
		this.ti_spare = ti_spare;
	}

	public int getTi_id() {
		return ti_id;
	}

	public void setTi_id(int ti_id) {
		this.ti_id = ti_id;
	}

	public String getTi_titleName() {
		return ti_titleName;
	}

	public void setTi_titleName(String ti_titleName) {
		this.ti_titleName = ti_titleName;
	}

	public String getTi_spare() {
		return ti_spare;
	}

	public void setTi_spare(String ti_spare) {
		this.ti_spare = ti_spare;
	}

	@Override
	public String toString() {
		return "Title [ti_id=" + ti_id + ", ti_titleName=" + ti_titleName + ", ti_spare=" + ti_spare + "]";
	}
	
}
