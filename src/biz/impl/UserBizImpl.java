package biz.impl;

import biz.IUserBiz;

import model.User;
import dao.IUserDao;
import dao.impl.UserDaoImpl;

public class UserBizImpl implements IUserBiz{
	IUserDao dao = new UserDaoImpl();

	/**
	 * 用户注册
	 */
	public boolean register(String userName, String password, String name,
			String school) {
		if (dao.register(userName, password, name, school) > 0) {

			return true;
		}
		return false;
	}

	/**
	 * 根据帐号密码查询用户，返回用户(判断登录)
	 */
	public User login(String sql) {
		User u = dao.login(sql);
		if (u != null) {
			return u;
		}
		return null;
	}

	/**
	 * 添加教师用户
	 */
	public boolean addTeacher(String username, String password, String name,
			String school, String subject) {
		if (dao.addTeacher(username, password, name, school, subject) > 0) {
			return true;
		}
		return false;
	}

	/**
	 * 根据查询单个用户
	 */
	public User selUser(String sql) {
		User user = dao.selUser(sql);
		return user;
	}

	/**
	 * 冻结用户
	 */
	public boolean delUser(String userName,int d) {
		if (dao.delUser(userName,d) > 0) {
			return true;
		}
		return false;
	}

	/**
	 * 初始化密码
	 */
	public boolean cshPassword(String userName) {
		if (dao.cshPassword(userName) > 0) {
			return true;
		}
		return false;
	}
	/**
	 * 查询此帐号
	 */
	public boolean cxzh(String userName){
		if(dao.cxzh(userName)<1){//不存在此帐号
			return true;
		}
		return false;
	}
	/**
	 * 修改密码
	 */
	public boolean updatepsw(String userName ,String yuanpsw,String xinpsw){
		if(dao.updatepsw(userName, yuanpsw, xinpsw)>0){
			return true;
		}
		return false;
	}
}
