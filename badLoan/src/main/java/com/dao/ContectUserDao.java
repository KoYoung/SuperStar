package com.dao;

import java.util.List;

import com.entity.ContectUser;
/**张少华
 * 个人担保人方法类
 * @author Administrator
 *
 */
public interface ContectUserDao {
	public List<ContectUser> findContectUser();//查询
	public int addContectUser(ContectUser contectUser);//添加个人担保人
	public int addContectUserCom(ContectUser contectUser);
	public int modifyContectUser(ContectUser contectUser);//修改个人担保人
}
