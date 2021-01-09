package biz;

import java.util.List;

import model.Upload;

public interface IUpDownBiz {
	/**
	 * 上传文件
	 * 
	 * @return
	 */
	public boolean upFile(String subject, String title, String path,
			String ext, int u_id, String size) ;

	/**
	 * 查询所有文件
	 * 
	 * @return
	 */
	public List<Upload> selUpload(String sql) ;

	/**
	 * 删除文件
	 */
	public boolean delUpload(int upload_id);
	/**
	 * 查询文件个数
	 */
	public int countUpload(String sql);
}
