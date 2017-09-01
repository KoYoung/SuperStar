package com.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.LoanType;
import com.service.LoanTypeService;

@Controller
@RequestMapping("/LoanType")
public class LoanTypeController {
	@Autowired
	private LoanTypeService loanService;
	/**
	 * 查询贷款种类
	 * 马利肖
	 * @return
	 */
	@RequestMapping("/findLoanType")
	@ResponseBody
	public List<LoanType> findLoanType(){
		List<LoanType> loanList = loanService.findLoanType();
		return loanList;
	}
}
