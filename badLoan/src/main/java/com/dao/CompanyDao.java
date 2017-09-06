package com.dao;

import java.util.List;
/**张少华
 * 企业基础信息添加：addBorRowers
 * 			查询：findBorRowers
 * @author Administrator
 *
 */
import com.entity.Company;

public interface CompanyDao {
	public int addCompany(Company company);// 添加

	public List<Company> findCompany();// 查询

	public List<Company> findCompanmohu(String string);// 模糊查询公司
}
