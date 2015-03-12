package com.tellhow.yezhihun.base.dao.impl;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Service;

import com.tellhow.yezhihun.base.dao.BaseDao;

@Service("baseDao")
public class BaseDaoImpl<T> extends HibernateDaoSupport implements BaseDao<T>{

	@Autowired
	public BaseDaoImpl(SessionFactory sessionFactory) {
		setSessionFactory(sessionFactory);
	}
	
	@Override
	public void add(T t) {
		HibernateTemplate ht = getHibernateTemplate();
		ht.save(t);
	}

	@Override
	public void delete(T t) {
		HibernateTemplate ht = getHibernateTemplate();
		ht.delete(t);
		
	}

	@Override
	public void update(T t) {
		HibernateTemplate ht = getHibernateTemplate();
		ht.update(t);
		
	}

	@Override
	public T update(T oldObj, T newObj) {
		if(!newObj.getClass().equals(oldObj.getClass())){
			Exception e = new Exception("类型不一致！");
			try {
				throw e;
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}
		Class<?> demo = newObj.getClass();
		Field[] field = demo.getDeclaredFields();
		for(int i=0;i<field.length;i++){
			Class<?> type = field[i].getType();
			String fieldName = field[i].getName();
			fieldName = fieldName.replaceFirst(fieldName.charAt(0)+"", (fieldName.charAt(0)+"").toUpperCase());
			
			Object newVal = getter(newObj,fieldName);
			Object oldVal = getter(oldObj,fieldName);
			if(newVal==null ){
				continue;
			}
			if(!newVal.equals( oldVal )){
				setter(oldObj, fieldName, newVal, type);
			}
		}
		
		return oldObj;
	}
	
	private Object getter(Object obj, String att){
		try {
			Method method = obj.getClass().getMethod( "get" + att );
			return method.invoke(obj);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	private void setter(Object obj, String att, Object value, Class<?> type){
		
		try {
			Method method = obj.getClass().getMethod("set" + att, type);
			method.invoke(obj, value);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
	}

	@Override
	public T get(Class<T> classz ,final int id) {
		HibernateTemplate ht = getHibernateTemplate();
		T t = null;
		try {
			t = ht.get(classz, id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return t;
	}
	
	@Override
	public List<?> queryListBySql(final String sql,final Map<String,Object> params) {
		return null;
	}

	@Override
	public List<?> queryListByHql(final String sql,final Map<String,Object> params) {
		HibernateTemplate ht = getHibernateTemplate();
		List<?> list = (List<?>) ht.execute(new HibernateCallback<Object>() {
        	public List<?> doInHibernate(Session session) throws HibernateException, SQLException {
        		return processFind(session,sql, params);
        	}
        });
		return list;
	}

	private List<?> processFind(Session session, String hql, Map<String, Object> params) {
        Query[] query = setupQuery(session,hql,params);
        return query[0].list();
    }
	
	private Query[] setupQuery(Session session, final String hql, Map<String, Object> params) throws HibernateException {
        try {
            Query countQuery = null, query = null;
            query = session.createQuery(hql).setCacheable(true);
            countQuery = getCountQuery(session, hql, true);
            processFilterParameter(countQuery, query, params);
            Query[] ret = { query, countQuery };
            return ret;
        }
        catch (Exception e) {
            throw new HibernateException(e);
        }
    }
	
	private Query getCountQuery(Session session,String hql,boolean cacheable){
		String queryString = "";
		int c = hql.indexOf("from");
		if(c!=-1){
			queryString = " select count(*) " + hql.substring(c,hql.length());
		}else{
			queryString = " select count(*) " + hql;
		}
		
		return session.createQuery(queryString).setCacheable(cacheable);
	}
	
	private void processFilterParameter(Query countQuery, Query query, Map<String, Object> params) {
    	if (params != null) {
    		if (countQuery != null)
    			this.setParameters(countQuery, params);
            if (query != null)
            	this.setParameters(query, params);
        }
    }
	 
	private void setParameters(Query query, Map<String, Object> params) {
    	if(params == null || params.isEmpty())
    		return;
    	
        for (Entry<String, Object> param : params.entrySet()) {
        	query.setParameter(param.getKey(), param.getValue());
        }
   }
}
