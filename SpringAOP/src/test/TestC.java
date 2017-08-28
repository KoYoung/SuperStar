package test;

import org.junit.Test;

import Phone.PhoneBizProxy;

public class TestC {
	@Test
	public void test1(){
		PhoneBizProxy pbp = new PhoneBizProxy();
		pbp.buyPhone(1);
		pbp.salePhone(2);
	}
}
