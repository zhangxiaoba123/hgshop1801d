package com.zxy.hgshop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 
 * @author 45466
 *
 */

@Controller
public class MainController {
	
	@RequestMapping({"/","main","index"})
	public String main() {
		return "main";
	}
	
}
