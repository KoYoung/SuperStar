package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.RightDao;
import com.entity.Right;

/**
 * @author 蒙奇·D·路飞
 * service实现类
 * RightServiceImp
 *
 */
@Service
public class RightServiceImp implements RightService{
	@Autowired
	private RightDao rd;
	
	/**
	 * 添加权限
	 */
	@Override
	public void addRight(Right right) {
		// TODO Auto-generated method stub
		rd.addRight(right);
	}

	/**
	 * 查询权限
	 */
	@Override
	public List<Right> findAllRight() {
		// TODO Auto-generated method stub
		return rd.findAllRight();
	}

}
