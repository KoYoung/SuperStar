package com.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.Pledge;
import com.service.PledgeService;

@Controller
@RequestMapping("/pledge")
public class PledgeController {    
	@Autowired
	private PledgeService pledgeService;
	/**
	 * 根据贷款编号查询抵押物信息
	 */
	@RequestMapping("/findPledge")
	@ResponseBody
	public List<Pledge> findPledge(@RequestParam String loaninfoId){
		List<Pledge> pList = pledgeService.findPledge(loaninfoId);
		return pList;
	}
}
