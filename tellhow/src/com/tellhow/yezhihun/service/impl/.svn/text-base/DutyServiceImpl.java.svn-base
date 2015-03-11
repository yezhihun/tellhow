package com.tellhow.yezhihun.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tellhow.yezhihun.base.service.impl.AbstractBaseServiceImpl;
import com.tellhow.yezhihun.model.Depart;
import com.tellhow.yezhihun.model.Doctor;
import com.tellhow.yezhihun.model.Duty;
import com.tellhow.yezhihun.service.DepartService;
import com.tellhow.yezhihun.service.DoctorService;
import com.tellhow.yezhihun.service.DutyService;

@Service("dutyService")
public class DutyServiceImpl extends AbstractBaseServiceImpl<Duty> implements DutyService{

	@Resource
	private DoctorService doctorService;
	@Resource
	private DepartService departService;
	
	
	public DutyServiceImpl() {
		super(Duty.class);
	}

	@Override
	public Duty get(int id) {
		Duty duty = baseDao.get(Duty.class, id);
		return duty;
	}

	@Override
	public void add(Duty duty) {
		Depart depart = departService.get( duty.getDepart().getId() );
		duty.setDepart(depart);
		Doctor doctor = doctorService.get( duty.getDoctor().getId() );
		duty.setDoctor(doctor);
		baseDao.add(duty);
		
	}

	@Override
	public List<Duty> queryList(Duty duty) {
		StringBuilder hql = new StringBuilder();
		Map<String,Object> params = new HashMap<String,Object>();
		hql.append(" from Duty t where 1=1 ");
		if(duty!=null){
			if(duty.getDoctor()!=null && duty.getDoctor().getName()!=null && !"".equals(duty.getDoctor().getName())){
				hql.append(" and t.doctor.name like :name ");
				params.put("name", "%"+duty.getDoctor().getName()+"%");
			}
			if(duty.getDepart()!=null && duty.getDepart().getId()!=null){
				hql.append(" and t.depart.id =:id ");
				params.put("id", duty.getDepart().getId());
			}
			if(duty.getDate()!=null){
				hql.append(" and t.date =:date ");
				params.put("date", duty.getDate());
			}
		}
		@SuppressWarnings("unchecked")
		List<Duty> list = (List<Duty>)baseDao.queryListByHql(hql.toString(), params);
		return list;
	}

	@Override
	public void delete(Duty duty) {
		baseDao.delete(duty);
		
	}

	@Override
	public void update(Duty duty) {
		Depart depart = departService.get( duty.getDepart().getId() );
		duty.setDepart(depart);
		Doctor doctor = doctorService.get( duty.getDoctor().getId() );
		duty.setDoctor(doctor);
		baseDao.update(duty);
		
	}

}
