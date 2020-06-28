package com.zxy.hgshop.pojo;

import java.io.Serializable;

/**
 * 规格的属性
 * @author 45466
 *
 */
public class SpecOption  implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7674017895093660163L;
	
	Integer id;
	String optionName;
	Integer specId;
	String specName;
	int orders;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getOptionName() {
		return optionName;
	}
	public void setOptionName(String optionName) {
		this.optionName = optionName;
	}
	public Integer getSpecId() {
		return specId;
	}
	public void setSpecId(Integer specId) {
		this.specId = specId;
	}
	public String getSpecName() {
		return specName;
	}
	public void setSpecName(String specName) {
		this.specName = specName;
	}
	public int getOrders() {
		return orders;
	}
	public void setOrders(int orders) {
		this.orders = orders;
	}
	@Override
	public String toString() {
		return "Specoption [id=" + id + ", optionName=" + optionName + ", specId=" + specId + ", specName=" + specName
				+ ", orders=" + orders + "]";
	}
	
	
	


}
