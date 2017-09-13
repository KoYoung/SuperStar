package com.service;

import java.util.List;

import com.entity.Right;

/**
 * @author 蒙奇·D·路飞
 * service接口
 * RightService
 *
 */
public interface RightService {
	/**
	 * 添加权限
	 */
	public void addRight(Right right);	
	
	/**
	 * 查询权限
	 */
	public List<Right> findAllRight();
}
