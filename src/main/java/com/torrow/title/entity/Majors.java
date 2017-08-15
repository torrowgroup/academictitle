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
 * @2017年8月14日下午2:59:02
 */
@Entity
@Table(name="t_majors")
public class Majors {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(length=11)
	private int maj_id; 
	@Column(length=20)
	private String maj_majorName; //专业名称
	@Column(length=255)
	private String maj_spare; //备用
	
	public Majors() {
		super();
	}

	public Majors(int maj_id, String maj_majorName, String maj_spare) {
		super();
		this.maj_id = maj_id;
		this.maj_majorName = maj_majorName;
		this.maj_spare = maj_spare;
	}

	public int getMaj_id() {
		return maj_id;
	}

	public void setMaj_id(int maj_id) {
		this.maj_id = maj_id;
	}

	public String getMaj_majorName() {
		return maj_majorName;
	}

	public void setMaj_majorName(String maj_majorName) {
		this.maj_majorName = maj_majorName;
	}

	public String getMaj_spare() {
		return maj_spare;
	}

	public void setMaj_spare(String maj_spare) {
		this.maj_spare = maj_spare;
	}

	@Override
	public String toString() {
		return "Major [maj_id=" + maj_id + ", maj_majorName=" + maj_majorName + ", maj_spare=" + maj_spare + "]";
	}
	
}
