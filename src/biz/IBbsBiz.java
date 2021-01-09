package biz;

import java.util.List;

import model.Bbs;
import model.Reply;

public interface IBbsBiz {
	/**
	 * 创建新帖
	 */
	public boolean createBbs(String title, String subject, String content, int u_id) ;
	/**
	 *  查询单条内容
	 */
	public Bbs selDanBbs(int bbs_id);
	/**
	 * 添加回复
	 */
	public boolean addReply( int u_id,int bbs_id,String content);
	/**
	 * 搜索帖子
	 * p:搜索类型
	 */
	public List<Bbs> selBbs(String sql);
	/**
	 *  查询贴下所有回复
	 */
	public List<Reply> selReply(int bbs_id);
	/**
	 * 查询帖子个数
	 */
	public int countBbs(String sql);
}