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
 * @2017年8月14日下午4:51:23
 */
/*
 *评议记录类 
 */
@Entity
@Table(name="t_record")
public class Record {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(length=11)
	private int re_id;
	@OneToOne
	@JoinColumn(name="pa_id")
	private Participator re_participator; //关联参评人
	@OneToOne
	@JoinColumn(name="ex_id")
	private Expert re_expert; //关联专家
	@Column(length=5)
	private int re_educate; //教育方面的分数
	@Column(length=5)
	private int re_scientific; //科研方面的分数
	@Column(length=5)
	private int re_morality; //师德方面的分数
	@Column(length=255)
	private String re_spare; //备用
	
	public Record() {
		super();
	}

	public Record(int re_id, Participator re_participator, Expert re_expert, int re_educate, int re_scientific,
			int re_morality, String re_spare) {
		super();
		this.re_id = re_id;
		this.re_participator = re_participator;
		this.re_expert = re_expert;
		this.re_educate = re_educate;
		this.re_scientific = re_scientific;
		this.re_morality = re_morality;
		this.re_spare = re_spare;
	}

	public final int getRe_id() {
		return re_id;
	}

	public final void setRe_id(int re_id) {
		this.re_id = re_id;
	}

	public final Participator getRe_participator() {
		return re_participator;
	}

	public final void setRe_participator(Participator re_participator) {
		this.re_participator = re_participator;
	}

	public final Expert getRe_expert() {
		return re_expert;
	}

	public final void setRe_expert(Expert re_expert) {
		this.re_expert = re_expert;
	}

	public final int getRe_educate() {
		return re_educate;
	}

	public final void setRe_educate(int re_educate) {
		this.re_educate = re_educate;
	}

	public final int getRe_scientific() {
		return re_scientific;
	}

	public final void setRe_scientific(int re_scientific) {
		this.re_scientific = re_scientific;
	}

	public final int getRe_morality() {
		return re_morality;
	}

	public final void setRe_morality(int re_morality) {
		this.re_morality = re_morality;
	}

	public final String getRe_spare() {
		return re_spare;
	}

	public final void setRe_spare(String re_spare) {
		this.re_spare = re_spare;
	}

	@Override
	public String toString() {
		return "Record [re_id=" + re_id + ", re_participator=" + re_participator + ", re_expert=" + re_expert
				+ ", re_educate=" + re_educate + ", re_scientific=" + re_scientific + ", re_morality=" + re_morality
				+ ", re_spare=" + re_spare + "]";
	}

}
