package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.BankInfoDao;
import com.entity.BankInfo;

@Service

public class BankInfoServiceImp implements BankInfoService{
	@Autowired
	private BankInfoDao bDao;
	 /**
	  * ��ѯ����������Ϣ
	  * ����Ф
	  * @return
	  */
	public List<BankInfo> findBankInfo(){
		return bDao.findBankInfo();
	}
}
