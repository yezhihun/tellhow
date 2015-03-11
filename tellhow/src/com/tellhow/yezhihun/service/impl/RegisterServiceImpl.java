package com.tellhow.yezhihun.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tellhow.yezhihun.base.service.impl.AbstractBaseServiceImpl;
import com.tellhow.yezhihun.model.Depart;
import com.tellhow.yezhihun.model.Doctor;
import com.tellhow.yezhihun.model.Register;
import com.tellhow.yezhihun.service.DepartService;
import com.tellhow.yezhihun.service.DoctorService;
import com.tellhow.yezhihun.service.RegisterService;

@Service("registerService")
public class RegisterServiceImpl extends AbstractBaseServiceImpl<Register> implements RegisterService{

	@Resource
	private DepartService departService;
	@Resource
	private DoctorService doctorService;
	
	public RegisterServiceImpl() {
		super(Register.class);
	}

	@Override
	public Register get(int id) {
		Register register = baseDao.get(Register.class, id);
		return register;
	}

	@Override
	public void add(Register register) {
		Depart depart = departService.get(register.getDepart().getId());
		register.setDepart(depart);
		Doctor doctor = doctorService.get(register.getDoctor().getId());
		register.setRequestTime(new Date());
		register.setDoctor(doctor);
		baseDao.add(register);
		
	}

	@Override
	public List<Register> queryList(Register register) {
		StringBuilder hql = new StringBuilder();
		Map<String,Object> params = new HashMap<String,Object>();
		hql.append(" from Register t where 1=1 ");
		if(register!=null){
			if(register.getUserName()!=null && !"".equals(register.getUserName())){
				hql.append(" and t.userName like :name ");
				params.put("name", "%"+register.getUserName()+"%");
			}
		}
		@SuppressWarnings("unchecked")
		List<Register> list = (List<Register>)baseDao.queryListByHql(hql.toString(), params);
		return list;
	}

	@Override
	public void delete(Register register) {
		baseDao.delete(register);
		
	}

	@Override
	public void update(Register register) {
		baseDao.update(register);
		
	}

}
