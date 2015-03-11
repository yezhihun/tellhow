package com.tellhow.yezhihun.service;

import java.util.List;

import com.tellhow.yezhihun.base.service.BaseService;
import com.tellhow.yezhihun.model.Depart;

public interface DepartService extends BaseService<Depart>{

	public Depart get(int id);
	
	public void add(Depart depart);
	
	public List<Depart> queryList(Depart depart);
	
	public void delete(Depart depart);
	
	public void update(Depart depart);
}
