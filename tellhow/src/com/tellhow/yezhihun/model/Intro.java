package com.tellhow.yezhihun.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 简介
 * @author Administrator
 *
 */
@Entity
@Table(name="t_intro")
public class Intro {

	@Id
	@GeneratedValue
	@Column(name="id",length=32)
	private Integer id;
	@Column(name="title",length=32,nullable=false)
	private String title;
	@Column(name="info",length=32,nullable=false)
	private String info;
	@Column(name="date",length=20,columnDefinition="Date")
	private Date date;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
}
