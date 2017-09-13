package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ContractDao;
import com.entity.Contract;

/**
 * 贷款合同Service实现类
 * 
 * @author yang
 *
 */
@Service
public class ContractServiceImpl implements ContractService {
	@Autowired
	private ContractDao contractDao;

	/**
	 * 查询贷款合同
	 * 
	 * @return 贷款合同集合
	 */
	@Override
	public List<Contract> findContract() {
		return contractDao.findContract();
	}

	/**
	 * 添加
	 * 
	 * @param contract贷款集合实体
	 * @return 成功返回1
	 */
	@Override
	public int addContract(Contract contract) {
		return contractDao.addContract(contract);
	}

}
