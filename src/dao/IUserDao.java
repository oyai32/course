package dao;

import model.User;

public interface IUserDao {
	/**
	 * 注册
	 */
		public int register(String userName,String password,String name,String school);
		
		/**
		 * 根据帐号密码查询用户，返回用户(判断登录)
		 */
		public User login(String sql);
		/**
		 * 添加教师用户
		 */
		public int addTeacher(String username,String password,String name,String school,String subject);
		/**
		 * 根据查询单个用户
		 */
		public User selUser(String sql);
		/**
		 * 冻结用户
		 */
		public int delUser(String userName,int d);
		/**
		 * 初始化密码
		 */
		public int cshPassword(String userName);
		/**
		 * 查询此帐号
		 */
		public int cxzh(String userName);
		/**
		 * 修改密码
		 */
		public int updatepsw(String userName ,String yuanpsw,String xinpsw);
	}