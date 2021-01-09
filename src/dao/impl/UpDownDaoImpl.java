package dao.impl;

import java.util.List;

import dao.IUpDownDao;

import model.Upload;

import util.DBUtils;

/**
 * 上传下载
 * 
 * @author Administrator
 * 
 */
public class UpDownDaoImpl implements IUpDownDao {
	/**
	 * 上传文件
	 * 
	 * @return
	 */
	public int upFile(String subject, String title, String path, String ext,
			int u_id, String size) {
		String sql = "insert into upload (subject,title,path,ext,u_id,size,upload_time) values(?,?,?,?,?,?,CURDATE())";
		return DBUtils.update(sql, subject, title, path, ext, u_id, size);
	}

	/**
	 * 查询所有文件
	 * 
	 * @return
	 */
	public List<Upload> selUpload(String sql) {
		return DBUtils.queryList(sql, Upload.class);
	}
	/**
	 * 删除文件
	 */
	public int delUpload(int upload_id){
		String sql="update upload set del=0 where upload_id=?";
		return DBUtils.update(sql, upload_id);
	}
	/**
	 * 查询文件个数
	 */
	public int countUpload(String sql){
		int a=DBUtils.count(sql);
		return a;
	}
}
