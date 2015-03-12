package com.tellhow.yezhihun.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.tellhow.yezhihun.base.service.impl.AbstractBaseServiceImpl;
import com.tellhow.yezhihun.model.News;
import com.tellhow.yezhihun.service.NewsService;

@Service("newsService")
public class NewsServiceImpl extends AbstractBaseServiceImpl<News> implements NewsService{


	public NewsServiceImpl() {
		super(News.class);
	}

	@Override
	public News get(int id) {
		News news = baseDao.get(News.class, id);
		return news;
	}

	@Override
	public List<News> queryList(News news) {
		StringBuffer hql = new StringBuffer();
		Map<String,Object> params = new HashMap<String,Object>();
		hql.append(" from News u where 1=1 ");
		if(news!=null){
			if(news.getTitle()!=null && !"".equals(news.getTitle())){
				hql.append(" and u.title like :title ");
				params.put("title", "%"+news.getTitle()+"%");
			}
		}
		hql.append(" order by date desc ");
		@SuppressWarnings("unchecked")
		List<News> list = (List<News>)baseDao.queryListByHql(hql.toString(),params);
		return list;
	}

	@Override
	public void add(News News) {
		try {
			baseDao.add(News);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void delete(News News) {
		baseDao.delete(News);
	}

	@Override
	public void update(News News) {
		baseDao.update(News);
		
	}

	@Override
	public List<News> queryList() {
		List<News> list = queryList(null);
		if(list.size()>10){
			return list.subList(0, 10);
		}
		return list;
	}
	
}
