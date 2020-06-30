package com.zxy.hgshop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.dubbo.config.annotation.Reference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import com.github.pagehelper.PageInfo;
import com.zxy.hgshop.pojo.Brand;
import com.zxy.hgshop.pojo.Spu;
import com.zxy.hgshop.pojo.SpuVo;
import com.zxy.hgshop.service.BrandService;
import com.zxy.hgshop.service.SpuService;

@Controller
@RequestMapping("spu")
public class SpuController {
	
	@Reference
	SpuService spuService;
	
	//品牌
	@Reference
	BrandService brandService;
	
	@Autowired
	HgFileUtils fileUtils;
	
	@RequestMapping("list")
	public String list(HttpServletRequest request,SpuVo spuvo) {
		
		System.err.println("spu vo is " + spuvo);
		spuvo.setPageSize(20);
		PageInfo<Spu> pageInfo = spuService.list(spuvo);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("spuvo", spuvo);
		// 得到所有的品牌
		List<Brand> brandList = brandService.list();
		request.setAttribute("brandList", brandList);
		//pageInfo.getPages()
		
		return "spu/list";
	}
	
	
	@RequestMapping("toadd")
	public String toadd(HttpServletRequest request) {
		
		// 得到所有的品牌
		List<Brand> brandList = brandService.list();
		request.setAttribute("brandList", brandList);
		
		return "spu/add";
	}
	
	@RequestMapping("add")
	@ResponseBody
	public String add(HttpServletRequest request,Spu spu,
			@RequestParam("myFile") MultipartFile file) {
		
		String uploadPath = fileUtils.upload(file);
		spu.setSmallPic(uploadPath);
		
		return spuService.add(spu)>0?"ok":"failed";
		
	}
	
	/**
	 * 去修改 获取数据 进行回显
	 * @param request
	 * @param id
	 * @return
	 */
	@RequestMapping("toUpdate")
	public String toUpdate(HttpServletRequest request,int id) {
		
		Spu spu = spuService.getById(id);
		request.setAttribute("spu", spu);
		
		// 得到所有的品牌
		List<Brand> brandList = brandService.list();
		request.setAttribute("brandList", brandList);
		
		return "spu/update";
	}
	
	/**
	 *    接收修改的参数
	 * @param request
	 * @param spu
	 * @param file
	 * @return
	 */
	@ResponseBody
	@RequestMapping("update")
	public String update(HttpServletRequest request,Spu spu,
			@RequestParam("myFile") MultipartFile file) {
		
		String uploadPath = fileUtils.upload(file);
		spu.setSmallPic(uploadPath);
		
		return spuService.update(spu)>0?"ok":"failed";
		
	}
	
	
	
	
	@RequestMapping("del")
	@ResponseBody
	public String del(HttpServletRequest request,@RequestParam("ids[]") int[] ids) {
		
		return spuService.delete(ids)>0?"ok":"failed";
		
	}
}
