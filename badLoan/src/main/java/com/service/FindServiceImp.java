package com.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.FindDao;
import com.entity.Find;
import com.entity.Radar;
import com.util.Paging;
import com.util.PagingResult;

/**
 * @author 蒙奇·D·路飞 查询Service接口实现类 FindServiceImp
 *
 */
@Service
public class FindServiceImp implements FindService {

	@Autowired
	private FindDao fd;

	/**
	 * 查询客户（个人）信息
	 */
	@Override
	public PagingResult<Find> findBorLoan(HttpServletRequest request) {
		int page = Integer.parseInt(request.getParameter("page"));
		int rows = Integer.parseInt(request.getParameter("rows"));
		List<Find> list = fd.findBorLoan();
		Paging<Find> paging = new Paging<Find>();
		List<Find> list2 = paging.paging(list, rows, page);
		PagingResult<Find> pagingResult = new PagingResult<Find>();
		pagingResult.setTotal(list.size());
		pagingResult.setRows(list2);
		return pagingResult;
	}

	/**
	 * 模糊查询1
	 */
	@Override
	public List<Find> searchBorLoan(Find find) {
		List<Find> list = fd.searchBorLoan(find);
		return list;
	}

	/**
	 * 查询客户（企业）信息
	 */
	@Override
	public PagingResult<Find> findComLoan(HttpServletRequest request) {
		int page = Integer.parseInt(request.getParameter("page"));
		int rows = Integer.parseInt(request.getParameter("rows"));
		List<Find> list = fd.findComLoan();
		Paging<Find> paging = new Paging<Find>();
		List<Find> list2 = paging.paging(list, rows, page);
		PagingResult<Find> pagingResult = new PagingResult<Find>();
		pagingResult.setTotal(list.size());
		pagingResult.setRows(list2);
		return pagingResult;
	}

	/**
	 * 模糊查询2
	 */
	@Override
	public List<Find> searchComLoan(Find find) {
		List<Find> list = fd.searchComLoan(find);
		return list;
	}

	/**
	 * 查询担保人关系表(个人)
	 */
	@Override
	public List<Find> findBorGuarantor(String borloaninfoId) {
		List<Find> list = fd.findBorGuarantor(borloaninfoId);
		return list;
	}

	/**
	 * 查询担保人关系表(企业)
	 */
	@Override
	public List<Find> findComGuarantor(String comloaninfoId) {
		List<Find> list = fd.findComGuarantor(comloaninfoId);
		return list;
	}

	/**
	 * 查询客户抵押物关系表(个人)
	 */
	@Override
	public List<Find> findBorPledge(String borloaninfoId) {
		List<Find> list = fd.findBorPledge(borloaninfoId);
		return list;
	}

	/**
	 * 查询客户抵押物关系表(企业)
	 */
	@Override
	public List<Find> findComPledge(String comloaninfoId) {
		List<Find> list = fd.findComPledge(comloaninfoId);
		return list;
	}

	/**
	 * 查询所有担保人
	 */
	@Override
	public PagingResult<Find> findGuarantor(HttpServletRequest request) {
		int page = Integer.parseInt(request.getParameter("page"));
		int rows = Integer.parseInt(request.getParameter("rows"));
		List<Find> list = fd.findGuarantor();
		Paging<Find> paging = new Paging<Find>();
		List<Find> list2 = paging.paging(list, rows, page);
		PagingResult<Find> pagingResult = new PagingResult<Find>();
		pagingResult.setTotal(list.size());
		pagingResult.setRows(list2);
		return pagingResult;
	}

	/**
	 * 模糊查询7
	 */
	@Override
	public List<Find> searchGuarantor(Find find) {
		List<Find> list = fd.searchGuarantor(find);
		return list;
	}

	/**
	 * 查询某个担保人所担保的个人项目
	 */
	@Override
	public List<Find> findGuarantorBor(String guaId) {
		List<Find> list = fd.findGuarantorBor(guaId);
		return list;
	}

