package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.BorRowerDao;
import com.entity.BorRower;
@Service
public class BorRowerServiceImp implements BorRowerService{
	@Autowired
	private BorRowerDao BorRowerDao;
	/**
	 * ��ѯ���еĸ����û�
	 * ����Ф
	 * @return
	 */
	@Override
	public List<BorRower> findBorRower() {
		return BorRowerDao.findBorRower();
	}

}
