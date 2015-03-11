package com.tellhow.yezhihun.action;

import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.tellhow.yezhihun.base.model.page.PageInfo;
import com.tellhow.yezhihun.model.Drug;
import com.tellhow.yezhihun.service.DrugService;


@Scope("prototype")
@Controller("drugAction")
public class DrugAction extends ActionSupport{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -2921945405248371284L;

	@Resource
	private DrugService DrugService;
	
	private JSONObject jsonData;
	private Drug drug;
	private PageInfo page;
	
	public String show(){
		return SUCCESS;
	}
	
	public String ajaxShowList(){
		initJson();
		List<Drug> list = DrugService.queryList(drug);
		jsonData.put("list", list);
		return SUCCESS;
	}
	
	public String addDrug(){
		
		return SUCCESS;
	}
	
	public String ajaxAddDrug(){
		
		return SUCCESS;
	}
	
	public String ajaxDeleteDrug(){
		initJson();
		jsonData.put("message", "操作成功");
		try {
			drug = DrugService.get(drug.getId());
			DrugService.delete(drug);
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("message", "操作失败");
		}
		return SUCCESS;
	}
	
	public String updateDrug(){
		drug = DrugService.get(drug.getId());
		initJson();
		jsonData.put("drug", drug);
		return SUCCESS;
	}
	
	public String ajaxUpdateDrug(){
		initJson();
		jsonData.put("message", "操作成功");
		try {
			if(drug.getId()!=null){
				DrugService.update(drug);
			}else{
				DrugService.add(drug);
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

	public Drug getDrug() {
		return drug;
	}

	public void setDrug(Drug drug) {
		this.drug = drug;
	}
}
