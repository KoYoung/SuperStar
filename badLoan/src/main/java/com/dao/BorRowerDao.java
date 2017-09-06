package com.dao;

import java.util.List;

import com.entity.BorRower;
/**
 * 张少华
 * 个人客户
 * @author Administrator
 *
 */
public interface BorRowerDao {
	public List<BorRower> findBorRowers();//查询全部
	public List<BorRower> findBorRowersMohu(String  str);//模糊查询
	public int addBorRowers(BorRower bor);//添加
	public int modifyBorRower(BorRower borRower);//修改
	
}
