package com.tellhow.yezhihun.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.tellhow.yezhihun.base.service.impl.AbstractBaseServiceImpl;
import com.tellhow.yezhihun.model.Intro;
import com.tellhow.yezhihun.service.IntroService;

@Service("introService")
public class IntroServiceImpl extends AbstractBaseServiceImpl<Intro> implements IntroService{


	public IntroServiceImpl() {
		super(Intro.class);
	}

	@Override
	public Intro get(int id) {
		Intro intro = baseDao.get(Intro.class, id);
		return intro;
	}

	@Override
	public List<Intro> queryList(Intro intro) {
		StringBuffer hql = new StringBuffer();
		Map<String,Object> params = new HashMap<String,Object>();
		hql.append(" from Intro u where 1=1 ");
		if(intro!=null){
			if(intro.getTitle()!=null){
				hql.append(" and u.title like :title ");
				params.put("title", "%"+intro.getTitle()+"%");
			}
		}
		hql.append(" order by date desc ");
		@SuppressWarnings("unchecked")
		List<Intro> list = (List<Intro>)baseDao.queryListByHql(hql.toString(),params);
		return list;
	}

	@Override
	public void add(Intro Intro) {
		try {
			baseDao.add(Intro);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void delete(Intro Intro) {
		baseDao.delete(Intro);
	}

	@Override
	public void update(Intro Intro) {
		baseDao.update(Intro);
		
	}

	@Override
	public Intro getFirst() {
		List<Intro> list = queryList(null);
		if(list.size()>0){
			return list.get(0);
		}
		return null;
	}
	
}
