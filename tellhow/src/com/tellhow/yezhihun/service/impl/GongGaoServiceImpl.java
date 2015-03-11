package com.tellhow.yezhihun.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.tellhow.yezhihun.base.service.impl.AbstractBaseServiceImpl;
import com.tellhow.yezhihun.model.GongGao;
import com.tellhow.yezhihun.service.GongGaoService;

@Service("gongGaoService")
public class GongGaoServiceImpl extends AbstractBaseServiceImpl<GongGao> implements GongGaoService{


	public GongGaoServiceImpl() {
		super(GongGao.class);
	}

	@Override
	public GongGao get(int id) {
		GongGao gongGao = baseDao.get(GongGao.class, id);
		return gongGao;
	}

	@Override
	public List<GongGao> queryList(GongGao gongGao) {
		StringBuffer hql = new StringBuffer();
		Map<String,Object> params = new HashMap<String,Object>();
		hql.append(" from GongGao u where 1=1 ");
		if(gongGao!=null){
			if(gongGao.getTitle()!=null){
				hql.append(" and u.title like :title ");
				params.put("title", "%"+gongGao.getTitle()+"%");
			}
		}
		hql.append(" order by date desc ");
		@SuppressWarnings("unchecked")
		List<GongGao> list = (List<GongGao>)baseDao.queryListByHql(hql.toString(),params);
		return list;
	}

	@Override
	public void add(GongGao gongGao) {
		try {
			baseDao.add(gongGao);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void delete(GongGao gongGao) {
		baseDao.delete(gongGao);
	}

	@Override
	public void update(GongGao gongGao) {
		baseDao.update(gongGao);
		
	}

	@Override
	public List<GongGao> queryList() {
		List<GongGao> list = queryList(null);
		if(list.size()>10){
			return list.subList(0, 10);
		}
		return list;
	}
	
}
