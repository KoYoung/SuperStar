package com.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.Find;
import com.service.FindService;

/**
 * @author 蒙奇·D·路飞
 * Find控制层
 * FindController
 *
 */
@Controller
@RequestMapping("/find")
public class FindController {
	
	@Autowired
	public FindService fs;
	
	/**
	 * 查询客户（个人）信息
	 */
	@RequestMapping("/findBorLoan")
	@ResponseBody
	public List<Find> findBorLoan(){
		List<Find> list = fs.findBorLoan();
		System.out.println(list+"******************************");
		return list;
	}
	
	/**
	 * 查询客户（企业）信息
	 */
	@RequestMapping("/findComLoan")
	@ResponseBody
	public List<Find> findComLoan(){
		List<Find> list = fs.findComLoan();
		System.out.println(list+"******************************");
		return list;
	}
	
	
	/**
	 * 查询担保人关系表(个人)
	 */
	@RequestMapping("/findBorGuarantor")
	@ResponseBody
	public List<Find> findBorGuarantor(){
		List<Find> list = fs.findBorGuarantor();
		System.out.println(list+"******************************");
		return list;
	}
	
	/**
	 * 查询担保人关系表(企业)
	 */
	@RequestMapping("/findComGuarantor")
	@ResponseBody
	public List<Find> findComGuarantor(){
		List<Find> list = fs.findComGuarantor();
		System.out.println(list+"******************************");
		return list;
	}
	
	/**
	 * 查询客户抵押物关系表(个人)
	 */
	@RequestMapping("/findBorPledge")
	@ResponseBody
	public List<Find> findBorPledge(){
		List<Find> list = fs.findBorPledge();
		System.out.println(list+"******************************");
		return list;
	}
	
	/**
	 * 查询客户抵押物关系表(企业)
	 */
	@RequestMapping("/findComPledge")
	@ResponseBody
	public List<Find> findComPledge(){
		List<Find> list = fs.findComPledge();
		System.out.println(list+"******************************");
		return list;
	}
	
	
	
	
}
