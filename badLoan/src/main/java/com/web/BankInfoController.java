package com.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.BankInfo;
import com.service.BankInfoService;

@Controller
@RequestMapping("/BankInfo")
public class BankInfoController {
	@Autowired
	private BankInfoService bService;
	
	/**
	 * 查询所有银行信息
	 * 马利肖
	 * @return
	 */
	@RequestMapping("/findBankInfo")
	@ResponseBody
	public List<BankInfo> findBankInfo(){
		List<BankInfo> bList = bService.findBankInfo();
		return bList;
	}
	
}
