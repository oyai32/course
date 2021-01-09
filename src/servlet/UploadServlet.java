package servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Topic;
import model.Upload;
import model.User;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import biz.IUpDownBiz;
import biz.impl.UpDownBizImpl;

import util.DBUtils;

public class UploadServlet extends HttpServlet {
IUpDownBiz ub=new UpDownBizImpl();
	public UploadServlet() {
		super();
	}

	public void destroy() {
		super.destroy();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html charset=utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out=response.getWriter();
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		 int u_id=user.getU_id();
//		int u_id = 1;// 默认
		String type=request.getParameter("type");
		String sql=null;
		if("my".equals(type)){
			int pageIndex=Integer.parseInt(request.getParameter("index"));//页面上传来的页面
			int  pageSize=5;//一页5条
			sql="select u.*,a.name from upload u,user a where a.u_id=u.u_id  and a.u_id="+u_id+" and u.del=1 order by upload_time desc  limit "+(pageIndex-1)*pageSize+","+pageSize;
			List<Upload> uploadList=ub.selUpload(sql);
			request.setAttribute("uploadList", uploadList);
			sql="select count(1) from upload where del=1 and u_id="+u_id ;
			int length=ub.countUpload(sql);//总共多少条
			int count=length%pageSize>0?(length/pageSize+1):length/pageSize;
			request.setAttribute("count", count);
			request.setAttribute("pageIndex", pageIndex);
			request.getRequestDispatcher("/jsp/myupload.jsp").forward(request, response);
		}else if("all".equals(type)||("search").equals(type)){
			int pageIndex=Integer.parseInt(request.getParameter("index"));//页面上传来的页面
			int  pageSize=10;//一页5条
			if("all".equals(type)){
				sql="select u.*,a.name from upload u,user a where a.u_id=u.u_id and u.del=1 order by upload_time desc   limit "+(pageIndex-1)*pageSize+","+pageSize;
				List<Upload> uploadList=ub.selUpload(sql);
				request.setAttribute("uploadList", uploadList);
				sql="select count(1) from upload where del=1";
				request.setAttribute("type", "all");
			}else{
				String title = new String(request.getParameter("searchTitle").getBytes("iso8859-1"), "utf-8");
				sql="select u.*,a.name from upload u,user a where u.del=1 and a.u_id=u.u_id and title like'%"+title+"%' order by upload_time desc   limit "+(pageIndex-1)*pageSize+","+pageSize;
				List<Upload> uploadList=ub.selUpload(sql);
				request.setAttribute("uploadList", uploadList);
				sql="select count(1) from upload where del=1 and title like'%"+title+"%'";
				request.setAttribute("type", "search");
				request.setAttribute("title", title);
			}
			int length=ub.countUpload(sql);//总共多少条
			int count=length%pageSize>0?(length/pageSize+1):length/pageSize;
			request.setAttribute("count", count);
			request.setAttribute("pageIndex", pageIndex);
			request.getRequestDispatcher("/jsp/upordown.jsp?type="+type).forward(request, response);
		}else if("del".equals(type)){
			int upload_id=Integer.parseInt(request.getParameter("id"));
			if(ub.delUpload(upload_id)){
				out.print(true);
			}else{
				out.print(false);
			}
			out.flush();
			out.close();
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html charset=utf-8");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		 int u_id=user.getU_id();
		String ext=null;
		String path = null;
		String size=null;
		try {
			// 创建文件项工厂
			DiskFileItemFactory factory = new DiskFileItemFactory();
			// 创建解析请求数据的ServletFileUpload对象
			ServletFileUpload upload = new ServletFileUpload(factory);
			// 解析request请求把流装入到list中
			List<FileItem> list = upload.parseRequest(request);
			HashMap<String, String> map = new HashMap<String, String>();
			for (int i = 0; i < list.size(); i++) {
				// 把各个流装入到item中
				FileItem item = list.get(i);
				if (item.isFormField()) {// 判断当前fileitem是否是表单中的字段
					String key = item.getFieldName();
					map.put(key,
							new String(item.getString().getBytes("iso-8859-1"),
									"utf-8"));
				} else {// 当fileitem是文件流时
					// 文件后缀
					String filename = item.getName();
					ext =filename.substring(filename.lastIndexOf(".")+1);
					String newname= map.get("title")+"."+ext;
					String newpath = request.getRealPath("/upload") + "/" +newname;
				//	System.out.println("--newpath----" + newpath);
					size=convertFileSize(item.getSize());
					item.write(new File(newpath));
					path = request.getContextPath()+"/upload/"+newname;
					//System.out.println(path + "-----------------路径");
				}
			}
			//存储信息
			if(ub.upFile(map.get("subject"),map.get("title"),path,ext,u_id,size)){
				request.getRequestDispatcher("/jsp/success.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	/**
	 *  大小格式换算
	 * @param size
	 * @return
	 */
	public static String convertFileSize(long size) {
	        long kb = 1024;
	        long mb = kb * 1024;
	        long gb = mb * 1024;
	 
	        if (size >= gb) {
	            return String.format("%.1f GB", (float) size / gb);
	        } else if (size >= mb) {
	            float f = (float) size / mb;
	            return String.format(f > 100 ? "%.0f MB" : "%.1f MB", f);
	        } else if (size >= kb) {
	            float f = (float) size / kb;
	            return String.format(f > 100 ? "%.0f KB" : "%.1f KB", f);
	        } else
	            return String.format("%d B", size);
	    }

	public void init() throws ServletException {
	}

}
