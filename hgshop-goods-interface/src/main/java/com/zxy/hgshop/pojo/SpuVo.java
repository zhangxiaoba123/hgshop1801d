package com.zxy.hgshop.pojo;

/**
 * 用于封装查询条件
 * @author 45466
 *
 */
public class SpuVo  extends Spu {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5204947868226412597L;
	
	int pageNum=1;
	int pageSize=5;
	
	//查询的关键字 只要name 或者 caption 当中有一个字段匹配即可
	String key;
	
	// 排序方式
	String orderType = "ASC";
	
	//排序的字段名称
	String orderColumn="";

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getOrderType() {
		return orderType;
	}

	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}

	public String getOrderColumn() {
		return orderColumn;
	}

	public void setOrderColumn(String orderColumn) {
		this.orderColumn = orderColumn;
	}

	@Override
	public String toString() {
		return "SpuVo [pageNum=" + pageNum + ", pageSize=" + pageSize + ", key=" + key + ", orderType=" + orderType
				+ ", orderColumn=" + orderColumn + ", getId()=" + getId() + ", getGoodsName()=" + getGoodsName()
				+ ", getIsMarketable()=" + getIsMarketable() + ", getCaption()=" + getCaption() + ", getSmallPic()="
				+ getSmallPic() + ", getCategoryId()=" + getCategoryId() + ", getBrandId()=" + getBrandId()
				+ ", getCategory()=" + getCategory() + ", getBrand()=" + getBrand() + ", toString()=" + super.toString()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + "]";
	}
	
	

}
