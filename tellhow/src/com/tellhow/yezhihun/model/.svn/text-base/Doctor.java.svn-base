package com.tellhow.yezhihun.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

@Entity
@Table(name="t_doctor")
public class Doctor {

	@Id
	@GeneratedValue
	@Column(name="id",length=32)
	private Integer id;
	@Column(name="name",length=32,nullable=false)
	private String name;
	@Column(name="age",length=2,nullable=false)
	private Integer age;
	@Cascade(value={CascadeType.SAVE_UPDATE})
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="depart_id")
	private Depart depart;
	@Column(name="sex",length=1,nullable=false)
	private int sex;
	@Cascade(value={CascadeType.SAVE_UPDATE})
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="level_id")
	private Level level;

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

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public Depart getDepart() {
		return depart;
	}

	public void setDepart(Depart depart) {
		this.depart = depart;
	}

	public int getSex() {
		return sex;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}

	public Level getLevel() {
		return level;
	}

	public void setLevel(Level level) {
		this.level = level;
	}
	
}
