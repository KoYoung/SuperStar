package com.service;

import java.util.List;

import com.entity.WriteoffManage;

public interface WriteoffManageService {
	/**
	 * 查询所有申请核销的贷款信息
	 * @author Administrator
	 *
	 */
	List<WriteoffManage> findWriteoffManage(); 
}
