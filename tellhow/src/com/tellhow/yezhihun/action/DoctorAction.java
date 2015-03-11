package com.tellhow.yezhihun.action;

import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.tellhow.yezhihun.base.model.page.PageInfo;
import com.tellhow.yezhihun.model.Doctor;
import com.tellhow.yezhihun.service.DoctorService;


@Scope("prototype")
@Controller("doctorAction")
public class DoctorAction extends ActionSupport{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -2921945405248371284L;

	@Resource
	private DoctorService doctorService;
	
	private JSONObject jsonData;
	private Doctor doctor;
	private PageInfo page;
	
	public String show(){
		return SUCCESS;
	}
	
	public String ajaxShowList(){
		initJson();
		List<Doctor> list = doctorService.queryList(doctor);
		jsonData.put("list", list);
		return SUCCESS;
	}
	
	public String addDoctor(){
		
		return SUCCESS;
	}
	
	public String ajaxAddDoctor(){
		
		return SUCCESS;
	}
	
	public String deleteDoctor(){
		
		return SUCCESS;
	}
	
	public String ajaxDeleteDoctor(){
		initJson();
		jsonData.put("message", "操作成功");
		try {
			doctor = doctorService.get(doctor.getId());
			doctorService.delete(doctor);
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("message", "操作失败");
		}
		return SUCCESS;
	}
	
	public String updateDoctor(){
		doctor = doctorService.get(doctor.getId());
		initJson();
		jsonData.put("doctor", doctor);
		return SUCCESS;
	}
	
	public String ajaxUpdateDoctor(){
		initJson();
		jsonData.put("message", "操作成功");
		try {
			if(doctor.getId()!=null){
				doctorService.update(doctor);
			}else{
				doctorService.add(doctor);
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

	public Doctor getDoctor() {
		return doctor;
	}

	public void setDoctor(Doctor doctor) {
		this.doctor = doctor;
	}
}
