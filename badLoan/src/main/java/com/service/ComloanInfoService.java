package com.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.entity.BorLoanInfo;
import com.entity.Borgua;
import com.entity.ComloanInfo;
import com.entity.CustomerGoods;
import com.entity.Guarantor;
import com.entity.LoanManageRecord;
import com.entity.Loanmanage;
import com.entity.Pledge;
import com.util.PagingResult;

public interface ComloanInfoService {
	/**
	 * 添加企业贷款信息
	 */
	String addComloanInfo(@RequestParam("borPhoto") MultipartFile[] borPhotos, HttpServletRequest request,
			ComloanInfo comloanInfo, Pledge pledge, CustomerGoods customerGoods, Guarantor guarantor,
			Borgua borgua, LoanManageRecord lmr, Loanmanage lonm);

	/**
	 * 查询企业贷款信息
	 */
	PagingResult<ComloanInfo> findComloanInfo(Integer page, Integer rows);
	/**
	 * 合同编号唯一性验证
	 */
	List<ComloanInfo> findContractIdCom(String contractId);

	/**
	 * 查询企业贷款
	 */
	List<Map<String, String>> findComLoan(Map<String, String> datamap);

	/**
	 * 修改企业贷款状态
	 * 
	 * @param datamap
	 */
	void modifyComState(Map<String, String> datamap);

	/**
	 * 申请核销
	 * 
	 * @param datamap
	 */
	void applyWriteOff(Map<String, String> datamap);

	/**
	 * 添加贷款回收记录
	 * 
	 * @param datamap
	 */
	void updateUnrepayNumber(Map<String, String> datamap);
}
