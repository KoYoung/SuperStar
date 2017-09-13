package com.dao;

import java.util.List;

import com.entity.Contract;

/**
 * 贷款合同Dao
 * 
 * @author yang
 *
 */
public interface ContractDao {
	/**
	 * 查询贷款合同
	 * 
	 * @return 贷款合同集合
	 */
	List<Contract> findContract();

	/**
	 * 添加
	 * 
	 * @param contract贷款集合实体
	 * @return 成功返回1
	 */
	int addContract(Contract contract);

}
