package com.util;

import java.util.ArrayList;
import java.util.List;

/**
 * 
 * @author Administrator
 *
 * @param <E>
 */
public class Paging<E> {
	public List<E> paging(List<E> list, int pageSize, int pageNum) {
		List<E> list2 = new ArrayList<>();
		int total = list.size();
		int start = pageSize * (pageNum - 1);
		int end = pageNum * pageSize;
		if (total <= end) {
			for (int i = start; i < total; i++) {
				list2.add(list.get(i));
			}
			return list2;
		} else {
			for (int i = start; i < end; i++) {
				list2.add(list.get(i));
			}
			return list2;
		}
	}
}
