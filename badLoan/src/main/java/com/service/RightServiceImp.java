package com.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.RightDao;
import com.entity.Right;

/**
 * @ service实现类 RightServiceImp
 *
 */
@Service
public class RightServiceImp implements RightService {
	@Autowired
	private RightDao rd;

	/**
	 * 添加权限
	 * 
	 * @author yang
	 */
	public void addRight(Right right) {
		String rightp = right.getRightParent();
		if (rightp != null && !(rightp.equals("")) && !(rightp.equals("无"))) {
			Integer childrenId = rd.findMaxChildByParentId(right.getRightParent()) + 1;
			right.setRightId(childrenId + "");
			System.out.println(right.getRightId());
			System.out.println(right);
		} else {
			Integer parentId = rd.findMaxParentId() + 1;
			right.setRightId(parentId + "");
			right.setRightParent("0");
			right.setRightUrl("");
			System.out.println(right);
		}
		rd.addRight(right);
		rd.addRigthToSuper(right);
	}

	/**
	 * 查询权限
	 * 
	 * @author yang
	 */
	@Override
	public List<Right> findAllRight() {
		return rd.findAllRight();
	}

	/**
	 * 查询父权限
	 * 
	 * @author yang
	 */
	public List<Right> findParentRight() {
		return rd.findParentRight();
	}

	/**
	 * 查询所有子权限
	 * 
	 * @author yang
	 */
	public List<Right> findSonRight() {
		return rd.findSonRight();
	}

	/**
	 * 将父子节点list转换成tree
	 * 
	 * @author yang
	 */
	public String listToTree(List<Right> parentList, List<Right> sonList) {
		String tree = "";
		tree += "[";
		int flag = 0;
		for (int i = 0; i < parentList.size(); i++) {
			Right right = parentList.get(i);
			if (right != null && right.getRightParent() != null && right.getRightParent() != "") {
				if (right.getRightParent().equals("0")) {
					tree += "{\"id\":" + right.getRightId() + ",\"text\":\"" + right.getRightName()
							+ "\",\"children\":[";
					for (int j = 0; j < sonList.size(); j++) {
						Right sonRight = sonList.get(j);
						if (sonRight != null && sonRight.getRightParent() != null && sonRight.getRightParent() != "") {
							if (sonRight.getRightParent().equals(right.getRightId())) {
								flag = 1;
								tree += "{\"id\":" + sonRight.getRightId() + ",\"text\":\"" + sonRight.getRightName()
										+ "\",\"attributes\":{\"url\":\"" + sonRight.getRightUrl() + "\"}},";
							}
						}
					}
					if (flag == 1) {
						tree = tree.substring(0, tree.length() - 1);
						flag = 0;
					}
					tree += "]},";
				}
			}
		}
		tree = tree.substring(0, tree.length() - 1);
		tree += "]";
		System.out.println(tree);
		return tree;
	}

	/**
	 * 根据权限ID禁用权限
	 * 
	 * @author yang
	 */
	public void stopRightById(Map<String, Object> datamap) {
		if (datamap.get("rightParent").equals("0")) {
			rd.stopRightByParentId((String) datamap.get("rightId"));
		} else {
			rd.stopRightById((String) datamap.get("rightId"));
		}
	}

	/**
	 * 根据权限ID开启权限
	 * 
	 * @author yang
	 */
	public void startRightById(Map<String, Object> datamap) {
		if (datamap.get("rightParent").equals("0")) {
			rd.startRightByParentId((String) datamap.get("rightId"));
		} else {
			rd.startRightById((String) datamap.get("rightId"));
		}
	}

	/**
	 * 根据用户ID返回权限树
	 */
	public String findHomeTree(String userId) {
		List<Right> findRightP = rd.findRightP(userId);
		List<Right> findRightS = rd.findRightS(userId);
		return listToTree(findRightP, findRightS);
	}

}
