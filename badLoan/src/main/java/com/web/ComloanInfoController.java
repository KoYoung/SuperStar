package com.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.ComloanInfo;
import com.service.ComloanInfoService;

@Controller
@RequestMapping("/ComloanInfo")
public class ComloanInfoController {
	@Autowired
	private ComloanInfoService comloanInfoService;
	/**
	 * 添加企业贷款信息
	 */
	@RequestMapping("/addComloanInfo")
	@ResponseBody
	public String addComloanInfo(ComloanInfo comloanInfo){
		return "";
	}
}
