package com.dao;

import java.util.List;

import com.entity.Repaymentinfo;
import com.entity.WriteoffManage;

public interface WriteoffManageDao {
	/**
	 * 查询所有申请核销的贷款信息
	 * @author Administrator
	 *
	 */
	List<WriteoffManage> findWriteoffManage(); 
	/**
	 * 根据贷款编号查询这笔贷款的所有回收记录
	 */
	List<Repaymentinfo> findReayment(String loaninfoId);
}
