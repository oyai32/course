package dao.impl;


import dao.IUserDao;
import model.User;
import util.DBUtils;

public class UserDaoImpl implements IUserDao{
/**
 * 注册
 */
	public int register(String userName,String password,String name,String school){
		String sql="insert into user(userName,password,name,school,role,create_time) values(?,?,?,?,3,now())";
		int a=DBUtils.update(sql, userName,password,name,school);
		return a;
	}
	
	/**
	 * 根据帐号密码查询用户，返回用户(判断登录)
	 */
	public User login(String sql){

		User u=DBUtils.query(sql, User.class);
		return u;
	}
	/**
	 * 添加教师用户
	 */
	public int addTeacher(String username,String password,String name,String school,String subject){
		String sql="insert into user (username,password,name,school,subject,role,create_time) values(?,?,?,?,?,2,now())";
		return DBUtils.update(sql, username,password,name,school,subject);
	}
	/**
	 * 根据查询单个用户
	 */
	public User selUser(String sql){
		User user=DBUtils.query(sql,User.class);
		return user;
	}
	/**
	 * 冻结用户
	 */
	public int delUser(String userName,int d){
		String sql="update user set del=? where userName=?";
		return DBUtils.update(sql, d,userName);
	}
	/**
	 * 初始化密码
	 */
	public int cshPassword(String userName){
		String sql="update user set password =? where userName=?";
		return DBUtils.update(sql, "000000",userName);
	}
	/**
	 * 查询此帐号
	 */
	public int cxzh(String userName){
		String sql="select count(1) from user where userName=?";
		return DBUtils.count(sql, userName);//返回条数
	}
	/**
	 * 修改密码
	 */
	public int updatepsw(String userName ,String yuanpsw,String xinpsw){
		String sql="update user set password=? where userName=? and password=?";
		return DBUtils.update(sql, xinpsw,userName,yuanpsw);
		
	}
}
