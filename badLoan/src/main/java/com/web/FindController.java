package com.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.Find;
import com.service.FindService;
import com.util.PagingResult;
import com.util.UrlUtil;

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
	public PagingResult<Find> findBorLoan(HttpServletRequest request){
		PagingResult<Find> pagingResult = fs.findBorLoan(request);
		return pagingResult;
	}
	/**
	 * 模糊查询1
	 */
	@RequestMapping("/searchBorLoan")
	@ResponseBody
	public List<Find> searchBorLoan(Find find){
		System.out.println(find+"++++++++++++++++++++++++++++");
		List<Find> list = fs.searchBorLoan(find);
		System.out.println(list+"++++++++++++++++++++++++++++");
		return list;
	}
	
	
	
	/**
	 * 查询客户（企业）信息
	 */
	@RequestMapping("/findComLoan")
	@ResponseBody
	public PagingResult<Find> findComLoan(HttpServletRequest request){
		PagingResult<Find> pagingResult = fs.findComLoan(request);
		return pagingResult;
	}
	/**
	 * 模糊查询2
	 */
	@RequestMapping("/searchComLoan")
	@ResponseBody
	public List<Find> searchComLoan(Find find){
		System.out.println(find+"++++++++++++++++++++++++++++");
		List<Find> list = fs.searchComLoan(find);
		System.out.println(list+"++++++++++++++++++++++++++++");
		return list;
	}
	
	
	
	/**
	 * 查询担保人关系表(个人)
	 */
	@RequestMapping("/findBorGuarantor")
	@ResponseBody
	public List<Find> findBorGuarantor(String borloaninfoId){
		System.out.println(borloaninfoId+"++++++++++++++++++++++++++");
		List<Find> list = fs.findBorGuarantor(borloaninfoId);
		System.out.println(list+"*************************************");
		return list;
	}
	
	
	
	/**
	 * 查询担保人关系表(企业)
	 */
	@RequestMapping("/findComGuarantor")
	@ResponseBody
	public List<Find> findComGuarantor(String comloaninfoId){
		System.out.println(comloaninfoId+"++++++++++++++++++++++++++");
		List<Find> list = fs.findComGuarantor(comloaninfoId);
		System.out.println(list+"++++++++++++++++++++++++++");
		return list;
	}
	
	
	/**
	 * 查询客户抵押物关系表(个人)
	 */
	@RequestMapping("/findBorPledge")
	@ResponseBody
	public List<Find> findBorPledge(String borloaninfoId){
		System.out.println(borloaninfoId+"++++++++++++++++++++++++++");
		List<Find> list = fs.findBorPledge(borloaninfoId);
		System.out.println(list+"++++++++++++++++++++++++++");
		return list;
	}
	
	
	/**
	 * 查询客户抵押物关系表(企业)
	 */
	@RequestMapping("/findComPledge")
	@ResponseBody
	public List<Find> findComPledge(String comloaninfoId){
		System.out.println(comloaninfoId+"++++++++++++++++++++++++++");
		List<Find> list = fs.findComPledge(comloaninfoId);
		System.out.println(list+"++++++++++++++++++++++++++");
		return list;
	}
	
	
	/**
	 * 查询所有担保人
	 */
	@RequestMapping("/findGuarantor")
	@ResponseBody
	public PagingResult<Find> findGuarantor(HttpServletRequest request) {
		PagingResult<Find> pagingResult = fs.findGuarantor(request);
		return pagingResult;
	}
	/**
	 * 模糊查询7
	 */
	@RequestMapping("/searchGuarantor")
	@ResponseBody
	public List<Find> searchGuarantor(Find find) {
		System.out.println(find+"++++++++++++++++++++++++++++");
		List<Find> list = fs.searchGuarantor(find);
		System.out.println(list+"++++++++++++++++++++++++++++");
		return list;
	}
	
	
	
	/**
	 * 查询某个担保人所担保的个人项目
	 */
	@RequestMapping("/findGuarantorBor")
	@ResponseBody
	public List<Find> findGuarantorBor(String guaId) {
		System.out.println(guaId+"++++++++++++++++++++++++++");
		List<Find> list = fs.findGuarantorBor(guaId);
		System.out.println(list.size()+"+++++++++++++**********************+++++++++++++");
		return list;
	}
	
	
	/**
	 * 查询某个担保人所担保的企业项目
	 */
	@RequestMapping("/findGuarantorCom")
	@ResponseBody
	public List<Find> findGuarantorCom(String guaId) {
		System.out.println(guaId+"++++++++++++++++++++++++++");
		List<Find> list = fs.findGuarantorCom(guaId);
		System.out.println(list+"++++++++++++++++++++++++++");
		return list;
	}
	
		
	/**
	 * 查询所有经手人
	 */
	@RequestMapping("/findEmp")
	@ResponseBody
	public PagingResult<Find> findEmp(HttpServletRequest request) {
		PagingResult<Find> pagingResult = fs.findEmp(request);
		return pagingResult;
	}
	/**
	 * 模糊查询10
	 */
	@RequestMapping("/searchEmp")
	@ResponseBody
	public List<Find> searchEmp(Find find) {
		System.out.println(find+"++++++++++++++++++++++++++++");
		List<Find> list = fs.searchEmp(find);
		System.out.println(list+"++++++++++++++++++++++++++++");
		return list;
	}
	
	
	
	/**
	 * 查询某个经手人所经手的个人项目
	 */
	@RequestMapping("/findEmpBor")
	@ResponseBody
	public List<Find> findEmpBor(String empId) {
		System.out.println(empId+"++++++++++++++++++++++++++");
		List<Find> list = fs.findEmpBor(empId);
		System.out.println(list+"++++++++++++++++++++++++++");
		return list;
	}
	
	
	/**
	 * 查询某个经手人所经手的企业项目
	 */
	@RequestMapping("/findEmpCom")
	@ResponseBody
	public List<Find> findEmpCom(String empId) {
		System.out.println(empId+"++++++++++++++++++++++++++");
		List<Find> list = fs.findEmpCom(empId);
		System.out.println(list+"++++++++++++++++++++++++++");
		return list;
	}
	
	/**
	 * 查询银行的个人不良贷款记录(柱状图)
	 */
	@RequestMapping("/findBankBorColumn")
	@ResponseBody
	public List<Map<String, Object>> findBankBorColumn(){
		List<Map<String, Object>> list = fs.findBankBorColumn();
		return list;
	}
	/**
	 * 查询银行的企业不良贷款记录(柱状图)
	 */
	@RequestMapping("/findBankComColumn")
	@ResponseBody
	public List<Map<String, Object>> findBankComColumn(){
		List<Map<String, Object>> list = fs.findBankComColumn();
		return list;
	}
	/**
	 * 根据银行的名称查询该银行的个人贷款金额
	 */
	@RequestMapping("/findBankBor")
	@ResponseBody
	public List<Map<String, Object>> findBankBor(@RequestBody String name){
		name = UrlUtil.getURLDecoderString(name);
		name = name.substring(0, name.length()-1);
		List<Map<String, Object>> list = fs.findBankBor(name);
		return list;
	}
	/**
	 * 根据银行的名称查询该银行的企业贷款金额
	 */
	@RequestMapping("/findBankCom")
	@ResponseBody
	public List<Map<String, Object>> findBankCom(@RequestBody String name){
		name = UrlUtil.getURLDecoderString(name);
		name = name.substring(0, name.length()-1);
		System.out.println(name+"************************------------------");
		List<Map<String, Object>> list = fs.findBankCom(name);
		return list;
	}
	
	
	
	/**
	 * 查询银行的个人不良贷款总额记录(饼图)
	 */
	@RequestMapping("/findBankBorPie")
	@ResponseBody
	public List<Map<String, Object>> findBankBorPie(){
		List<Map<String, Object>> list = fs.findBankBorPie();
		return list;
	}
	/**
	 * 查询银行的个人不良贷款总额记录(饼图)
	 */
	@RequestMapping("/findBankComPie")
	@ResponseBody
	public List<Map<String, Object>> findBankComPie(){
		List<Map<String, Object>> list = fs.findBankComPie();
		return list;
	} 
	

}
