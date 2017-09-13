package com.dao;

import java.util.List;

import com.entity.ConpanyLegal;
/**
 * 张少华
 * 企业法人关系类
 * @author Administrator
 *
 */
public interface ConpanyLegalDao {
	public List<ConpanyLegal> findConpanyLegal();
	public int  addConpanyLegal(ConpanyLegal conpanyLegal);
}
