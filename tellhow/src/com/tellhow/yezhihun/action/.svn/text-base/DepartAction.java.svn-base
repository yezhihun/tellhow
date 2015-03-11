package com.tellhow.yezhihun.action;

import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.tellhow.yezhihun.base.model.page.PageInfo;
import com.tellhow.yezhihun.model.Depart;
import com.tellhow.yezhihun.service.DepartService;


@Scope("prototype")
@Controller("departAction")
public class DepartAction extends ActionSupport{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -2921945405248371284L;

	@Resource
	private DepartService departService;
	
	private JSONObject jsonData;
	private Depart depart;
	private PageInfo page;
	
	public String show(){
		return SUCCESS;
	}
	
	public String ajaxShowList(){
		initJson();
		List<Depart> list = departService.queryList(depart);
		jsonData.put("list", list);
		return SUCCESS;
	}
	
	public String ajaxShowAllDep(){
		initJson();
		List<Depart> list = departService.queryList(null);
		
		jsonData.put("list", list);
		
		return SUCCESS;
	}
	
	public String addDepart(){
		
		return SUCCESS;
	}
	
	public String ajaxAddDepart(){
		
		return SUCCESS;
	}
	
	public String ajaxDeleteDepart(){
		initJson();
		jsonData.put("message", "操作成功");
		try {
			depart = departService.get(depart.getId());
			departService.delete(depart);
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("message", "操作失败");
		}
		return SUCCESS;
	}
	
	public String updateDepart(){
		depart = departService.get(depart.getId());
		initJson();
		jsonData.put("depart", depart);
		return SUCCESS;
	}
	
	public String ajaxUpdateDepart(){
		initJson();
		jsonData.put("message", "操作成功");
		try {
			if(depart.getId()!=null){
				departService.update(depart);
			}else{
				departService.add(depart);
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

	public Depart getDepart() {
		return depart;
	}

	public void setDepart(Depart depart) {
		this.depart = depart;
	}
}
