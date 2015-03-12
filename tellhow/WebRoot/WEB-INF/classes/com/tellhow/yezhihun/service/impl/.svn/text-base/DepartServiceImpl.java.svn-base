package com.tellhow.yezhihun.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.tellhow.yezhihun.base.service.impl.AbstractBaseServiceImpl;
import com.tellhow.yezhihun.model.Depart;
import com.tellhow.yezhihun.service.DepartService;

@Service("departService")
public class DepartServiceImpl extends AbstractBaseServiceImpl<Depart> implements DepartService{


	public DepartServiceImpl() {
		super(Depart.class);
	}

	@Override
	public Depart get(int id) {
		Depart depart = baseDao.get(Depart.class, id);
		return depart;
	}

	@Override
	public List<Depart> queryList(Depart depart) {
		StringBuffer hql = new StringBuffer();
		Map<String,Object> params = new HashMap<String,Object>();
		hql.append(" from Depart u where 1=1 ");
		if(depart!=null){
			if(depart.getName()!=null && !"".equals(depart.getName())){
				hql.append(" and u.name like :name ");
				params.put("name", "%"+depart.getName()+"%");
			}
		}
		@SuppressWarnings("unchecked")
		List<Depart> list = (List<Depart>)baseDao.queryListByHql(hql.toString(),params);
		return list;
	}

	@Override
	public void add(Depart depart) {
		try {
			baseDao.add(depart);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void delete(Depart depart) {
		baseDao.delete(depart);
	}

	@Override
	public void update(Depart depart) {
		baseDao.update(depart);
		
	}
	
}
