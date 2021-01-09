package biz.impl;

import java.util.List;

import biz.IHomeWorkBiz;


import dao.IHomeWorkDao;
import dao.impl.HomeWorkDaoImpl;

import model.HomeWork;
import model.User;

public class HomeWorkBizImpl implements IHomeWorkBiz {
	IHomeWorkDao hd = new HomeWorkDaoImpl();

	/**
	 * 查询作业
	 */
	public List<HomeWork> selHomeWork(String sql) {
		List<HomeWork> list = hd.selHomeWork(sql);
		if (list.size() > 0) {
			return list;
		}
		return null;
	}

	/**
	 * 提交作业
	 */
	public boolean addHomeWork(String subject, String give_time, int u_id,
			String consignee, String filename) {
		if (hd.addHomeWork(subject, give_time, u_id, consignee, filename) > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	/**
	 * 提交人数
	 */
	public int countCollect (String sql){
		return hd.countCollect(sql);
	}
	/**
	 *  未交人
	 */
	public List<User> weiUsers(String sql){
		List<User> list=hd.weiUsers(sql);
		if(list.size()>0){
			return list;
		}else{
			return null;
		}
	}
}
