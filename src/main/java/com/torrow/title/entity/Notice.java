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
 * @2017年8月18日下午10:20:30
 */
/*
 * 通知类
 * 关联管理员
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
	@OneToOne
	@JoinColumn(name="ma_id")
	private Manager no_manager; //发布人，关联管理员
	@Column(length=20)
	private String issueData;//发布时间
	public Notice(int no_id, String no_head, String no_content, Manager no_manager, String issueData) {
		super();
		this.no_id = no_id;
		this.no_head = no_head;
		this.no_content = no_content;
		this.no_manager = no_manager;
		this.issueData = issueData;
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
	public final Manager getNo_manager() {
		return no_manager;
	}
	public final void setNo_manager(Manager no_manager) {
		this.no_manager = no_manager;
	}
	public final String getIssueData() {
		return issueData;
	}
	public final void setIssueData(String issueData) {
		this.issueData = issueData;
	}
	@Override
	public String toString() {
		return "Notice [no_id=" + no_id + ", no_head=" + no_head + ", no_content=" + no_content + ", no_manager="
				+ no_manager + ", issueData=" + issueData + "]";
	}
	
	
	
}
