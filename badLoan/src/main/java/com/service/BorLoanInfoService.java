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
}
