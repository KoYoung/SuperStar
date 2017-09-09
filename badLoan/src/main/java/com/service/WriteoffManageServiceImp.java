package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.WriteoffManageDao;
import com.entity.Repaymentinfo;
import com.entity.WriteoffManage;
@Service
public class WriteoffManageServiceImp implements WriteoffManageService {
	@Autowired
	private WriteoffManageDao writeDao;
	/**
	 * 查询所有申请核销的贷款信息
	 * @author Administrator
	 *
	 */
	@Override
	public List<WriteoffManage> findWriteoffManage() {
		
		return writeDao.findWriteoffManage();
	}
	/**
	 * 根据贷款编号查询这笔贷款的所有回收记录
	 */
	public List<Repaymentinfo> findReayment(String loaninfoId){
		return writeDao.findReayment(loaninfoId);
	}

}