	/**
	 * 查询某个担保人所担保的企业项目
	 */
	@Override
	public List<Find> findGuarantorCom(String guaId) {
		List<Find> list = fd.findGuarantorCom(guaId);
		return list;
	}

	/**
	 * 查询所有经手人
	 */
	@Override
	public PagingResult<Find> findEmp(HttpServletRequest request) {
		int page = Integer.parseInt(request.getParameter("page"));
		int rows = Integer.parseInt(request.getParameter("rows"));
		List<Find> list = fd.findEmp();
		Paging<Find> paging = new Paging<Find>();
		List<Find> list2 = paging.paging(list, rows, page);
		PagingResult<Find> pagingResult = new PagingResult<Find>();
		pagingResult.setTotal(list.size());
		pagingResult.setRows(list2);
		return pagingResult;
	}

	/**
	 * 模糊查询10
	 */
	@Override
	public List<Find> searchEmp(Find find) {
		List<Find> list = fd.searchEmp(find);
		return list;
	}

	/**
	 * 查询某个经手人所经手的个人项目
	 */
	@Override
	public List<Find> findEmpBor(String empId) {
		List<Find> list = fd.findEmpBor(empId);
		return list;
	}

	/**
	 * 查询某个经手人所经手的企业项目
	 */
	@Override
	public List<Find> findEmpCom(String empId) {
		List<Find> list = fd.findEmpCom(empId);
		return list;
	}

	/**
	 * 查询银行的个人不良贷款记录(柱状图)
	 */
	@Override
	public List<Map<String, Object>> findBankBorColumn() {
		// TODO Auto-generated method stub
		List<Map<String, Object>> list = fd.findBankBorColumn();
		List<Map<String, Object>> list2 = new ArrayList<>();
		List<Map<String, Object>> list3 = new ArrayList<>();
		for (int i = 0; i < list.size(); i++) {
			Map<String, Object> map = list.get(i);
			Object bank = map.get("BANKINFO_NAME");
			Object money = map.get("SUM");
			Map<String, Object> map2 = new HashMap<>();
			map2.put("name", bank);
			map2.put("y", money);
			list2.add(map2);
		}
		Map<String, Object> map3 = new HashMap<>();
		map3.put("name", "个人不良贷款");
		map3.put("data", list2);
		list3.add(map3);
		return list3;
	}

	/**
	 * 查询银行的企业不良贷款记录(柱状图)
	 */
	@Override
	public List<Map<String, Object>> findBankComColumn() {
		// TODO Auto-generated method stub
		List<Map<String, Object>> list = fd.findBankComColumn();
		List<Map<String, Object>> list2 = new ArrayList<>();
		List<Map<String, Object>> list3 = new ArrayList<>();
		for (int i = 0; i < list.size(); i++) {
			Map<String, Object> map = list.get(i);
			Object bank = map.get("BANKINFO_NAME");
			Object money = map.get("SUM");
			Map<String, Object> map2 = new HashMap<>();
			map2.put("name", bank);
			map2.put("y", money);
			list2.add(map2);
		}
		Map<String, Object> map3 = new HashMap<>();
		map3.put("name", "企业不良贷款");
		map3.put("data", list2);
		list3.add(map3);
		return list3;
	}

	/**
	 * 根据银行的名称查询该银行的个人贷款金额
	 */
	@Override
	public List<Map<String, Object>> findBankBor(String name) {
		// TODO Auto-generated method stub
		List<Map<String, Object>> list = fd.findBankBor(name);
		return list;
	}

	/**
	 * 根据银行的名称查询该银行的企业贷款金额
	 */
	@Override
	public List<Map<String, Object>> findBankCom(String name) {
		// TODO Auto-generated method stub
		List<Map<String, Object>> list = fd.findBankCom(name);
		return list;
	}

