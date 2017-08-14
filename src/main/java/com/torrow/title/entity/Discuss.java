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
 * @2017年8月14日下午4:37:22
 */
/*
 * 评议类
 */
@Entity
@Table(name="t_discuss")
public class Discuss {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(length=11)
	private int di_id;
	@OneToOne
	@JoinColumn(name="pa_id")
	private Participator di_participator; //关联参评人
	@Column(length=5)
	private double di_score; //总评分,保留两位小数
	@Column(length=11)
	private int di_rank; //排名
	@Column(length=255)
	private String di_spare; //备用
	
	public Discuss(int di_id, Participator di_participator, double di_score, int di_rank, String di_spare) {
		super();
		this.di_id = di_id;
		this.di_participator = di_participator;
		this.di_score = di_score;
		this.di_rank = di_rank;
		this.di_spare = di_spare;
	}
	public Discuss() {
		super();
	}
	public int getDi_id() {
		return di_id;
	}
	public void setDi_id(int di_id) {
		this.di_id = di_id;
	}
	public Participator getDi_participator() {
		return di_participator;
	}
	public void setDi_participator(Participator di_participator) {
		this.di_participator = di_participator;
	}
	public double getDi_score() {
		return di_score;
	}
	public void setDi_score(double di_score) {
		this.di_score = di_score;
	}
	public int getDi_rank() {
		return di_rank;
	}
	public void setDi_rank(int di_rank) {
		this.di_rank = di_rank;
	}
	public String getDi_spare() {
		return di_spare;
	}
	public void setDi_spare(String di_spare) {
		this.di_spare = di_spare;
	}
	@Override
	public String toString() {
		return "Discuss [di_id=" + di_id + ", di_participator=" + di_participator + ", di_score=" + di_score + ", di_rank="
				+ di_rank + ", di_spare=" + di_spare + "]";
	}
	
	
}