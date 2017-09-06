package com.dao;

import java.util.List;

import com.entity.BorRower;

public interface BorRowerDao {
	public List<BorRower> findBorRowers();
	public int addBorRowers(BorRower bor);
}
