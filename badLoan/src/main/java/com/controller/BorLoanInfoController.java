package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dao.BorLoanInfoDao;
import com.entity.BorLoanInfo;
import com.service.BorLoanInfoService;

@Controller
@RequestMapping("/BorLoanInfo")

public class BorLoanInfoController {
	@Autowired
	private BorLoanInfoService borService;
	/**
	 * 添加个人用户贷款信息
	 * 马利肖
	 * @return
	 */
	@RequestMapping("/addBorLoanInfo")
	public void addBorLoanInfo(BorLoanInfo BorLoanInfo,HttpServletResponse response){
		/*BorLoanInfo borLoan = new BorLoanInfo();
		borLoan.setBorId(BorLoanInfo.getBorId());
		borLoan.setBankinfoId(BorLoanInfo.getBankinfoId());
		borLoan.setContractId(BorLoanInfo.getContractId());
		borLoan.setEmpId(BorLoanInfo.getEmpId());
		borLoan.setLoanType(BorLoanInfo.getLoanType());
		borLoan.setLoanNumber(BorLoanInfo.getLoanNumber());
		borLoan.setLoanAccount(BorLoanInfo.getLoanAccount());
		borLoan.setLoanDate(BorLoanInfo.getLoanDate());
		System.out.print("borLoan.setLoanDate(BorLoanInfo.getLoanDate())");
		borLoan.setLoanRepaymentDate(BorLoanInfo.getLoanRepaymentDate());
		borLoan.setLoanRate(BorLoanInfo.getLoanRate());*/
		
		int bor = borService.addBorLoanInfo(BorLoanInfo);
		System.out.println("--------22----------2");
		try {
			if(bor>0){
				response.getWriter().print("success");
			}
			else{
				response.getWriter().print("error");
			}
			response.getWriter().flush();
			response.getWriter().close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}
	/**
	 * 查询个人用户贷款信息
	 * 马利肖
	 * @return
	 */
	@RequestMapping("/findBorLoanInfo")
	@ResponseBody
	public List<BorLoanInfo> findBorLoanInfo(){
		List<BorLoanInfo> boList = borService.findBorLoanInfo();
		return boList;
	}
}
