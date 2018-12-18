package com.heigo.controller;

import com.heigo.service.impl.IndexServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	
	@Autowired
	IndexServiceImpl indexService;

	@RequestMapping("index")
	public String index(){
		int testDb = indexService.testDb();
		System.out.print("1111");
		return "manager_index";
	}
}
