package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ComloanInfoDao;
import com.entity.ComloanInfo;
@Service
public class ComloanInfoServiceImp implements ComloanInfoService {
	@Autowired
	private ComloanInfoDao ComloanInfoDao;
	/**
	 * 添加企业贷款信息
	 */
	@Override
	public int addComloanInfo(ComloanInfo comloanInfo) {
		// TODO Auto-generated method stub
		return ComloanInfoDao.addComloanInfo(comloanInfo);
	}
	/**
	 * 查询企业贷款信息
	 */
	@Override
	public List<ComloanInfo> findComloanInfo() {
		return ComloanInfoDao.findComloanInfo();
	}

}
