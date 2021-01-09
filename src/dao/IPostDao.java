package dao;

import java.util.List;



import model.Post;

public interface IPostDao {
	/**
	 * 发布公告
	 */
	public int fbPost(String title, String content);
	/**
	 * 删除公告
	 */
	public int delPost(int post_id) ;

	/**
	 * 公告列表
	 */
	public List<Post> selPost(String sql);
	/**
	 * 查询单个公告详情
	 */
	public Post selPost(int post_id);

}
