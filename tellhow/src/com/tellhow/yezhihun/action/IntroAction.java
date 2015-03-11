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
import com.tellhow.yezhihun.model.Intro;
import com.tellhow.yezhihun.service.IntroService;


@Scope("prototype")
@Controller("introAction")
public class IntroAction extends ActionSupport{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -2921945405248371284L;

	@Resource
	private IntroService introService;
	
	private JSONObject jsonData;
	private Intro intro;
	private PageInfo page;
	
	public String show(){
		return SUCCESS;
	}
	
	public String ajaxShowList(){
		initJson();
		List<Intro> list = introService.queryList(intro);
		jsonData.put("list", convert(list));
		return SUCCESS;
	}
	
	public String ajaxShowAllDep(){
		initJson();
		List<Intro> list = introService.queryList(null);
		
		jsonData.put("list", list);
		
		return SUCCESS;
	}
	
	private List<Map<String,Object>> convert(List<Intro> list){
		List<Map<String,Object>> mapList = new ArrayList<Map<String,Object>>();
		for(Intro i : list){
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
	
	public String addIntro(){
		
		return SUCCESS;
	}
	
	public String ajaxAddIntro(){
		
		return SUCCESS;
	}
	
	public String ajaxDeleteIntro(){
		initJson();
		jsonData.put("message", "操作成功");
		try {
			intro = introService.get(intro.getId());
			introService.delete(intro);
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("message", "操作失败");
		}
		return SUCCESS;
	}
	
	public String updateIntro(){
		intro = introService.get(intro.getId());
		initJson();
		jsonData.put("intro", intro);
		return SUCCESS;
	}
	
	public String ajaxUpdateIntro(){
		initJson();
		jsonData.put("message", "操作成功");
		try {
			if(intro.getId()!=null){
				intro.setDate( new Date() );
				introService.update(intro);
			}else{
				intro.setDate( new Date() );
				introService.add(intro);
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

	public Intro getIntro() {
		return intro;
	}

	public void setIntro(Intro intro) {
		this.intro = intro;
	}
}
