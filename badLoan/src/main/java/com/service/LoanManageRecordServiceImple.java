package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.LoanManageRecordDao;
import com.entity.LoanManageRecord;

/**
 * 贷款处理记录service接口实现类
 * 
 * @author yang kuo
 */
@Service
public class LoanManageRecordServiceImple implements LoanManageRecordService {
	@Autowired
	private LoanManageRecordDao lmrDao;

	/**
	 * 查询所有贷款处理记录
	 * 
	 * @return LMR集合
	 */
	@Override
	public List<LoanManageRecord> findLoanManageRecord() {

		return lmrDao.findLoanManageRecord();
	}

	/**
	 * 添加一条贷款处理记录
	 * 
	 * @param lmr
	 * @return 成功返回1
	 */
	@Override
	public int addLoanManageRecord(LoanManageRecord lmr) {
		return lmrDao.addLoanManageRecord(lmr);
	}
}
