package com.tellhow.yezhihun.base.service.impl;

import javax.annotation.Resource;

import com.tellhow.yezhihun.base.dao.BaseDao;
import com.tellhow.yezhihun.base.service.BaseService;
/**
 * 基础服务模块，处理一些服务模块通用功能
 * @author tianye
 *
 * @param <T>
 */
public abstract class AbstractBaseServiceImpl<T> implements BaseService<T>{

	@Resource
	protected BaseDao<T> baseDao;
	
	private Class<T> classz;
	
	public AbstractBaseServiceImpl(Class<T> clazz){
		this.classz=clazz;
	}
	
//	public void add(T t) {
//		// TODO Auto-generated method stub
//	}
//
//	public void delete(T t) {
//		// TODO Auto-generated method stub
//		
//	}
//
//	public void delete(int id) {
//		// TODO Auto-generated method stub
//		
//	}
//
//	public void update(T t) {
//		// TODO Auto-generated method stub
//		
//	}
//
//	public void update(T oldObj, T newObj) {
//		// TODO Auto-generated method stub
//		
//	}
//
//	public T get(T t) {
//		return null;
//	}
//
//	public T get(int id) {
//		T t =  (T) baseDao.get(classz, id);
//		return t;
//	}
//
//	public T queryList(T t) {
//		// TODO Auto-generated method stub
//		return null;
//	}

}
