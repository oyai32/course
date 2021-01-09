package dao.impl;

import java.util.List;


import dao.IHomeWorkDao;

import util.DBUtils;

import model.HomeWork;
import model.User;

public class HomeWorkDaoImpl implements IHomeWorkDao{
	/**
	 * 查询作业
	 */
	public List<HomeWork> selHomeWork(String sql) {
		List<HomeWork> list = DBUtils.queryList(sql, HomeWork.class);
		return list;
	}
	
	/**
	 * 提交作业
	 */
	public int addHomeWork(String subject,String give_time,int u_id,String consignee,String filename){
		String sql="insert into homework (subject,give_time,submit_time,u_id,consignee,filename) values(?,?,CURDATE(),?,?,?)";
		return DBUtils.update(sql, subject,give_time,u_id,consignee,filename);
	}
	/**
	 * 提交人数
	 */
	public int countCollect (String sql){
		return DBUtils.count(sql);
	}
	/**
	 *  未交人
	 */
	public List<User> weiUsers(String sql){
		return DBUtils.queryList(sql, User.class);
	}
//	/**
//	 * 
//	 */
//	public List<HomeWork> selAll(String name){
//		String sql="select subject from user where name=?";
//		String subjects=DBUtils.selOne(sql, name).toString();
//		String subject[]=subjects.split(",");//该教师所教的科目
//		sql="select give_time from homework where consignee=? order by give_time desc limit 0,1";//最近的一次布置日期
//		String give_time=DBUtils.selOne(sql, name).toString();
//		String count="";//用来装每个科目的未交人数，用逗号隔开
//		for(int i=0;i<subject.length;i++){
//			sql="select count(1) from homework where consignee=?  and subject =? and give_time =? ";
//			count=count+","+DBUtils.count(sql,name,subject[i],give_time);
//			sql="select * from user where u_id not in(select u_id from homework where consignee=?  and subject =? and  give_time = ?  ) and role=3";
//			List<User> weiUsers= DBUtils.queryList(sql, User.class,name,subject[i],give_time);
//		
//		}
//
//		
//		return null;
//		
//	}
	
}
