package com.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.Right;
import com.service.RightService;

/**
 * @author 蒙奇·D·路飞
 * controller控制器
 * RightController
 *
 */
@Controller
@RequestMapping("/right")
public class RightController {
	@Autowired
	public RightService rs;
	
	/**
	 * 添加权限
	 */
	@RequestMapping("/add")
	@ResponseBody
	public int addRight(Right right){
		System.out.println("**********************");
		rs.addRight(right);
		return 1;
	}
	
	/**
	 * 查询权限
	 */
	@RequestMapping("/find")
	@ResponseBody
	public List<Right> findAllRight(){
		System.out.println("*************************");
		List<Right> list = rs.findAllRight();
		return list;
	}
	
}
