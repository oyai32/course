package dao.impl;

import java.util.List;


import dao.ITestDao;

import util.DBUtils;

import model.Test;
import model.Topic;

public class TestDaoImpl implements ITestDao {
/**
 * 查询试卷科目  如：c语言  
 */
	public List<Topic> selTopic(String sql) {
		List<Topic>  list=DBUtils.queryList(sql,Topic.class);
		return list;
	}
	
	/**
	 * 生成试卷，存入试卷表
	 * @return
	 */
	public int createTest( String test_id,String alltopic,String allanswer,int u_id,String subject,String difficulty ){
		String sql="insert into test (test_id,alltopic,allanswer,u_id,subject,difficulty,create_time)value(?,?,?,?,?,?,now())";
		return DBUtils.update(sql, test_id,alltopic,allanswer,u_id,subject,difficulty);
	}
	
	/**
	 * 将我的答案插入答案表
	 */
	public int addAnswer( String test_id,String myanswer,int u_id){
		String sql="insert into answer (test_id,u_id,myanswer,create_time)value(?,?,?,now())";
		return DBUtils.update(sql, test_id,u_id,myanswer);
	}
	/**
	 * 查找单个试卷对象
	 */
	public Test selDanTest(String sql){
		return DBUtils.query(sql, Test.class);
	}
}
