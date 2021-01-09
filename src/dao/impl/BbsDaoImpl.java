package dao.impl;

import java.util.List;


import dao.IBbsDao;

import model.Bbs;
import model.Reply;
import util.DBUtils;

public class BbsDaoImpl implements IBbsDao {
	/**
	 * 创建新帖
	 */
	public int createBbs(String title, String subject, String content, int u_id) {
		String sql = "insert into bbs (title,subject,content,u_id,create_time) values(?,?,?,?,CURDATE())";
		int a = DBUtils.update(sql, title, subject, content, u_id);
		return a;
	}

	/**
	 * 添加回复
	 */
	public int addReply(int u_id, int bbs_id, String content) {
		String sql = "insert into reply (u_id,bbs_id,content,create_time) values(?,?,?,now())";
		int a = DBUtils.update(sql, u_id, bbs_id, content);
		return a;
	}

	/**
	 * 搜索帖子
	 */
	public List<Bbs> selBbs(String sql) {
		List<Bbs> list = DBUtils.queryList(sql, Bbs.class);
		return list;
	}

	/**
	 * 查询单条内容
	 */
	public Bbs selDanBbs(String sql) {
		Bbs bbs = DBUtils.query(sql, Bbs.class);
		return bbs;
	}
	/**
	 * 查询帖子个数
	 */
	public int countBbs(String sql){
		return DBUtils.count(sql);
	}
	/**
	 * 查询贴下所有回复
	 */
	public List<Reply> selReply(int bbs_id) {
		String sql = "select r.*,u.name from reply r,user u where r.u_id=u.u_id and bbs_id=?";
		List<Reply> list = DBUtils.queryList(sql, Reply.class, bbs_id);
		return list;
	}
}