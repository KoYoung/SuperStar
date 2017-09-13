package com.dao;

import java.util.List;
import java.util.Map;

import com.entity.Right;

/**
 * @author dao接口 RightDao
 *
 */
public interface RightDao {
	/**
	 * 添加权限
	 */
	public void addRight(Right right);

	/**
	 * 查询权限
	 */
	public List<Right> findAllRight();

	/**
	 * 查询父权限
	 */
	List<Right> findParentRight();

	/**
	 * 查询子权限
	 */
	List<Right> findSonRight();

	/**
	 * 查询id最大的父节点
	 * 
	 * @return
	 */
	Integer findMaxParentId();

	/**
	 * 查询id最大的子节点
	 * 
	 * @return
	 */
	Integer findMaxChildByParentId(String rightParent);

	/**
	 * 禁用父节点及其子节点
	 * 
	 * @param rightId
	 */
	void stopRightByParentId(String rightId);

	/**
	 * 禁用子节点
	 * 
	 * @param rightId
	 */
	void stopRightById(String rightId);

	/**
	 * 启用父节点及其子节点
	 * 
	 * @param rightId
	 */
	void startRightByParentId(String string);

	/**
	 * 启用子节点
	 * 
	 * @param string
	 */
	void startRightById(String string);
}