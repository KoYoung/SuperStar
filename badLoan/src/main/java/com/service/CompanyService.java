package com.service;

import java.util.List;

import com.entity.Company;
/**
 * 张少华
 * 企业基础信息
 * @author Administrator
 *
 */
public interface CompanyService {
	public int addCompany(Company company);
	public List<Company>findCompany();
}
