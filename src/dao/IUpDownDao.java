package dao;

import java.util.List;

import model.Upload;

public interface IUpDownDao {
	/**
	 * 上传文件
	 * 
	 * @return
	 */
	public int upFile(String subject, String title, String path, String ext,
			int u_id, String size);

	/**
	 * 查询所有文件
	 * 
	 * @return
	 */
	public List<Upload> selUpload(String sql);

	/**
	 * 删除文件
	 */
	public int delUpload(int upload_id);

	/**
	 * 查询文件个数
	 */
	public int countUpload(String sql);
}
