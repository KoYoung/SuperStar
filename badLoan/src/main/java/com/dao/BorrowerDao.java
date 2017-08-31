package com.dao;

import java.util.List;

import com.entity.BorRower;

public interface BorrowerDao {
	public List<BorRower> findBorrowers();
	public int updataBorrowers(BorRower bor);
}
