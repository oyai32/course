package biz.impl;

import java.util.List;


import biz.ITestBiz;

import dao.ITestDao;
import dao.impl.TestDaoImpl;

import model.Test;
import model.Topic;

public class TestBizImpl implements ITestBiz{
	ITestDao td = new TestDaoImpl();

	/**
	 * 查询试卷科目 如：c语言
	 */
	public List<Topic> selTopic(String sql) {
		List<Topic> list = td.selTopic(sql);
		
			return list;
		
	}
	
	/**
	 * 生成试卷，存入试卷表
	 * @return
	 */
	public boolean createTest( String test_id,int u_id,List<Topic> topicLists){
		String alltopic="";
		String allanswer="";
		for(int i=0;i<topicLists.size();i++){
			alltopic=alltopic+topicLists.get(i).getT_id()+",";
			allanswer=allanswer+topicLists.get(i).getAnswer()+",";
		}
		String subject =topicLists.get(0).getSubject();
		String difficulty =topicLists.get(0).getDifficulty();

		if(td.createTest(test_id, alltopic, allanswer, u_id, subject, difficulty)>0){
			return true;
		}
		return false;
	}
	
	/**
	 * 将我的答案插入答案表
	 */
	public boolean addAnswer( String test_id,String myanswer,int u_id){
		if(td.addAnswer(test_id, myanswer, u_id)>0){
			return true;
		}
		return false;
	}
	
	/**
	 * 查找单个试卷对象
	 */
	public Test selDanTest(String sql){
		Test t=	td.selDanTest(sql);
		if(t==null){
			return null;
		}else{
			return t;
		}
	}
}
