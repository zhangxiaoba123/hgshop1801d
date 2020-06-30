package com.zxy.hgshop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.github.pagehelper.PageInfo;
import com.zxy.hgshop.pojo.Spec;
import com.zxy.hgshop.pojo.SpecOption;
import com.zxy.hgshop.service.SpecService;

@Controller
@RequestMapping("spec")
public class SpecController {
	
	@Reference
	SpecService specService;
	
	/**
	 * 接收添加的请求，调用服务
	 * @param spec
	 * @return
	 */
	@PostMapping("add")
	@ResponseBody
	public String add(HttpServletRequest request, Spec spec) {
		
		System.out.println("spec is " + spec);
		
		List<SpecOption> options = spec.getOptions();
		// 数据进行清洗
		for (int i = options.size()-1; i >=0; i--) {
			SpecOption option = options.get(i);
			if(option.getOptionName()==null || "".equals(option.getOptionName())) {
				options.remove(i);
			}
		}
		return specService.add(spec)>0?"ok":"failed";
	}
	
	
	/**
	 *  进入到添加页面
	 * @param spec
	 * @return
	 */
	@GetMapping("add")
	public String add() {
		return "spec/add";
	}
	
	@RequestMapping("del")
	@ResponseBody
	public String del(HttpServletRequest request,@RequestParam(value = "ids[]")  int[] ids) {
		System.out.print("ids is " + ids);
		return specService.delete(ids)>0?"ok":"failed";
	}
	
	/**
	 * 跳转到修改的jsp页面
	 * @param request
	 * @param id
	 * @return
	 */
	@RequestMapping("toUpdate")
	public String toUpdate(HttpServletRequest request,int id) {
		Spec spec = specService.getById(id);
		request.setAttribute("spec", spec);
		return "spec/update";
	}
	
	
	/**
	 * 
	 * @param request
	 * @param spec
	 * @return
	 */
	@RequestMapping("update")
	@ResponseBody
	public String update(HttpServletRequest request,Spec spec) {
		
		return specService.update(spec)>0?"ok":"failed";
	}
	
	/**
	 * 列表
	 * @param request
	 * @param name
	 * @param page
	 * @return
	 */
	@RequestMapping("list")
	public String list(HttpServletRequest request,@RequestParam(defaultValue = "") String name,
			@RequestParam(defaultValue = "1") int page) {
		PageInfo<Spec> pageInfo = specService.list(page, 5, new Spec(name));
		request.setAttribute("pageInfo", pageInfo);
		return "spec/list";
	}

}
