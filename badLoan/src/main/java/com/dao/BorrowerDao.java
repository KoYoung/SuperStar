package com.dao;

import java.util.List;

import com.entity.Borrower;

public interface BorrowerDao {
	public List<Borrower> findBorrowers();
	public int updataBorrowers(Borrower bor);
}
