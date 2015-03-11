package com.tellhow.yezhihun.action;

import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.tellhow.yezhihun.base.model.page.PageInfo;
import com.tellhow.yezhihun.model.Level;
import com.tellhow.yezhihun.service.LevelService;


@Scope("prototype")
@Controller("levelAction")
public class LevelAction extends ActionSupport{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -2921945405248371284L;

	@Resource
	private LevelService levelService;
	
	private JSONObject jsonData;
	private Level level;
	private PageInfo page;
	
	public String show(){
		return SUCCESS;
	}
	
	public String ajaxShowList(){
		initJson();
		List<Level> list = levelService.queryList(level);
		
		jsonData.put("list", list);
		return SUCCESS;
	}
	
	public String addLevel(){
		
		return SUCCESS;
	}
	
	public String ajaxAddLevel(){
		
		return SUCCESS;
	}
	
	public String deleteLevel(){
		
		return SUCCESS;
	}
	
	public String ajaxDeleteLevel(){
		initJson();
		jsonData.put("message", "操作成功");
		try {
			level = levelService.get(level.getId());
			levelService.delete(level);
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("message", "操作失败");
		}
		return SUCCESS;
	}
	
	public String updateLevel(){
		level = levelService.get(level.getId());
		initJson();
		jsonData.put("level", level);
		return SUCCESS;
	}
	
	public String ajaxUpdateLevel(){
		initJson();
		jsonData.put("message", "操作成功");
		try {
			if(level.getId()!=null){
				levelService.update(level);
			}else{
				levelService.add(level);
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

	public Level getLevel() {
		return level;
	}

	public void setLevel(Level level) {
		this.level = level;
	}
}
