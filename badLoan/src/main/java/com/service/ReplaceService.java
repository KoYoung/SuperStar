package com.service;

import com.entity.Replace;
import com.util.PagingResult;

public interface ReplaceService {
	/**
	 * 业务移交记录
	 */
	String addReplace(Replace replace);
	/**
	 * 查询所有的业务移交记录
	 */
	PagingResult<Replace> findReplace(Integer page,Integer rows);
}
