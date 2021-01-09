package biz;

import java.util.List;

import model.Topic;

public interface ITopicBiz {
	/**
	 * 添加题目
	 */
	public boolean addTopic(String subject, String title, String optiona,
			String optionb, String optionc, String optiond, String answer,
			String difficulty, int u_id);

	/**
	 * 删除题目
	 */
	public boolean delTopic(int t_id);

	/**
	 * 修改题目
	 */
	public boolean updateTopic(int t_id, String subject, String title,
			String optiona, String optionb, String optionc, String optiond,
			String answer, String difficulty) ;

	/**
	 * 根据题目，查询题目
	 */
	public List<Topic> selTopic(String sql,String title) ;
	
	/**
	 * 查询所有题目
	 */
	public List<Topic> selTopic(String sql,int u_id,int pageIndex,int pageSize);
	/**
	 * 查询题目个数
	 */
	public int countTopic(String sql) ;
	
	/**
	 * 按查询单个题目
	 */
	public Topic selOneTopic(String sql,int t_id);
}
