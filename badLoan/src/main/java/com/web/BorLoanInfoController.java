package com.web;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.dao.GuarantorDao;
import com.dao.LoanManageRecordDao;
import com.dao.LoanmanageDao;
import com.dao.PledgeDao;
import com.entity.BorLoanInfo;
import com.entity.Borgua;
import com.entity.CustomerGoods;
import com.entity.Guarantor;
import com.entity.LoanManageRecord;
import com.entity.Loanmanage;
import com.entity.Pledge;
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
	@ResponseBody
	public String addBorLoanInfo(@RequestBody String str){
		BorLoanInfo borLoanInfo=JSON.parseObject(str,BorLoanInfo.class);
		Pledge pledge = JSON.parseObject(str, Pledge.class);
		CustomerGoods customerGoods = JSON.parseObject(str, CustomerGoods.class);
		Guarantor guarantor = JSON.parseObject(str, Guarantor.class);
		Borgua borgua = JSON.parseObject(str, Borgua.class);
		LoanManageRecord lmr = JSON.parseObject(str, LoanManageRecord.class);
		Loanmanage loanmanage = JSON.parseObject(str, Loanmanage.class);
		/*int bor = borService.addBorLoanInfo(BorLoanInfo, pledge,customergoods, guarantor,borgua, lmr, lonm);*/
		int bor=borService.addBorLoanInfo(borLoanInfo, pledge, customerGoods, guarantor, borgua, lmr, loanmanage);
		if(bor>0){
		
			return "添加个人用户贷款信息success";
		}else{
				return "添加个人用户贷款信息error";
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
