package com.tellhow.yezhihun.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tellhow.yezhihun.base.service.impl.AbstractBaseServiceImpl;
import com.tellhow.yezhihun.model.Depart;
import com.tellhow.yezhihun.model.Doctor;
import com.tellhow.yezhihun.model.Level;
import com.tellhow.yezhihun.service.DepartService;
import com.tellhow.yezhihun.service.DoctorService;
import com.tellhow.yezhihun.service.LevelService;

@Service("doctorService")
public class DoctorServiceImpl extends AbstractBaseServiceImpl<Doctor> implements DoctorService {
	
	@Resource
	private DepartService departService;
	@Resource
	private LevelService levelService;
	
	public DoctorServiceImpl() {
		super(Doctor.class);
	}

	@Override
	public Doctor get(int id) {
		Doctor doctor = baseDao.get(Doctor.class, id);
		return doctor;
	}

	@Override
	public void add(Doctor doc) {
		Depart dep = departService.get(doc.getDepart().getId());
		doc.setDepart( dep );
		Level lev = levelService.get(doc.getLevel().getId());
		doc.setLevel(lev);
		baseDao.add(doc);
		
	}

	@Override
	public List<Doctor> queryList(Doctor doc) {
		StringBuilder hql = new StringBuilder();
		Map<String,Object> params = new HashMap<String,Object>();
		hql.append(" from Doctor t where 1=1 ");
		if(doc!=null){
			if(doc.getName()!=null && !"".equals(doc.getName())){
				hql.append(" and t.name like:info ");
				params.put("info", "%"+doc.getName()+"%");
			}
			if(doc.getDepart()!=null && doc.getDepart().getId()!=null){
				hql.append(" and t.depart.id =:depId ");
				params.put("depId", doc.getDepart().getId());
			}
		}
		@SuppressWarnings("unchecked")
		List<Doctor> list = (List<Doctor>)baseDao.queryListByHql(hql.toString(), params);
		return list;
	}

	@Override
	public void delete(Doctor doc) {
		baseDao.delete(doc);
		
	}

	@Override
	public void update(Doctor doc) {
		Depart dep = departService.get(doc.getDepart().getId());
		doc.setDepart( dep );
		
		Level lev = levelService.get(doc.getLevel().getId());
		doc.setLevel(lev);
		baseDao.update(doc);
		
	}

}