	/**
	 * 查询银行的个人不良贷款总额记录(饼图)
	 */
	@Override
	public List<Map<String, Object>> findBankBorPie() {
		Float sum = (float) 0;
		List<Map<String, Object>> list = fd.findBankBorPie();
		List<Map<String, Object>> list2 = new ArrayList<>();
		List<Map<String, Object>> list3 = new ArrayList<>();
		for (int i = 0; i < list.size(); i++) {
			Map<String, Object> map = list.get(i);
			Object money = map.get("SUM");
			sum = sum + Float.parseFloat(money.toString());
		}
		System.out.println(sum + "*******************");
		for (int i = 0; i < list.size(); i++) {
			Map<String, Object> map = list.get(i);
			Object bank = map.get("BANKINFO_NAME");
			Object money = map.get("SUM");
			Float scale = Float.parseFloat(money.toString()) / sum * 100;
			Map<String, Object> map2 = new HashMap<>();
			map2.put("name", bank);
			map2.put("y", scale);
			list2.add(map2);
		}
		Map<String, Object> map = new HashMap<>();
		map.put("name", "所占比例:");
		map.put("colorByPoint", true);
		map.put("data", list2);
		list3.add(map);
		return list3;
	}

	/**
	 * 查询银行的企业不良贷款总额记录(饼图)
	 */
	@Override
	public List<Map<String, Object>> findBankComPie() {
		Float sum = (float) 0;
		List<Map<String, Object>> list = fd.findBankComPie();
		List<Map<String, Object>> list2 = new ArrayList<>();
		List<Map<String, Object>> list3 = new ArrayList<>();
		for (int i = 0; i < list.size(); i++) {
			Map<String, Object> map = list.get(i);
			Object money = map.get("SUM");
			sum = sum + Float.parseFloat(money.toString());
		}
		System.out.println(sum + "*******************");
		for (int i = 0; i < list.size(); i++) {
			Map<String, Object> map = list.get(i);
			Object bank = map.get("BANKINFO_NAME");
			Object money = map.get("SUM");
			Float scale = Float.parseFloat(money.toString()) / sum * 100;
			Map<String, Object> map2 = new HashMap<>();
			map2.put("name", bank);
			map2.put("y", scale);
			list2.add(map2);
		}
		Map<String, Object> map = new HashMap<>();
		map.put("name", "所占比例:");
		map.put("colorByPoint", true);
		map.put("data", list2);
		list3.add(map);
		return list3;
	}

	/**
	 * 查询统计银行不良贷款雷达图
	 * 
	 * @author yang
	 */
	public Radar findRadar() {

		List<Map<String, Object>> borGroupByBank = fd.findborGroupByBank();
		System.out.println(borGroupByBank);
		List<Map<String, Object>> comGroupByBank = fd.findcomGroupByBank();
		System.out.println(comGroupByBank);
		Radar ra = new Radar();
		List<Integer> borMoneyList = new ArrayList<Integer>();
		List<Integer> comMoneyList = new ArrayList<Integer>();
		List<Integer> sumMoneyList = new ArrayList<Integer>();
		List<String> bankNameList = new ArrayList<String>();
		String bankname = "";
		int money = 0;
		int sum = 0;
		for (int i = 0; i < borGroupByBank.size(); i++) {
			bankname = borGroupByBank.get(i).get("BANKINFO_NAME").toString();
			bankNameList.add(bankname);
			money = Integer.parseInt(borGroupByBank.get(i).get("LOANNUMBER").toString());
			borMoneyList.add(money);
			money = Integer.parseInt(comGroupByBank.get(i).get("LOANNUMBER").toString());
			comMoneyList.add(money);
			sum = Integer.parseInt(borGroupByBank.get(i).get("LOANNUMBER").toString())
					+ Integer.parseInt(comGroupByBank.get(i).get("LOANNUMBER").toString());
			sumMoneyList.add(sum);
		}
		ra.setBankNameList(bankNameList);
		ra.setBorMoneyList(borMoneyList);
		ra.setComMoneyList(comMoneyList);
		ra.setSumMoneyList(sumMoneyList);
		System.out.println(ra);
		return ra;
	}

}
