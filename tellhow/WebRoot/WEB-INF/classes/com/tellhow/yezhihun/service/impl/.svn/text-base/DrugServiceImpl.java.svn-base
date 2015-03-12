package com.tellhow.yezhihun.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.tellhow.yezhihun.base.service.impl.AbstractBaseServiceImpl;
import com.tellhow.yezhihun.model.Drug;
import com.tellhow.yezhihun.service.DrugService;

@Service("drugService")
public class DrugServiceImpl extends AbstractBaseServiceImpl<Drug> implements DrugService{


	public DrugServiceImpl() {
		super(Drug.class);
	}

	@Override
	public Drug get(int id) {
		Drug Drug = baseDao.get(Drug.class, id);
		return Drug;
	}

	@Override
	public List<Drug> queryList(Drug drug) {
		StringBuffer hql = new StringBuffer();
		Map<String,Object> params = new HashMap<String,Object>();
		hql.append(" from Drug u where 1=1 ");
		if(drug!=null){
			if(drug.getName()!=null && !"".equals(drug.getName())){
				hql.append(" and u.name like :name ");
				params.put("name", "%"+drug.getName()+"%");
			}
		}
		@SuppressWarnings("unchecked")
		List<Drug> list = (List<Drug>)baseDao.queryListByHql(hql.toString(),params);
		return list;
	}

	@Override
	public void add(Drug drug) {
		try {
			baseDao.add(drug);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void delete(Drug drug) {
		baseDao.delete(drug);
	}

	@Override
	public void update(Drug drug) {
		baseDao.update(drug);
		
	}
	
}
