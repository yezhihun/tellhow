package com.tellhow.yezhihun.base.dao;

import java.util.List;
import java.util.Map;



public interface BaseDao<T> {

	public  void add(T t);
	
	public  void delete(T t);
	
	public void update(T t);
	
	public T update(T oldObj, T newObj);
	
	public T get(Class<T> classz,int id);
	
	public List<?> queryListByHql(final String sql,Map<String,Object> params);
	
	public List<?> queryListBySql(final String sql,Map<String,Object> params);
}
