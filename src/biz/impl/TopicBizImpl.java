package biz.impl;

import java.util.List;


import biz.ITopicBiz;

import dao.ITopicDao;
import dao.impl.TopicDaoImpl;
import model.Topic;


public class TopicBizImpl implements ITopicBiz {
	ITopicDao td = new TopicDaoImpl();

	/**
	 * 添加题目
	 */
	public boolean addTopic(String subject, String title, String optiona,
			String optionb, String optionc, String optiond, String answer,
			String difficulty, int u_id) {
		if (td.addTopic(subject, title, optiona, optionb, optionc, optiond,
				answer, difficulty, u_id) > 0) {
			return true;
		}
		return false;
	}

	/**
	 * 删除题目
	 */
	public boolean delTopic(int t_id) {
		if (td.delTopic(t_id) > 0) {
			return true;
		}
		return false;
	}

	/**
	 * 修改题目
	 */
	public boolean updateTopic(int t_id, String subject, String title,
			String optiona, String optionb, String optionc, String optiond,
			String answer, String difficulty) {
		if (td.updateTopic(t_id, subject, title, optiona, optionb, optionc,
				optiond, answer, difficulty) > 0) {
			return true;
		}
		return false;
	}

	/**
	 * 根据题目，查询题目
	 */
	public List<Topic> selTopic(String sql,String title) {
		List<Topic> topicLists=td.selTopic(sql, title);
		if(topicLists.size()>0){
			return topicLists;
		}
		return null;
	}
	
	/**
	 * 查询所有题目
	 */
	public List<Topic> selTopic(String sql,int u_id,int pageIndex,int pageSize) {
		List<Topic> topicLists=td.selTopic(sql, u_id, pageIndex,pageSize);
		if(topicLists.size()>0){
			return topicLists;
		}
		return null;
	}
	/**
	 * 查询题目个数
	 */
	public int countTopic(String sql) {
		int a=td.countTopic(sql);
		
		return a;
	}
	
	/**
	 * 按查询单个题目
	 */
	public Topic selOneTopic(String sql,int t_id) {
		Topic t=td.selOneTopic(sql, t_id);
		if(t!=null){
			return t;
		}
		return null;
	}
}
