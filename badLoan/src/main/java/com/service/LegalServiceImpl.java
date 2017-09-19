package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.LegalDao;
import com.entity.Legal;

/**
 * 法人代表信息service实现类
 * 
 * @author yang
 *
 */
@Service
public class LegalServiceImpl implements LegalService {
	@Autowired
	private LegalDao legalDao;

	/**
	 * 查询所有法人代表信息
	 * 
	 * @return 法人代表信息集合
	 */
	@Override
	public List<Legal> findLegal() {
		return legalDao.findLegalDao();
	}

	/**
	 * 添加法人代表信息
	 * 
	 * @param legal
	 * @return 插入成功返回1
	 */
	@Override
	public int addLegal(Legal legal) {
		return legalDao.addLegal(legal);
	}
	/**
	 * 根据企业编号查询贷款企业的法人
	 */
	public Legal findLegalCom(String comId){
		List<Legal> lList = null;
		lList = legalDao.findLegalCom(comId);
		if(lList.size()>0){
			return lList.get(0);
		}
		return null;
	}
}
