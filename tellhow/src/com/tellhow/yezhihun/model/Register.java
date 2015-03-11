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

/**
 * 挂号
 * @author Administrator
 *
 */
@Entity
@Table(name="t_register")
public class Register {

	@Id
	@GeneratedValue
	@Column(name="id",length=32)
	private Integer id;
	@Column(name="user_name",length=32,nullable=false)
	private String userName;
	@Column(name="request_time",length=20,columnDefinition="Date")
	private Date requestTime;
	@Column(name="reg_time",length=20,columnDefinition="Date")
	private Date RegTime;
	@Cascade(value={CascadeType.SAVE_UPDATE})
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="depart_id")
	private Depart depart;
	@Cascade(value={CascadeType.SAVE_UPDATE})
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="doctor_id")
	private Doctor doctor;
	
	public Integer getId() {
		return id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Date getRequestTime() {
		return requestTime;
	}
	public void setRequestTime(Date requestTime) {
		this.requestTime = requestTime;
	}
	public Date getRegTime() {
		return RegTime;
	}
	public void setRegTime(Date regTime) {
		RegTime = regTime;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Depart getDepart() {
		return depart;
	}
	public void setDepart(Depart depart) {
		this.depart = depart;
	}
	public Doctor getDoctor() {
		return doctor;
	}
	public void setDoctor(Doctor doctor) {
		this.doctor = doctor;
	}
	
}
