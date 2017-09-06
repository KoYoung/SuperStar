package com.web;

import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.entity.BorLoanInfo;
import com.service.BorLoanInfoService;

@Controller
@RequestMapping("/BorLoanInfo")
public class BorLoanInfoController {
	@Autowired
	private BorLoanInfoService borService;

	/**
	 * 添加个人用户贷款信息 马利肖
	 * 
	 * @return
	 */
	@RequestMapping("/addBorLoanInfo")
	public void addBorLoanInfo(BorLoanInfo BorLoanInfo, HttpServletResponse response) {
		/*
		 * BorLoanInfo borLoan = new BorLoanInfo();
		 * borLoan.setBorId(BorLoanInfo.getBorId());
		 * borLoan.setBankinfoId(BorLoanInfo.getBankinfoId());
		 * borLoan.setContractId(BorLoanInfo.getContractId());
		 * borLoan.setEmpId(BorLoanInfo.getEmpId());
		 * borLoan.setLoanType(BorLoanInfo.getLoanType());
		 * borLoan.setLoanNumber(BorLoanInfo.getLoanNumber());
		 * borLoan.setLoanAccount(BorLoanInfo.getLoanAccount());
		 * borLoan.setLoanDate(BorLoanInfo.getLoanDate());
		 * System.out.print("borLoan.setLoanDate(BorLoanInfo.getLoanDate())");
		 * borLoan.setLoanRepaymentDate(BorLoanInfo.getLoanRepaymentDate());
		 * borLoan.setLoanRate(BorLoanInfo.getLoanRate());
		 */

		int bor = borService.addBorLoanInfo(BorLoanInfo);
		System.out.println("--------22----------2");
		try {
			if (bor > 0) {
				response.getWriter().print("success");
			} else {
				response.getWriter().print("error");
			}
			response.getWriter().flush();
			response.getWriter().close();
		} catch (Exception e) {
		}

	}

	/**
	 * 查询个人用户贷款信息 马利肖
	 * 
	 * @return
	 */
	@RequestMapping("/findBorLoanInfo")
	@ResponseBody
	public List<BorLoanInfo> findBorLoanInfo() {
		List<BorLoanInfo> boList = borService.findBorLoanInfo();
		return boList;
	}

	/**
	 * 查询个人用户贷款详情
	 * 
	 * @return
	 */
	@RequestMapping("/findBorLoanDetail")
	@ResponseBody
	public List<Map<String, String>> findBorLoanDetail() {
		List<Map<String, String>> findBorLoanDetail = borService.findBorLoanDetail();
		System.out.println(findBorLoanDetail);
		return findBorLoanDetail;
	}

	/**
	 * 查询某个用户的详情所有资料
	 */
	@RequestMapping(value = "/findDetailById", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String findDetailById(@RequestParam String data) {
		int borloaninfoId = Integer.parseInt(data);
		List<Map<String, String>> borDetails = borService.findDetailsById(borloaninfoId);
		System.out.println(borDetails);
		String str = JSON.toJSONString(borDetails);
		System.out.println(str);
		return str;
	}
}
