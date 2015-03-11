package com.tellhow.yezhihun.service.impl;

import org.springframework.stereotype.Service;

import com.tellhow.yezhihun.base.service.impl.AbstractBaseServiceImpl;
import com.tellhow.yezhihun.model.Role;
import com.tellhow.yezhihun.service.RoleService;

@Service("roleService")
public class RoleServiceImpl extends AbstractBaseServiceImpl<Role> implements RoleService{

	public RoleServiceImpl() {
		super(Role.class);
	}

	@Override
	public void save(Role role) {
		baseDao.add(role);
	}

	@Override
	public void delete(Role role) {
		baseDao.delete(role);
		
	}

	@Override
	public Role get(int id) {
		return baseDao.get(Role.class, id);
		
	}
	
}
