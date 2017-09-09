package com.service;

import java.util.List;
import java.util.Map;

import com.entity.BorLoanInfo;
import com.entity.Borgua;
import com.entity.ComloanInfo;
import com.entity.CustomerGoods;
import com.entity.Guarantor;
import com.entity.LoanManageRecord;
import com.entity.Loanmanage;
import com.entity.Pledge;

public interface ComloanInfoService {
	/**
	 * 添加企业贷款信息
	 */
	int addComloanInfo(ComloanInfo comloanInfo, Pledge pledge, CustomerGoods customerGoods, Guarantor guarantor,
			Borgua borgua, LoanManageRecord lmr, Loanmanage lonm);

	/**
	 * 查询企业贷款信息
	 */
	List<ComloanInfo> findComloanInfo();

	/**
	 * 根据贷款编号查询贷款详情
	 */
	List<BorLoanInfo> findComloanInfo2(String comloaninfoId);

	/**
	 * 合同编号唯一性验证
	 */
	List<ComloanInfo> findContractIdCom(String contractId);

	/**
	 * 查询企业贷款
	 */
	List<Map<String, String>> findComLoan(Map<String, String> datamap);
}
