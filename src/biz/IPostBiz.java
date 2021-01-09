package biz;

import java.util.List;

import model.Post;

public interface IPostBiz {
	/**
	 * 发布公告
	 */
	public boolean fbPost(String title, String content);

	/**
	 * 删除公告
	 */
	public boolean delPost(int post_id);

	/**
	 * 公告列表
	 */
	public List<Post> selPost(String sql);
	/**
	 * 查询单个公告详情
	 */
	public Post selPost(int post_id);
}
