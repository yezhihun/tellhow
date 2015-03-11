package com.tellhow.yezhihun.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.tellhow.yezhihun.base.model.page.PageInfo;
import com.tellhow.yezhihun.model.News;
import com.tellhow.yezhihun.service.NewsService;


@Scope("prototype")
@Controller("newsAction")
public class NewsAction extends ActionSupport{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -2921945405248371284L;

	@Resource
	private NewsService newsService;
	
	private JSONObject jsonData;
	private News news;
	private PageInfo page;
	
	public String show(){
		return SUCCESS;
	}
	
	public String ajaxShowList(){
		initJson();
		List<News> list = newsService.queryList(news);
		jsonData.put("list", convert(list));
		return SUCCESS;
	}
	
	private List<Map<String,Object>> convert(List<News> list){
		List<Map<String,Object>> mapList = new ArrayList<Map<String,Object>>();
		for(News i : list){
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("id", i.getId());
			map.put("title", i.getTitle());
			map.put("info", i.getInfo());
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			map.put("date", sf.format(i.getDate()));
			
			mapList.add(map);
		}
		return mapList;
	}
	
	public String ajaxShowAllDep(){
		initJson();
		List<News> list = newsService.queryList(null);
		
		jsonData.put("list", list);
		
		return SUCCESS;
	}
	
	public String addNews(){
		
		return SUCCESS;
	}
	
	public String ajaxAddNews(){
		
		return SUCCESS;
	}
	
	public String ajaxDeleteNews(){
		initJson();
		jsonData.put("message", "操作成功");
		try {
			news = newsService.get(news.getId());
			newsService.delete(news);
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("message", "操作失败");
		}
		return SUCCESS;
	}
	
	public String updateNews(){
		news = newsService.get(news.getId());
		initJson();
		jsonData.put("news", news);
		return SUCCESS;
	}
	
	public String ajaxUpdateNews(){
		initJson();
		jsonData.put("message", "操作成功");
		try {
			if(news.getId()!=null){
				news.setDate(new Date());
				newsService.update(news);
			}else{
				news.setDate(new Date());
				newsService.add(news);
			}
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("message", "操作失败");
		}
		
		return SUCCESS;
	}
	
	private void initJson(){
		if(jsonData==null){
			jsonData = new JSONObject();
		}
	}
	
	public PageInfo getPage() {
		return page;
	}

	public void setPage(PageInfo page) {
		this.page = page;
	}

	public JSONObject getJsonData() {
		return jsonData;
	}

	public News getNews() {
		return news;
	}

	public void setNews(News news) {
		this.news = news;
	}
}
