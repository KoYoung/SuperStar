package com.dao;

import java.util.List;
import java.util.Map;

import com.entity.Find;

/**
 * @author 蒙奇·D·路飞
 * 查询接口
 * FindDao
 *
 */
public interface FindDao {

	/**
	 * 查询客户（个人）信息
	 */
	public List<Find> findBorLoan();
	/**
	 * 模糊查询1
	 */
	public List<Find> searchBorLoan(Find find);
	
	
	
	
	
	/**
	 * 查询客户（企业）信息
	 */
	public List<Find> findComLoan();
	/**
	 * 模糊查询2
	 */
	public List<Find> searchComLoan(Find find);
	
	
	
	
	
	/**
	 * 查询担保人关系表(个人)
	 */
	public List<Find> findBorGuarantor(String borloaninfoId);
	/**
	 * 模糊查询3
	 */
	public List<Find> searchBorGuarantor(Find find);
	
	
	
	
	
	/**
	 * 查询担保人关系表(企业)
	 */
	public List<Find> findComGuarantor(String comloaninfoId);
	/**
	 * 模糊查询4
	 */
	public List<Find> searchComGuarantor(Find find);
	
	
	
	
	
	/**
	 * 查询客户抵押物关系表(个人)
	 */
	public List<Find> findBorPledge(String borloaninfoId);
	/**
	 * 模糊查询5
	 */
	public List<Find> searchBorPledge(Find find);
	
	
	
	
	
	/**
	 * 查询客户抵押物关系表(企业)
	 */
	public List<Find> findComPledge(String comloaninfoId);
	/**
	 * 模糊查询6
	 */
	public List<Find> searchComPledge(Find find);
	
	
	
	
	
	/**
	 * 查询所有担保人
	 */
	public List<Find> findGuarantor();
	/**
	 * 模糊查询7
	 */
	public List<Find> searchGuarantor(Find find);
	
	
	
	
	
	/**
	 * 查询某个担保人所担保的个人项目
	 */
	public List<Find> findGuarantorBor(String guaId);
	/**
	 * 模糊查询8
	 */
	public List<Find> searchGuarantorBor(Find find);
	
	
	
	
	
	/**
	 * 查询某个担保人所担保的企业项目
	 */
	public List<Find> findGuarantorCom(String guaId);
	/**
	 * 模糊查询9
	 */
	public List<Find> searchGuarantorCom(Find find);
	
	
	
	
	
	/**
	 * 查询所有经手人
	 */
	public List<Find> findEmp();
	/**
	 * 模糊查询10
	 */
	public List<Find> searchEmp(Find find);
	
	
	
	
	
	/**
	 * 查询某个经手人所经手的个人项目
	 */
	public List<Find> findEmpBor(String empId);
	/**
	 * 模糊查询11
	 */
	public List<Find> searchEmpBor(Find find);
	
	
	
	
	
	/**
	 * 查询某个经手人所经手的企业项目
	 */
	public List<Find> findEmpCom(String empId);
	/**
	 * 模糊查询12
	 */
	public List<Find> searchEmpCom(Find find);
	
	
	
	
	
	/**
	 * 查询银行的个人不良贷款总额记录(柱状图)
	 */
	public List<Map<String, Object>> findBankBorColumn();
	/**
	 * 查询银行的企业不良贷款记录(柱状图)
	 */
	public List<Map<String, Object>> findBankComColumn();
	/**
	 * 根据银行的名称查询该银行的个人贷款金额
	 */
	public List<Map<String, Object>> findBankBor(String name);
	/**
	 * 根据银行的名称查询该银行的企业贷款金额
	 */
	public List<Map<String, Object>> findBankCom(String name);
	

	
	
	/**
	 * 查询银行的个人不良贷款总额记录(饼图)
	 */
	public List<Map<String, Object>> findBankBorPie(); 
	/**
	 * 查询银行的个人不良贷款总额记录(饼图)
	 */
	public List<Map<String, Object>> findBankComPie(); 
}
