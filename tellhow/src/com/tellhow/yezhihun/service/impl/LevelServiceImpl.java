package com.tellhow.yezhihun.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.tellhow.yezhihun.base.service.impl.AbstractBaseServiceImpl;
import com.tellhow.yezhihun.model.Level;
import com.tellhow.yezhihun.service.LevelService;

@Service("levelService")
public class LevelServiceImpl extends AbstractBaseServiceImpl<Level> implements LevelService{

	public LevelServiceImpl() {
		super(Level.class);
		// TODO Auto-generated constructor stub
	}

	@Override
	public Level get(int id) {
		Level level = baseDao.get(Level.class, id);
		return level;
	}

	@Override
	public void add(Level level) {
		baseDao.add(level);
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Level> queryList(Level level) {
		StringBuilder hql = new StringBuilder();
		Map<String,Object> params = new HashMap<String,Object>();
		hql.append(" from Level t where 1=1 ");
		if(level!=null){
			if(level.getName()!=null && !"".equals(level.getName())){
				hql.append(" and t.name like:name ");
				params.put("name", "%"+level.getName()+"%");
			}
		}
		List<Level> list = (List<Level>)baseDao.queryListByHql(hql.toString(), params);
		return list;
	}

	@Override
	public void delete(Level level) {
		baseDao.delete(level);
		
	}

	@Override
	public void update(Level level) {
		baseDao.update(level);
		
	}

}
