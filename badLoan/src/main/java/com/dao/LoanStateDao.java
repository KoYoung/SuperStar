package com.dao;

import java.util.List;
import java.util.Map;

public interface LoanStateDao {
	List<Map<String, String>> findLoanState();
}
