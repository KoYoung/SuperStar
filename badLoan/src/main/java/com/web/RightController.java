package com.web;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.entity.Right;
import com.service.RightService;
import com.util.Paging;
import com.util.PagingResult;

/**
 * @author 蒙奇·D·路飞 controller控制器 RightController
 *
 */
@Controller
@RequestMapping("/right")
public class RightController {
	@Autowired
	public RightService rs;

	/**
	 * 添加权限
	 */
	@RequestMapping("/addRight")
	@ResponseBody
	public int addRight(Right right) {
		System.out.println(right);
		rs.addRight(right);
		return 1;
	}

	@RequestMapping("/findRight")
	@ResponseBody
	public PagingResult<Right> findRight(@RequestParam Integer rows, Integer page) {
		List<Right> rightList = rs.findAllRight();
		Paging<Right> paging = new Paging<Right>();
		List<Right> list = paging.paging(rightList, rows, page);
		PagingResult<Right> pr = new PagingResult<Right>();
		pr.setRows(list);
		pr.setTotal(rightList.size());
		return pr;
	}

	@RequestMapping("/findParentRight")
	@ResponseBody
	public List<Right> findParentRight() {
		return rs.findParentRight();
	}

	/**
	 * 查询所有jsp页面
	 * 
	 * @param req
	 * @return
	 */
	@RequestMapping("/findAllUrl")
	@ResponseBody
	public List<Map<String, String>> findAllUrl(HttpServletRequest req) {
		String path = req.getRealPath("/") + "\\jsp";
		File file = new File(path);
		File[] tempList = file.listFiles();
		String str = "";
		List<Map<String, String>> lm = new ArrayList<>();
		for (int i = 0; i < tempList.length; i++) {
			if (tempList[i].isFile()) {
				Map<String, String> urlMap = new HashMap<>();
				str = tempList[i].toString();
				str = str.substring(str.indexOf("\\jsp") + 5, str.length());
				urlMap.put("fileId", str);
				urlMap.put("fileName", str);
				lm.add(urlMap);
			}
		}
		System.out.println(lm);
		return lm;
	}

	/**
	 * 查询权限 返回权限树JSONString
	 */
	@RequestMapping("/queryRight")
	@ResponseBody
	public String findAllRight() {
		List<Right> parentList = rs.findParentRight();
		List<Right> sonList = rs.findSonRight();
		System.out.println(parentList);
		System.out.println(sonList);
		String tree = rs.listToTree(parentList, sonList);
		return tree;
	}

	/**
	 * 禁用权限
	 */
	@RequestMapping("/stopRightById")
	@ResponseBody
	public String stopRightById(@RequestBody String data) {
		Map<String, Object> datamap = JSON.parseObject(data, Map.class);
		System.out.println(datamap);
		rs.stopRightById(datamap);
		return "success";
	}

	/**
	 * 启用权限
	 */
	@RequestMapping("/startRightById")
	@ResponseBody
	public String startRightById(@RequestBody String data) {
		Map<String, Object> datamap = JSON.parseObject(data, Map.class);
		System.out.println(datamap);
		rs.startRightById(datamap);
		return "success";
	}

	/**
	 * 获取登录用户权限
	 */
	@RequestMapping("/getUserRightList")
	@ResponseBody
	public String getUserRightList(String data) {
		String userId = data;
		return rs.findHomeTree(userId);
	}
}
