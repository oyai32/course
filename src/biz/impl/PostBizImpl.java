package biz.impl;

import java.util.List;



import dao.IPostDao;
import dao.impl.PostDaoImpl;

import model.Post;
import biz.IPostBiz;

public class PostBizImpl implements IPostBiz {
	IPostDao dao = new PostDaoImpl();

	public boolean fbPost(String title, String content) {
		if (dao.fbPost(title, content) > 0) {
			return true;
		} else {
			return false;
		}

	}

	public boolean delPost(int post_id) {
		if (dao.delPost(post_id) > 0) {
			return true;
		} else {
			return false;
		}
	}

	public List<Post> selPost(String sql) {
		List<Post> list = dao.selPost(sql);
		if (list != null) {
			return list;
		}
		return null;
	}
	/**
	 * 查询单个公告详情
	 */
	public Post selPost(int post_id) {
		Post post=dao.selPost(post_id);
		return post;

	}

}
