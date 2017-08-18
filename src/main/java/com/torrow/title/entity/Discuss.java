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
 * 评议类,关联参评人
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
	private double di_averageA; //熟悉型专家平均评分,保留两位小数
	@Column(length=5)
	private double di_averageB; //比较熟悉型专家平均评分,保留两位小数
	@Column(length=5)
	private double di_averageC; //不太型专家平均评分,保留两位小数
	@Column(length=11)
	private int di_rank; //模糊排名，按照比较熟悉类专家分数对其排名
	@Column(length=255)
	private String di_spare; //备用
	public Discuss(int di_id, Participator di_participator, double di_averageA, double di_averageB, double di_averageC,
			int di_rank, String di_spare) {
		super();
		this.di_id = di_id;
		this.di_participator = di_participator;
		this.di_averageA = di_averageA;
		this.di_averageB = di_averageB;
		this.di_averageC = di_averageC;
		this.di_rank = di_rank;
		this.di_spare = di_spare;
	}
	public Discuss() {
		super();
	}
	public final int getDi_id() {
		return di_id;
	}
	public final void setDi_id(int di_id) {
		this.di_id = di_id;
	}
	public final Participator getDi_participator() {
		return di_participator;
	}
	public final void setDi_participator(Participator di_participator) {
		this.di_participator = di_participator;
	}
	public final double getDi_averageA() {
		return di_averageA;
	}
	public final void setDi_averageA(double di_averageA) {
		this.di_averageA = di_averageA;
	}
	public final double getDi_averageB() {
		return di_averageB;
	}
	public final void setDi_averageB(double di_averageB) {
		this.di_averageB = di_averageB;
	}
	public final double getDi_averageC() {
		return di_averageC;
	}
	public final void setDi_averageC(double di_averageC) {
		this.di_averageC = di_averageC;
	}
	public final int getDi_rank() {
		return di_rank;
	}
	public final void setDi_rank(int di_rank) {
		this.di_rank = di_rank;
	}
	public final String getDi_spare() {
		return di_spare;
	}
	public final void setDi_spare(String di_spare) {
		this.di_spare = di_spare;
	}
	@Override
	public String toString() {
		return "Discuss [di_id=" + di_id + ", di_participator=" + di_participator + ", di_averageA=" + di_averageA
				+ ", di_averageB=" + di_averageB + ", di_averageC=" + di_averageC + ", di_rank=" + di_rank
				+ ", di_spare=" + di_spare + "]";
	}
	
}