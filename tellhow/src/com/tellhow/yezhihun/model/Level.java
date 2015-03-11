package com.tellhow.yezhihun.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="t_level")
public class Level {
	@Id
	@GeneratedValue
	@Column(name="id",length=32)
	private Integer id;
	@Column(name="name",length=32,nullable=false)
	private String name;
	@Column(name="info",length=32,nullable=true)
	private String info;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}
	
}
