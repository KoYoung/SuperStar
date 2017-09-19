package com.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.Legal;
import com.service.LegalService;

/**
 * 法人代表信息controller
 * @author yang
 */
@Controller
@RequestMapping("/legalController")
public class LegalController {
	@Autowired
	private LegalService legalService;
	/**
	 * 查询所有法人代表信息
	 * @return 法人代表信息集合
	 */
	@RequestMapping("/findLegal")
	@ResponseBody
	public List<Legal> findLegal() {
		return legalService.findLegal();
	}
	/**
	 * 添加法人代表信息
	 * @param legal
	 * @return 插入成功返回1
	 */
	@RequestMapping("/addLegal")
	@ResponseBody
	public String addLegal(Legal legal) {
		System.out.println(legal);
		int flag = legalService.addLegal(legal);
		if (flag == 1)
			return "add success";
		else
			return "add false";
	}
	/**
	 * 根据企业编号查询贷款企业的法人
	 */
	@RequestMapping("/findLegalCom")
	@ResponseBody
	public Legal findLegalCom(@RequestParam String comId){
		Legal lList = legalService.findLegalCom(comId);
		return lList;
	}
}