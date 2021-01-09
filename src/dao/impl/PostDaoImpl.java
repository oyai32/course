package dao.impl;

import java.util.List;

import dao.IPostDao;

import model.Post;
import util.DBUtils;

public class PostDaoImpl implements IPostDao {

	/**
	 * 发布公告
	 * 
	 * @param title
	 * @param content
	 * @return
	 */
	public int fbPost(String title, String content) {
		String sql = "insert into post (title,content,create_time) values(?,?,now())";
		int a = DBUtils.update(sql, title, content);
		return a;
	}

	/**
	 * 删除公告
	 */
	public int delPost(int post_id) {
		String sql = "delete from post where post_id=?";
		int a = DBUtils.update(sql, post_id);
		return a;
	}

	/**
	 * 公告列表
	 */
	public List<Post> selPost(String sql) {

		List<Post> list = DBUtils.queryList(sql, Post.class);
		return list;
	}

	/**
	 * 查询单个公告详情
	 */
	public Post selPost(int post_id) {
		String sql = "select * from post where post_id=?";
		return DBUtils.query(sql, Post.class, post_id);

	}
}
