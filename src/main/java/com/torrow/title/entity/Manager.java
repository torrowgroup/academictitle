package com.torrow.title.entity;
/**
 * 
 * @author 张金高
 *
 * @2017年8月14日下午1:00:24
 */

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
/*
 * 管理员类
 */
@Entity
@Table(name="t_manager")
public class Manager {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(length=11)
	private int ma_id;		//编号
	@Column(length=20)
	private String ma_userName; //用户名,邮箱
	@Column(length=11)
	private String ma_password; //密码
	@Column(length=11)
	private String ma_name; //姓名
	@Column(length=255)
	private String ma_spare; //备用
	
	public Manager() {
		super();
	}

	public Manager(int ma_id, String ma_userName, String ma_password, String ma_name, String ma_spare) {
		super();
		this.ma_id = ma_id;
		this.ma_userName = ma_userName;
		this.ma_password = ma_password;
		this.ma_name = ma_name;
		this.ma_spare = ma_spare;
	}


	public int getMa_id() {
		return ma_id;
	}


	public void setMa_id(int ma_id) {
		this.ma_id = ma_id;
	}


	public String getMa_userName() {
		return ma_userName;
	}


	public void setMa_userName(String ma_userName) {
		this.ma_userName = ma_userName;
	}


	public String getMa_password() {
		return ma_password;
	}


	public void setMa_password(String ma_password) {
		this.ma_password = ma_password;
	}


	public String getMa_name() {
		return ma_name;
	}


	public void setMa_name(String ma_name) {
		this.ma_name = ma_name;
	}


	public String getMa_spare() {
		return ma_spare;
	}


	public void setMa_spare(String ma_spare) {
		this.ma_spare = ma_spare;
	}


	@Override
	public String toString() {
		return "Manager [ma_id=" + ma_id + ", ma_userName=" + ma_userName + ", ma_password=" + ma_password
				+ ", ma_name=" + ma_name + ", ma_spare=" + ma_spare + "]";
	}
	
}
