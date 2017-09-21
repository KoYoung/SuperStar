package com.dao;

import java.util.List;
import java.util.Map;

public interface LoanStateDao {
	/**
	 * 查询全部贷款状态
	 * 
	 * @return
	 */
	List<Map<String, String>> findAllLoanState();

	/**
	 * 查询不包含核销的贷款状态
	 * @return
	 */
	List<Map<String, String>> findLoanState();
}
