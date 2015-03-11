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
import com.tellhow.yezhihun.model.GongGao;
import com.tellhow.yezhihun.service.GongGaoService;


@Scope("prototype")
@Controller("gonggaoAction")
public class GongGaoAction extends ActionSupport{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -2921945405248371284L;

	@Resource
	private GongGaoService gongGaoService;
	
	private JSONObject jsonData;
	private GongGao gongGao;
	private PageInfo page;
	
	public String show(){
		return SUCCESS;
	}
	
	public String ajaxShowList(){
		initJson();
		List<GongGao> list = gongGaoService.queryList(gongGao);
		jsonData.put("list", convert(list));
		return SUCCESS;
	}
	
	private List<Map<String,Object>> convert(List<GongGao> list){
		List<Map<String,Object>> mapList = new ArrayList<Map<String,Object>>();
		for(GongGao i : list){
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("id", i.getId());
			map.put("title", i.getTitle());
			map.put("info", i.getInfo());
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
			map.put("date", sf.format(i.getDate()));
			
			mapList.add(map);
		}
		return mapList;
	}
	
	public String ajaxShowAllDep(){
		initJson();
		List<GongGao> list = gongGaoService.queryList(null);
		
		jsonData.put("list", list);
		
		return SUCCESS;
	}
	
	public String addGongGao(){
		
		return SUCCESS;
	}
	
	public String ajaxAddGongGao(){
		
		return SUCCESS;
	}
	
	public String ajaxDeleteGongGao(){
		initJson();
		jsonData.put("message", "操作成功");
		try {
			gongGao = gongGaoService.get(gongGao.getId());
			gongGaoService.delete(gongGao);
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("message", "操作失败");
		}
		return SUCCESS;
	}
	
	public String updateGongGao(){
		gongGao = gongGaoService.get(gongGao.getId());
		initJson();
		jsonData.put("gongGao", gongGao);
		return SUCCESS;
	}
	
	public String ajaxUpdateGongGao(){
		initJson();
		jsonData.put("message", "操作成功");
		try {
			if(gongGao.getId()!=null){
				gongGao.setDate(new Date());
				gongGaoService.update(gongGao);
			}else{
				gongGao.setDate(new Date());
				gongGaoService.add(gongGao);
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

	public GongGao getGongGao() {
		return gongGao;
	}

	public void setGongGao(GongGao gongGao) {
		this.gongGao = gongGao;
	}
}
