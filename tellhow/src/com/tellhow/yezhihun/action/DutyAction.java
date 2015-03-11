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
import com.tellhow.yezhihun.model.Duty;
import com.tellhow.yezhihun.service.DutyService;


@Scope("prototype")
@Controller("dutyAction")
public class DutyAction extends ActionSupport{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -2921945405248371284L;

	@Resource
	private DutyService dutyService;
	
	private JSONObject jsonData;
	private Duty duty;
	private PageInfo page;
	
	public String show(){
		return SUCCESS;
	}
	
	public String ajaxShowList(){
		initJson();
		List<Duty> list = dutyService.queryList(duty);
		jsonData.put("list", convert(list));
		return SUCCESS;
	}
	
	public List<Map<String,Object>> convert(List<Duty> list){
		List<Map<String,Object>> listMap = new ArrayList<Map<String,Object>>();
		for(Duty duty : list){
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("doctorName", duty.getDoctor()==null?"":duty.getDoctor().getName());
			map.put("doctorId", duty.getDoctor().getId());
			map.put("departId", duty.getDepart().getId());
			map.put("id", duty.getId());
			map.put("departName", duty.getDepart().getName());
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
			map.put("date", sf.format(duty.getDate()));
			
			listMap.add(map);
		}
		return listMap;
	}
	
	public String addDuty(){
		
		return SUCCESS;
	}
	
	public String ajaxAddDuty(){
		
		return SUCCESS;
	}
	
	public String deleteDuty(){
		
		return SUCCESS;
	}
	
	public String ajaxDeleteDuty(){
		initJson();
		jsonData.put("message", "操作成功");
		try {
			duty = dutyService.get(duty.getId());
			dutyService.delete(duty);
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("message", "操作失败");
		}
		return SUCCESS;
	}
	
	public String updateDuty(){
		duty = dutyService.get(duty.getId());
		initJson();
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("doctorName", duty.getDoctor()==null?"":duty.getDoctor().getName());
		map.put("doctorId", duty.getDoctor()==null?"":duty.getDoctor().getId());
		map.put("id", duty.getId());
		map.put("departName", duty.getDepart().getName());
		map.put("departId", duty.getDepart().getId());
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		map.put("date", sf.format(duty.getDate()));
		
		jsonData.put("duty", map);
		return SUCCESS;
	}
	
	public String ajaxUpdateDuty(){
		initJson();
		jsonData.put("message", "操作成功");
		try {
			if(duty.getId()!=null){
				dutyService.update(duty);
			}else{
				dutyService.add(duty);
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

	public Duty getDuty() {
		return duty;
	}

	public void setDuty(Duty duty) {
		this.duty = duty;
	}
}
