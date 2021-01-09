package biz.impl;

import java.util.List;


import biz.IBbsBiz;


import dao.IBbsDao;
import dao.impl.BbsDaoImpl;

import model.Bbs;
import model.Reply;

public class BbsBizImpl implements IBbsBiz {
	IBbsDao bd=new BbsDaoImpl();
	/**
	 * 创建新帖
	 */
	public boolean createBbs(String title, String subject, String content, int u_id) {
		if(bd.createBbs(title, subject, content, u_id)>0){
			return true;
		}else{
			return false;
		}

	}
	/**
	 *  查询单条内容
	 */
	public Bbs selDanBbs(int bbs_id){
		String 	sql="select b.*,u.name from bbs b,user u where b.u_id=u.u_id and bbs_id="+bbs_id;
		Bbs bbs=bd.selDanBbs(sql);
		if(bbs!=null){
			return bbs;
		}else{
			return null;
		}
	}
	/**
	 * 添加回复
	 */
	public boolean addReply( int u_id,int bbs_id,String content) {
		if(bd.addReply(u_id, bbs_id, content)>0){
			return true;
		}else{
			return false;
		}
	}
	/**
	 * 搜索帖子
	 * p:搜索类型
	 */
	public List<Bbs> selBbs(String sql) {
		List<Bbs> list=bd.selBbs(sql);
		return list;
	}
	/**
	 *  查询贴下所有回复
	 */
	public List<Reply> selReply(int bbs_id) {
		List<Reply> list = bd.selReply(bbs_id);
		if(list.size()>0){
			return list;
		}else{
			return null;
		}
	}
	/**
	 * 查询帖子个数
	 */
	public int countBbs(String sql){
		return bd.countBbs(sql);
	}
}
