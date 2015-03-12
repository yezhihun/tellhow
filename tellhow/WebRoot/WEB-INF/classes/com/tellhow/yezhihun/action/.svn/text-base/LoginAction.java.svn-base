package com.tellhow.yezhihun.action;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.tellhow.yezhihun.model.GongGao;
import com.tellhow.yezhihun.model.Intro;
import com.tellhow.yezhihun.model.News;
import com.tellhow.yezhihun.model.User;
import com.tellhow.yezhihun.service.GongGaoService;
import com.tellhow.yezhihun.service.IntroService;
import com.tellhow.yezhihun.service.NewsService;
import com.tellhow.yezhihun.service.UserService;

@Scope("prototype")
@Controller("loginAction")
public class LoginAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = -4069867769584817048L;
	
	@Resource
	private UserService userService;
	@Resource
	private IntroService introService;
	@Resource
	private NewsService newsService;
	@Resource
	private GongGaoService gongGaoService;
	
	private JSONObject jsonData;
	private User user;
	
	public String login(){
		initJson();
		jsonData.put("user", user);
		if(user.getName().equals("admin") && user.getPassword().equals("admin")){
			jsonData.put("role", "a");
			return SUCCESS;
		}
		if(checkLogUser(user)){
			jsonData.put("result", "y");
			jsonData.put("role", "u");
		}else{
			jsonData.put("result", "n");
			jsonData.put("role", "u");
		}
		return SUCCESS;
	}
	
	public String ajaxLogin(){
		initJson();
		String password = user.getPassword();
		String flag = user.getFlag();
		User user1 = userService.getUserByName(user);
		if(user1!=null){
			if(password.equals(user1.getPassword())){
				jsonData.put("user", user1);
				
				if(!"a".equals(user1.getRole())){
					jsonData.put("role", "u");
					if("front".equals(flag)){
						
					}else{
						jsonData.put("result", "n");
						return SUCCESS;
					}
				}
				
				return SUCCESS;
			}else{
				jsonData.put("result", "n");
			}
		}else{
			jsonData.put("result", "n");
		}
		return SUCCESS;
	}
	
	public String ajaxGetAllDesc(){
		initJson();
		List<News> list = newsService.queryList();
		Intro intro = introService.getFirst();
		List<GongGao> listG = gongGaoService.queryList();
		
		jsonData.put("news", list);
		jsonData.put("intro", intro);
		jsonData.put("gonggao", listG);
		
		return SUCCESS;
	}
	
	public String register(){
		initJson();
		jsonData.put("message", "注册成功");
		if(checkUser(user)){
			user.setRole("u");
			user.setRequestDate(new Date());
			userService.add(user);
		}else{
			jsonData.put("message", "用户名重复");
		}
		return SUCCESS;
	}
	
	public String ajaxCheck(){
		initJson();
		jsonData.put("result", "y");
		User u = new User();
		u.setName(user.getName());
		List<User> list = userService.queryList(u);
		if(list.size()>0){
			jsonData.put("result", "n");
		}
		return SUCCESS;
	}
	
	private boolean checkLogUser(User user){
		User u = userService.getUserByName(user);
		if(u==null){
			return false;
		}else{
			return true;
		}
	}
	
	private boolean checkUser(User user){
		User u = new User();
		u.setName(user.getName());
		List<User> list = userService.queryList(u);
		if(list.size()>0){
			return false;
		}
		return true;
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

	public JSONObject getJsonData() {
		return jsonData;
	}
	
	
}
