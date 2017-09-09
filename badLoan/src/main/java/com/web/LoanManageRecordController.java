package com.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.LoanManageRecord;
import com.service.LoanManageRecordService;

@Controller
@RequestMapping("/lmrController")
public class LoanManageRecordController {
	@Autowired
	private LoanManageRecordService lmrService;
	
	/**
	 * 查询所有贷款处理记录
	 * 
	 * @return LMR集合
	 */
	@RequestMapping("/findlmr")
	@ResponseBody
	public List<LoanManageRecord> findLoanManageRecord(String loaninfoId){
		return lmrService.findLoanManageRecord(loaninfoId);
	}
	/**
	 * 添加一条贷款处理记录
	 * 
	 * @param lmr
	 * @return 成功返回1
	 */
	@RequestMapping("/addlmr")
	@ResponseBody
	public String addLoanManageRecord(LoanManageRecord lmr){
		System.out.println(lmr);
		int flag = lmrService.addLoanManageRecord(lmr);
		if(flag!=1)
			return "添加一条贷款处理记录success";
		else
			return "添加一条贷款处理记录error";
	}
}