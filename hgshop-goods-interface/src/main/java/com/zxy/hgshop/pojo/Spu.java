package com.zxy.hgshop.pojo;

import java.io.Serializable;


public class Spu implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -475509831334054669L;
	
	private Integer id;
	private String goodsName;
	private int isMarketable;
	private String caption;
	private String smallPic;
	
	private int categoryId;
	private int brandId;
	
	private Category category;
	private Brand brand;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public int getIsMarketable() {
		return isMarketable;
	}
	public void setIsMarketable(int isMarketable) {
		this.isMarketable = isMarketable;
	}
	public String getCaption() {
		return caption;
	}
	public void setCaption(String caption) {
		this.caption = caption;
	}
	public String getSmallPic() {
		return smallPic;
	}
	public void setSmallPic(String smallPic) {
		this.smallPic = smallPic;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public int getBrandId() {
		return brandId;
	}
	public void setBrandId(int brandId) {
		this.brandId = brandId;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public Brand getBrand() {
		return brand;
	}
	public void setBrand(Brand brand) {
		this.brand = brand;
	}
	@Override
	public String toString() {
		return "Spu [id=" + id + ", goodsName=" + goodsName + ", isMarketable=" + isMarketable + ", caption=" + caption
				+ ", smallPic=" + smallPic + ", categoryId=" + categoryId + ", brandId=" + brandId + ", category="
				+ category + ", brand=" + brand + "]";
	}

	
	
	


}
