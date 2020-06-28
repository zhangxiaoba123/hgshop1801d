package com.zxy.hgshop.service;

import com.github.pagehelper.PageInfo;
import com.zxy.hgshop.pojo.Spec;

public interface SpecService {
	
	//添加
	int add(Spec spec);
	
	//删除
	int delete(int[] ids);
	
	//修改
	int update(Spec spec);
	
	//列表
	PageInfo<Spec> list(int pageNum,int pageSize,Spec spec);
	
	//
	Spec getById(int id);
	
}
