package com.dao;

import java.util.List;

import com.entity.Legal;
/**张少华
 * 法人
 * @author Administrator
 *
 */
public interface LegalDao {
	public List<Legal> findLegalDao();
	public int addLegal(Legal legal);
	/**
	 * 根据企业编号查询贷款企业的法人
	 */
	public List<Legal> findLegalCom(String comId);
}
