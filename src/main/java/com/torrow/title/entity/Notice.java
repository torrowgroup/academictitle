/**
 * 
 */
package com.torrow.title.entity;

import java.util.Date;

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
 * @2017年8月18日下午10:20:30
 */
/*
 * 通知类
 */
@Entity
@Table(name="t_notice")
public class Notice {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(length=11)
	private int no_id;
	@Column(length=20)
	private String no_head; //通知标题
	@Column(length=255)
	private String no_content; //通知内容
	@Column(length=20)
	private String no_managerName; //发布人
	private Date no_issueData;//发布时间
	@Column(length=255)
	private String no_spare; //备用
	public Notice(int no_id, String no_head, String no_content, String no_managerName, Date no_issueData,
			String no_spare) {
		super();
		this.no_id = no_id;
		this.no_head = no_head;
		this.no_content = no_content;
		this.no_managerName = no_managerName;
		this.no_issueData = no_issueData;
		this.no_spare = no_spare;
	}
	public Notice() {
		super();
	}
	public final int getNo_id() {
		return no_id;
	}
	public final void setNo_id(int no_id) {
		this.no_id = no_id;
	}
	public final String getNo_head() {
		return no_head;
	}
	public final void setNo_head(String no_head) {
		this.no_head = no_head;
	}
	public final String getNo_content() {
		return no_content;
	}
	public final void setNo_content(String no_content) {
		this.no_content = no_content;
	}
	public final String getNo_managerName() {
		return no_managerName;
	}
	public final void setNo_managerName(String no_managerName) {
		this.no_managerName = no_managerName;
	}
	public final Date getNo_issueData() {
		return no_issueData;
	}
	public final void setNo_issueData(Date no_issueData) {
		this.no_issueData = no_issueData;
	}
	public final String getNo_spare() {
		return no_spare;
	}
	public final void setNo_spare(String no_spare) {
		this.no_spare = no_spare;
	}
	@Override
	public String toString() {
		return "Notice [no_id=" + no_id + ", no_head=" + no_head + ", no_content=" + no_content + ", no_managerName="
				+ no_managerName + ", no_issueData=" + no_issueData + ", no_spare=" + no_spare + "]";
	}
}
