package com.tellhow.yezhihun.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ty_role")
public class Role {
	@Id
	@GeneratedValue
	@Column(name="id",length=32)
	private Integer id;
	@Column(name="role_name",length=32,nullable=false)
	private String roleName;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

}
