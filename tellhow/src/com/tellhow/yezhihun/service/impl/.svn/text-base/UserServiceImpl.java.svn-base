package com.tellhow.yezhihun.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.tellhow.yezhihun.base.service.impl.AbstractBaseServiceImpl;
import com.tellhow.yezhihun.model.User;
import com.tellhow.yezhihun.service.UserService;

@Service("userService")
public class UserServiceImpl extends AbstractBaseServiceImpl<User> implements UserService{


	public UserServiceImpl() {
		super(User.class);
	}

	@Override
	public User get(int id) {
		User user = baseDao.get(User.class, id);
		return user;
	}

	@Override
	public List<User> queryList(User user) {
		StringBuffer hql = new StringBuffer();
		Map<String,Object> params = new HashMap<String,Object>();
		hql.append(" from User u where 1=1 ");
		if(user!=null){
			if(user.getId()!=null){
				hql.append(" and u.id=:id ");
				params.put("id", user.getId());
			}
			if(user.getName()!=null){
				hql.append(" and u.name like :name ");
				params.put("name", "%"+user.getName()+"%");
			}
		}
		@SuppressWarnings("unchecked")
		List<User> list = (List<User>)baseDao.queryListByHql(hql.toString(),params);
		return list;
	}

	@Override
	public void add(User user) {
		try {
			baseDao.add(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void delete(User user) {
		baseDao.delete(user);
	}

	@Override
	public void update(User user) {
		baseDao.update(user);
		
	}

	@Override
	public User getUserByName(User user) {
		StringBuffer hql = new StringBuffer();
		Map<String,Object> params = new HashMap<String,Object>();
		hql.append(" from User u where name=:name ");
		params.put("name", user.getName());
		 List<User>list = (List<User>)baseDao.queryListByHql(hql.toString(), params);
		if(list.size()>0){
			return list.get(0);
		}
		return null;
	}
	
	
}
