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
 * @2017年8月14日下午3:07:13
 */
/*
 * 单位类
 */
@Entity
@Table(name="t_unit")
public class Unit {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(length=11)
	private int un_id;
	@Column(length=11)
	private String un_unitName; //单位名称
	@Column(length=255)
	private String un_spare; //备用
	
	public Unit() {
		super();
	}

	public Unit(int un_id, String un_unitName, String un_spare) {
		super();
		this.un_id = un_id;
		this.un_unitName = un_unitName;
		this.un_spare = un_spare;
	}

	public int getUn_id() {
		return un_id;
	}

	public void setUn_id(int un_id) {
		this.un_id = un_id;
	}

	public String getUn_unitName() {
		return un_unitName;
	}

	public void setUn_unitName(String un_unitName) {
		this.un_unitName = un_unitName;
	}

	public String getUn_spare() {
		return un_spare;
	}

	public void setUn_spare(String un_spare) {
		this.un_spare = un_spare;
	}

	@Override
	public String toString() {
		return "Unit [un_id=" + un_id + ", un_unitName=" + un_unitName + ", un_spare=" + un_spare + "]";
	}

}
