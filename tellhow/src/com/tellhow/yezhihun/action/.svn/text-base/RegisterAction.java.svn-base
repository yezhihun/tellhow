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
import com.tellhow.yezhihun.model.Register;
import com.tellhow.yezhihun.service.RegisterService;


@Scope("prototype")
@Controller("registerAction")
public class RegisterAction extends ActionSupport{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -2921945405248371284L;

	@Resource
	private RegisterService registerService;
	
	private JSONObject jsonData;
	private Register register;
	private PageInfo page;
	
	public String show(){
		return SUCCESS;
	}
	
	public String ajaxShowList(){
		initJson();
		List<Register> list = registerService.queryList(register);
		
		jsonData.put("list", convert(list));
		return SUCCESS;
	}
	
	private List<Map<String,Object>> convert(List<Register> list){
		List<Map<String,Object>> listMap = new ArrayList<Map<String,Object>>();
		for(Register r : list){
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("id", r.getId());
			map.put("userName", r.getUserName());
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
			map.put("requestTime", sf.format(r.getRequestTime()));
			map.put("regTime", r.getRegTime()==null?"--":sf.format(r.getRegTime()));
			map.put("depart", r.getDepart()==null?"":r.getDepart().getName());
			
			listMap.add(map);
		}
		return listMap;
	}
	
	public String addRegister(){
		
		return SUCCESS;
	}
	
	public String ajaxAddRegister(){
		
		return SUCCESS;
	}
	
	public String deleteRegister(){
		
		return SUCCESS;
	}
	
	public String ajaxDeleteRegister(){
		initJson();
		jsonData.put("message", "操作成功");
		try {
			register = registerService.get(register.getId());
			registerService.delete(register);
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("message", "操作失败");
		}
		return SUCCESS;
	}
	
	public String updateRegister(){
		register = registerService.get(register.getId());
		initJson();
		jsonData.put("register", register);
		return SUCCESS;
	}
	
	public String ajaxUpdateRegister(){
		initJson();
		jsonData.put("message", "预约成功");
		try {
			if(register.getId()!=null){
				registerService.update(register);
			}else{
				registerService.add(register);
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

	public Register getRegister() {
		return register;
	}

	public void setRegister(Register register) {
		this.register = register;
	}
}
