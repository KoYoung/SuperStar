package com.service;

import java.util.List;

import com.entity.BorRower;
import com.entity.Contect;
import com.entity.ContectUser;
/**
 * 张少华
 * 个人
 * @author Administrator
 *
 */
public interface BorRowerService {
	public List<BorRower> findBorRowers();//查询全部
	public int addBorrowers(BorRower bor,Contect contect,ContectUser contectUser);//添加
	public int modifyBorRower(BorRower borRower, ContectUser contectUser, Contect contect);//修改
	List<BorRower> findBorRowersMohu(String str);//模糊查询
	/**
	 * 查询所有个人用户编号
	 */
	List<BorRower> findBorId();
}
