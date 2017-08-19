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
 *评议记录表,
 *关联评仪表，参评人，专家
 */
@Entity
@Table(name="t_record")
public class Record {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(length=11)
	private int re_id;
	@OneToOne
	@JoinColumn(name="di_id")
	private Discuss re_discuss; //关联评议表
	@OneToOne
	@JoinColumn(name="pa_id")
	private Participator re_participator; //关联参评人
	@OneToOne
	@JoinColumn(name="ex_id")
	private Expert re_expert; //关联专家
	@Column(length=5)
	private String re_unfm; //专家对参评人从事专业熟悉程度
	@Column(length=5)
	private int re_educate; //教育方面的分数
	@Column(length=5)
	private int re_scientific; //科研方面的分数
	@Column(length=5)
	private int re_morality; //师德方面的分数
	@Column(length=5)
	private int re_score;	//该专家总评分,A类评委分数×60%，B类评委分数×30%，C类评委分数×10%
	@Column(length=255)
	private String re_spare; //备用
	
	public Record() {
		super();
	}

	//这个构造方法用于修改评议记录
	public Record(String re_unfm,int re_educate, int re_scientific, int re_morality) {
		this.re_unfm = re_unfm;
		this.re_educate = re_educate;
		this.re_scientific = re_scientific;
		this.re_morality = re_morality;
	}

	public Record(Discuss re_discuss, int re_id, Participator re_participator, Expert re_expert, String re_unfm,
			int re_educate, int re_scientific, int re_morality, int re_score, String re_spare) {
		super();
		this.re_discuss = re_discuss;
		this.re_id = re_id;
		this.re_participator = re_participator;
		this.re_expert = re_expert;
		this.re_unfm = re_unfm;
		this.re_educate = re_educate;
		this.re_scientific = re_scientific;
		this.re_morality = re_morality;
		this.re_score = re_score;
		this.re_spare = re_spare;
	}

	public final int getRe_id() {
		return re_id;
	}

	public final void setRe_id(int re_id) {
		this.re_id = re_id;
	}

	public final Discuss getRe_discuss() {
		return re_discuss;
	}

	public final void setRe_discuss(Discuss re_discuss) {
		this.re_discuss = re_discuss;
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

	public final String getRe_unfm() {
		return re_unfm;
	}

	public final void setRe_unfm(String re_unfm) {
		this.re_unfm = re_unfm;
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

	public final int getRe_score() {
		return re_score;
	}

	public final void setRe_score(int re_score) {
		this.re_score = re_score;
	}

	public final String getRe_spare() {
		return re_spare;
	}

	public final void setRe_spare(String re_spare) {
		this.re_spare = re_spare;
	}

	@Override
	public String toString() {
		return "Record [re_id=" + re_id + ", re_discuss=" + re_discuss + ", re_participator=" + re_participator
				+ ", re_expert=" + re_expert + ", re_unfm=" + re_unfm + ", re_educate=" + re_educate
				+ ", re_scientific=" + re_scientific + ", re_morality=" + re_morality + ", re_score=" + re_score
				+ ", re_spare=" + re_spare + "]";
	}

}