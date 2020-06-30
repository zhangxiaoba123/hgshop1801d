package com.zxy.hgshop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zxy.hgshop.pojo.Category;
import com.zxy.hgshop.service.CategoryService;





@Controller
@RequestMapping("cat")
public class CatController {
	
	@Reference
	CategoryService catService;
	
	/**
	 * 跳转到jsp 页面进行渲染
	 * @return
	 */
	@RequestMapping("index")
	public String index() {
		return "cat/index";
	}
	
	/**
	 * 
	 * @param requrt
	 * @param cat
	 * @return
	 */
	@RequestMapping("add")
	@ResponseBody
	public String add(HttpServletRequest requrt,Category cat) {
		return catService.add(cat)>0?"ok":"failed";
	}
	
	
	/**
	 * 修改
	 * @param requrt
	 * @param cat
	 * @return
	 */
	@RequestMapping("update")
	@ResponseBody
	public String update(HttpServletRequest requrt,Category cat) {
		return catService.udpate(cat)>0?"ok":"failed";
	}
	
	/**
	 * 删除
	 * @param requrt
	 * @param id
	 * @return
	 */
	@RequestMapping("delete")
	@ResponseBody
	public String delete(HttpServletRequest requrt,int id) {
		return catService.del(id)>0?"ok":"failed";
	}
	
	
	
	@RequestMapping("data")
	@ResponseBody
	public List<Category> getData(){
		// 获取到所有分类的数据
		 List<Category> categories = catService.list(0);
		 return categories;
		
	}
	
	
}
