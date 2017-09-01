package com.service;

import java.util.List;

import com.entity.BorRower;

public interface BorRowerService {
	public List<BorRower> findBorRowers();
	public int addBorrowers(BorRower bor);
}
