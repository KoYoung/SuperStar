package com.service;

import java.util.List;
import java.util.Map;

import com.entity.Right;

/**
 * @author 蒙奇·D·路飞 service接口 RightService
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

	/**
	 * 查询所有父权限
	 * 
	 * @return
	 */
	public List<Right> findParentRight();

	/**
	 * 查询所有子权限
	 * 
	 * @return
	 */
	public List<Right> findSonRight();

	/**
	 * 根据 父节点，子节点list转换出tree
	 * 
	 * @param parentList
	 * @param sonList
	 * @return
	 */
	String listToTree(List<Right> parentList, List<Right> sonList);

	/**
	 * 禁用权限
	 * 
	 * @param datamap
	 */
	void stopRightById(Map<String, Object> datamap);

	/**
	 * 启用权限
	 * 
	 * @param datamap
	 */
	void startRightById(Map<String, Object> datamap);
}
