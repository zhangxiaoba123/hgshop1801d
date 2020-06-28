package com.zxy.hgshop.service;


import com.github.pagehelper.PageInfo;
import com.zxy.hgshop.pojo.Spu;
import com.zxy.hgshop.pojo.SpuVo;

/**
 * spu的管理
 * @author 45466
 *
 */
public interface SpuService {
	
	int add(Spu spu);
	int update(Spu spu);
	int delete(int[] ids);
	
	PageInfo<Spu> list(SpuVo spuvo);
	
	Spu getById(int id);
	

}
