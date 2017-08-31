package com.service;

import java.util.List;

import com.entity.Borrower;

public interface BorrowerService {
	public List<Borrower> findBorrowers();
	public int updataBorrowers(Borrower bor);
}
