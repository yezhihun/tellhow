package com.tellhow.yezhihun.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.tellhow.yezhihun.base.model.page.PageInfo;
import com.tellhow.yezhihun.model.User;
import com.tellhow.yezhihun.service.UserService;


@Scope("prototype")
@Controller("userAction")
public class UserAction extends ActionSupport{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -2921945405248371284L;

	@Resource
	private UserService userService;
	
	private JSONObject jsonData;
	private User user;
	private PageInfo page;
	
	
	public String show(){
		return SUCCESS;
	}
	
	public String ajaxShowList(){
		initJson();
		List<User> list = userService.queryList(user);
		jsonData.put("list", convert(list));
		return SUCCESS;
	}
	
	public List<Map<String,Object>> convert(List<User> list){
		List<Map<String,Object>> listMap = new ArrayList<Map<String,Object>>();
		for(User user : list){
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("id", user.getId());
			map.put("name", user.getName());
			map.put("role", user.getRole());
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
			map.put("date", user.getRequestDate()==null?"--":sf.format(user.getRequestDate()));
			listMap.add(map);
		}
		return listMap;
	}
	
	public String addUser(){
		
		return SUCCESS;
	}
	
	public String ajaxAddUser(){
		
		return SUCCESS;
	}
	
	public String deleteUser(){
		
		return SUCCESS;
	}
	
	public String ajaxDeleteUser(){
		initJson();
		jsonData.put("message", "操作成功");
		try {
			user = userService.get(user.getId());
			userService.delete(user);
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("message", "操作失败");
		}
		return SUCCESS;
	}
	
	public String updateUser(){
		user = userService.get(user.getId());
		return SUCCESS;
	}
	
	public String ajaxUpdateUser(){
		initJson();
		jsonData.put("message", "操作成功");
		try {
			if(user.getId()!=null){
				userService.update(user);
			}else{
				userService.add(user);
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
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
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
	
}
