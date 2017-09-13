package com.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.service.LoanStateService;

@Controller
@RequestMapping("/loanStateController")
public class LoanStateController {
	@Autowired
	private LoanStateService loanStateService;

	@RequestMapping("/findLoanState")
	@ResponseBody
	public List<Map<String, String>> findLoanState() {
		List<Map<String, String>> findLoanState = loanStateService.findLoanState();
		System.out.println(findLoanState);
		return findLoanState;
	}
}
