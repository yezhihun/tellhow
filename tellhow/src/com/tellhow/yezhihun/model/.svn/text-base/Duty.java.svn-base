package com.tellhow.yezhihun.model;

import java.util.Date;

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
@Table(name="t_duty")
public class Duty {

	@Id
	@GeneratedValue
	@Column(name="id",length=32)
	private Integer id;
	@Column(name="date",length=20,columnDefinition="Date")
	private Date date;
	@Cascade(value={CascadeType.SAVE_UPDATE})
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="doctor_id")
	private Doctor doctor;
	@Cascade(value={CascadeType.SAVE_UPDATE})
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="depart_id")
	private Depart depart;

	public Integer getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Doctor getDoctor() {
		return doctor;
	}

	public void setDoctor(Doctor doctor) {
		this.doctor = doctor;
	}

	public Depart getDepart() {
		return depart;
	}

	public void setDepart(Depart depart) {
		this.depart = depart;
	}
	
}
