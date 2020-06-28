package com.zxy.hgshop.pojo;

import java.io.Serializable;

/**
 * 品牌的实体Bean
 * @author 45466
 *
 */
public class Brand  implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7286961587651453953L;
	
	Integer id;
	String name;
	String firstChar;
	int deletedFlag;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getFirstChar() {
		return firstChar;
	}
	public void setFirstChar(String firstChar) {
		this.firstChar = firstChar;
	}
	public int getDeletedFlag() {
		return deletedFlag;
	}
	public void setDeletedFlag(int deletedFlag) {
		this.deletedFlag = deletedFlag;
	}
	@Override
	public String toString() {
		return "Brand [id=" + id + ", name=" + name + ", firstChar=" + firstChar + ", deletedFlag=" + deletedFlag + "]";
	}
	
	
	

}
