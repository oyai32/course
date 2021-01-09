package dao;

import java.util.List;

import model.HomeWork;
import model.User;

public interface IHomeWorkDao {
	/**
	 * 查询作业
	 */
	public List<HomeWork> selHomeWork(String sql) ;
	
	/**
	 * 提交作业
	 */
	public int addHomeWork(String subject,String give_time,int u_id,String consignee,String filename);
	/**
	 * 提交人数
	 */
	public int countCollect (String sql);
	/**
	 *  未交人
	 */
	public List<User> weiUsers(String sql);
	
//	public List<HomeWork> selAll(String name);
	
}
