package com.service;

import java.util.List;

import com.entity.Replace;

public interface ReplaceService {
	/**
	 * 业务移交记录
	 */
	int addReplace(Replace replace);
	/**
	 * 查询所有的业务移交记录
	 */
	List<Replace> findReplace();
}
