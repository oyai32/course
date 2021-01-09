package biz.impl;

import java.util.List;


import biz.IUpDownBiz;

import model.Upload;
import dao.IUpDownDao;
import dao.impl.UpDownDaoImpl;

public class UpDownBizImpl implements IUpDownBiz{
	IUpDownDao ud = new UpDownDaoImpl();

	/**
	 * 上传文件
	 * 
	 * @return
	 */
	public boolean upFile(String subject, String title, String path,
			String ext, int u_id, String size) {
		if (ud.upFile(subject, title, path, ext, u_id, size) > 0) {
			return true;
		}
		return false;
	}

	/**
	 * 查询所有文件
	 * 
	 * @return
	 */
	public List<Upload> selUpload(String sql) {
		List<Upload> list = ud.selUpload(sql);
		if (list.size() > 0) {
			return list;
		} else {
			return null;
		}
	}

	/**
	 * 删除文件
	 */
	public boolean delUpload(int upload_id) {
		if (ud.delUpload(upload_id) > 0) {
			return true;
		} else {
			return false;
		}
	}
	/**
	 * 查询文件个数
	 */
	public int countUpload(String sql){
		return ud.countUpload(sql);
	}
}
