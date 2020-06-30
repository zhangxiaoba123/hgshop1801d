package com.zxy.hgshop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zxy.hgshop.pojo.Brand;
import com.zxy.hgshop.service.BrandService;



@Controller
@RequestMapping("brand")
public class BrandController {

	@Reference
	BrandService bs;
	
	@RequestMapping("list")
	public String list(HttpServletRequest request) {
		List<Brand> list = bs.list();
		list.forEach(x->{System.out.println("x is " + x);});
		request.setAttribute("list", list); 
		return "brand/list";
	}
	
}
