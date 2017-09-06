package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.GuarantorDao;
import com.entity.Guarantor;
/**
 * 担保人service实现类
 * 
 * @author yang
 *
 */
@Service
public class GuarantorServiceImpl implements GuarantorService {
	@Autowired
	private GuarantorDao guaDao;

	/**
	 * 查询担保人
	 * 
	 * @return 担保人集合
	 */
	@Override
	public List<Guarantor> findGuarantor() {
		return guaDao.findGuarantor();
	}

	/**
	 * 添加担保人
	 * 
	 * @param guarantor担保人实体
	 * @return 添加成功返回1
	 */
	@Override
	public int addGuarantor(Guarantor guarantor) {
		return guaDao.addGuarantor(guarantor);
	}

}
