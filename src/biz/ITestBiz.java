package biz;

import java.util.List;

import model.Test;
import model.Topic;

public interface ITestBiz {
	/**
	 * 查询试卷科目 如：c语言
	 */
	public List<Topic> selTopic(String sql);
	
	/**
	 * 生成试卷，存入试卷表
	 * @return
	 */
	public boolean createTest( String test_id,int u_id,List<Topic> topicLists);
	
	/**
	 * 将我的答案插入答案表
	 */
	public boolean addAnswer( String test_id,String myanswer,int u_id);
	
	/**
	 * 查找单个试卷对象
	 */
	public Test selDanTest(String sql);
}
