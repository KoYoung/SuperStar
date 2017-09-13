package com.service;

import java.util.List;

import com.entity.Find;

/**
 * @author 蒙奇·D·路飞
 * 查询Service接口
 * FindService
 *
 */
public interface FindService {
	/**
	 * 查询客户（个人）信息
	 */
	public List<Find> findBorLoan();
	
	/**
	 * 查询客户（企业）信息
	 */
	public List<Find> findComLoan();
	
	/**
	 * 查询担保人关系表(个人)
	 */
	public List<Find> findBorGuarantor(String borloaninfoId);
	
	/**
	 * 查询担保人关系表(企业)
	 */
	public List<Find> findComGuarantor(String comloaninfoId);
	
	/**
	 * 查询客户抵押物关系表(个人)
	 */
	public List<Find> findBorPledge(String borloaninfoId);
	
	/**
	 * 查询客户抵押物关系表(企业)
	 */
	public List<Find> findComPledge(String comloaninfoId);
	
	/**
	 * 查询所有担保人
	 */
	public List<Find> findGuarantor();
	
	/**
	 * 查询某个担保人所担保的个人项目
	 */
	public List<Find> findGuarantorBor(String guaId);
	
	/**
	 * 查询某个担保人所担保的企业项目
	 */
	public List<Find> findGuarantorCom(String guaId);
	
	/**
	 * 查询所有经手人
	 */
	public List<Find> findEmp();
	
	/**
	 * 查询某个经手人所经手的个人项目
	 */
	public List<Find> findEmpBor(String empId);
	
	/**
	 * 查询某个经手人所经手的企业项目
	 */
	public List<Find> findEmpCom(String empId);
}
