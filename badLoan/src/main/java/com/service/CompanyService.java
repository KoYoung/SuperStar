package com.service;

import java.util.List;

import com.entity.Company;
import com.entity.ConpanyLegal;
import com.entity.Legal;

/**
 * 张少华 企业基础信息
 * 
 * @author Administrator
 *
 */
public interface CompanyService {
	public int addCompany(Company company, Legal legal, ConpanyLegal conpanyLegal);// 添加

	public List<Company> findCompany();// 查询

	public List<Company> findCompanmohu(String string);// 模糊查询

	public int addCompany(Company company);

}
