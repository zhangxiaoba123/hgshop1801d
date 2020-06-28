package com.zxy.hgshop.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.zxy.hgshop.pojo.Brand;

/**
 * 品牌的管理
 * @author 45466
 * 
 */
public interface BrandService {
	
	int add(Brand brand);
	int update(Brand brand);
	int delete(int[] ids);
	PageInfo<Brand> list(Brand brand);
	List<Brand> list();
	Brand getById(int id);
	
	

}
