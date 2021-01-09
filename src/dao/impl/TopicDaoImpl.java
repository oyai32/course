package dao.impl;

import java.util.List;

import dao.ITopicDao;


import model.Topic;

import util.DBUtils;

public class TopicDaoImpl implements ITopicDao {
/**
 * 添加题目
 */
	public int addTopic (String subject,String title,String optiona,String optionb,String optionc,String optiond,String answer,String difficulty,int u_id){
		String sql="insert into topic (subject,title,optiona,optionb,optionc,optiond,answer,difficulty,update_time,u_id) values(?,?,?,?,?,?,?,?,CURDATE(),?)";
		int a=DBUtils.update(sql, subject,title,optiona,optionb,optionc,optiond,answer,difficulty,u_id);
		return a;
	}
	
	/**
	 * 删除题目
	 */
	public int delTopic(int t_id){
		String sql="delete from topic where t_id=?";
		int a=DBUtils.update(sql, t_id);
		return a;
	}
	
	
	 /**
	  * 修改题目
	  */
	public int updateTopic(int t_id,String subject,String title,String optiona,String optionb,String optionc,String optiond,String answer,String difficulty){
		String sql="update topic set subject=?,title=?,optiona=?,optionb=?,optionc=?,optiond=?,answer=?,difficulty=?,update_time=CURDATE() where t_id=?";
		int a=DBUtils.update(sql, subject,title,optiona,optionb,optionc,optiond,answer,difficulty,t_id);
		return a;
	}
	
	/**
	 * 查询题目
	 */
	public List<Topic> selTopic(String sql,String title) {
		List<Topic> topicLists=DBUtils.queryList(sql,Topic.class, title);
		return topicLists;
	}
	/**
	 * 查询所有题目
	 */
	public List<Topic> selTopic(String sql,int u_id,int pageIndex,int pageSize) {
		List<Topic> topicLists=DBUtils.queryList(sql, Topic.class,u_id, pageIndex,pageSize);
	
		return topicLists;
	}
	/**
	 * 查询题目个数
	 */
	public int countTopic(String sql) {
		int a=DBUtils.count(sql);
		return a;
	}
	/**
	 * 按查询单个题目
	 */
	public Topic selOneTopic(String sql,int t_id) {
		Topic t=DBUtils.query(sql,Topic.class, t_id);
		return t;
	}
}
