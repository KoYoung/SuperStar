package com.service;

import java.util.List;

import com.entity.BorLoanInfo;
import com.entity.Borgua;
import com.entity.CustomerGoods;
import com.entity.Guarantor;
import com.entity.LoanManageRecord;
import com.entity.Loanmanage;
import com.entity.Pledge;

public interface BorLoanInfoService {
	/**
	 * 添加个人用户贷款信息
	 * 马利肖
	 * @return
	 */
	int addBorLoanInfo(BorLoanInfo BorLoanInfo,Pledge pledge,CustomerGoods customerGoods,Guarantor guarantor,Borgua borgua
			,LoanManageRecord lmr,Loanmanage lonm);
	

	/**
	 * 查询个人用户贷款信息
	 * 马利肖
	 * @return
	 */
	List<BorLoanInfo> findBorLoanInfo();
	/**
	 * 根据贷款类型，贷款编号查询贷款信息
	 */
	List<BorLoanInfo> findBorLoanInfo2(String borloaninfoId);
	/**
	 * 合同编号唯一性验证
	 */
	List<BorLoanInfo> findcontractId(String contractId);
}
