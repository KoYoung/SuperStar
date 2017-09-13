package com.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
	public List<Find> findBorGuarantor(String borloaninfoId){
		System.out.println(borloaninfoId+"++++++++++++++++++++");
		List<Find> list = fs.findBorGuarantor(borloaninfoId);
		System.out.println(list+"******************************");
		return list;
	}
	
	/**
	 * 查询担保人关系表(企业)
	 */
	@RequestMapping("/findComGuarantor")
	@ResponseBody
	public List<Find> findComGuarantor(String comloaninfoId){
		System.out.println(comloaninfoId+"++++++++++++++++++++");
		List<Find> list = fs.findComGuarantor(comloaninfoId);
		System.out.println(list+"******************************");
		return list;
	}
	
	/**
	 * 查询客户抵押物关系表(个人)
	 */
	@RequestMapping("/findBorPledge")
	@ResponseBody
	public List<Find> findBorPledge(String borloaninfoId){
		System.out.println(borloaninfoId+"++++++++++++++++++++");
		List<Find> list = fs.findBorPledge(borloaninfoId);
		System.out.println(list+"******************************");
		return list;
	}
	
	/**
	 * 查询客户抵押物关系表(企业)
	 */
	@RequestMapping("/findComPledge")
	@ResponseBody
	public List<Find> findComPledge(String comloaninfoId){
		System.out.println(comloaninfoId+"++++++++++++++++++++");
		List<Find> list = fs.findComPledge(comloaninfoId);
		System.out.println(list+"******************************");
		return list;
	}
	
	/**
	 * 查询所有担保人
	 */
	@RequestMapping("/findGuarantor")
	@ResponseBody
	public List<Find> findGuarantor() {
		List<Find> list = fs.findGuarantor();
		System.out.println(list+"******************************");
		return list;
	}
	
	/**
	 * 查询某个担保人所担保的个人项目
	 */
	@RequestMapping("/findGuarantorBor")
	@ResponseBody
	public List<Find> findGuarantorBor(String guaId) {
		System.out.println(guaId+"++++++++++++++++++++");
		List<Find> list = fs.findGuarantorBor(guaId);
		System.out.println(list+"******************************");
		return list;
	}
	
	/**
	 * 查询某个担保人所担保的企业项目
	 */
	@RequestMapping("/findGuarantorCom")
	@ResponseBody
	public List<Find> findGuarantorCom(String guaId) {
		System.out.println(guaId+"++++++++++++++++++++");
		List<Find> list = fs.findGuarantorCom(guaId);
		System.out.println(list+"******************************");
		return list;
	}
		
	/**
	 * 查询所有经手人
	 */
	@RequestMapping("/findEmp")
	@ResponseBody
	public List<Find> findEmp() {
		List<Find> list = fs.findEmp();
		System.out.println(list+"******************************");
		return list;
	}
	
	/**
	 * 查询某个经手人所经手的个人项目
	 */
	@RequestMapping("/findEmpBor")
	@ResponseBody
	public List<Find> findEmpBor(String empId) {
		System.out.println(empId+"++++++++++++++++++++");
		List<Find> list = fs.findEmpBor(empId);
		System.out.println(list+"******************************");
		return list;
	}
	
	/**
	 * 查询某个经手人所经手的企业项目
	 */
	@RequestMapping("/findEmpCom")
	@ResponseBody
	public List<Find> findEmpCom(String empId) {
		System.out.println(empId+"++++++++++++++++++++");
		List<Find> list = fs.findEmpCom(empId);
		System.out.println(list+"******************************");
		return list;
	}
	
}
