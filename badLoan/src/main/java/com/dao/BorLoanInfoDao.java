package com.dao;

import java.util.List;
import java.util.Map;

import com.entity.BorLoanInfo;

public interface BorLoanInfoDao {
	/**
	 * 添加个人用户贷款信息 马利肖
	 * 
	 * @return
	 */
	public int addBorLoanInfo(BorLoanInfo borLoanInfo);

	/**
	 * 查询个人用户贷款信息 马利肖
	 * 
	 * @return
	 */
	public List<BorLoanInfo> findBorLoanInfo();

	/**
	 * 查询个人用户贷款详情
	 * 
	 * @return
	 */
	List<Map<String, String>> findBorLoanDetail();

	/**
	 * 根据ID查询贷款详情
	 * 
	 * @return
	 */
	List<Map<String, String>> findBorLoanDetailsById(int borloaninfoId);

	/**
	 * 根据id查询客户详情
	 * 
	 * @return
	 */
	List<Map<String, String>> findCusDetailsById(int borId);

	/**
	 * 根据id查询员工详情
	 * 
	 * @return
	 */
	List<Map<String, String>> findEmpDetailsById(String empId);

	/**
	 * 根据id查询担保人详情
	 * 
	 * @return
	 */
	List<Map<String, String>> findGuaDetailsById(int guaId);

	/**
	 * 根据id查询抵质押物详情
	 * 
	 * @return
	 */
	List<Map<String, String>> findPledge(int borloaninfoId);

	/**
	 * 根据id查询还款信息详情
	 * 
	 * @return
	 */
	List<Map<String, String>> findRepayRecord(int borloaninfoId);

	/**
	 * 根据id查询催收详情
	 * 
	 * @return
	 */
	List<Map<String, String>> findLMR(int borloaninfoId);
	List<Map<String, String>> findContect(int borId);
	/**
	 * 根据贷款类型，贷款编号查询贷款信息
	 */
	List<BorLoanInfo> findBorLoanInfo2(String borloaninfoId);

	/**
	 * 根据贷款编号修改业务移交相关信息
	 * 
	 * @return
	 */
	void modifyBorLoanInfo(String empId, String borloaninfoId);

	/**
	 * 添加一条债款管理记录
	 * 
	 * @param datamap
	 */
	void addLoanManageRecordMap(Map<String, String> datamap);

	/**
	 * 修改贷款状态
	 * 
	 * @param datamap
	 */
	void modifyLoanStateMap(Map<String, String> datamap);

	/**
	 * 模糊查询
	 * 
	 * @param datamap
	 */
	List<Map<String, String>> findBorSearch(Map<String, String> datamap);

	/**
	 * 合同编号唯一性验证
	 */
	List<BorLoanInfo> findcontractId(String contractId);

	/**
	 * 修改未还金额
	 * 
	 * @param datamap
	 */
	void modifyUnrepayNumber(Map<String, String> datamap);

	/**
	 * 添加贷款回收信息
	 * 
	 * @param datamap
	 */
	void addRepaymentinfo(Map<String, String> datamap);
}
