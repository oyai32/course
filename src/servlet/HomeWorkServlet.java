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

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import biz.IHomeWorkBiz;
import biz.impl.HomeWorkBizImpl;

import model.HomeWork;
import model.User;
/**
 * 学生提交作业，查询作业
 * @author Administrator
 *
 */
public class HomeWorkServlet extends HttpServlet {
IHomeWorkBiz hb=new HomeWorkBizImpl();
	public HomeWorkServlet() {
		super();
	}

	public void destroy() {
		super.destroy();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		String user_name=user.getName();
		 int u_id=user.getU_id();
		//int u_id = 1;// 默认
		String type = request.getParameter("type");
		String sql=null;
		if("all".equals(type)){
			sql="select * from homework where u_id="+u_id+" order by submit_time desc";
		
		}else if("search".equals(type)){
			String subject = new String(request.getParameter("subject").getBytes("iso8859-1"), "utf-8");
			String start_time=request.getParameter("start_time");
			String end_time=request.getParameter("end_time");
			sql="select * from homework where u_id="+u_id+" and subject ='"+subject+"' and give_time between '"+start_time+"' and '"+end_time+"' order by give_time desc ";
		}
		List<HomeWork> homeWorkList=hb.selHomeWork(sql);
		request.setAttribute("homeWorkList", homeWorkList);
		request.getRequestDispatcher("/jsp/tijiaohomework.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		String user_name=user.getName();
		 int u_id=user.getU_id();
//		String user_name="欧阳";
//		int u_id = 1;// 默认
		String newname=null;
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
					String ext =filename.substring(filename.lastIndexOf(".")+1);
					newname="【"+map.get("subject")+"】"+user_name+"("+map.get("give_time")+")."+ext;
					String newpath = request.getRealPath("/upload") + "/" +newname;
				//	System.out.println("--newpath----" + newpath);
					item.write(new File(newpath));
				}
			}
			//存储信息
			if(hb.addHomeWork(map.get("subject"), map.get("give_time"), u_id, map.get("consignee"),newname)){
				request.getRequestDispatcher("/jsp/success.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void init() throws ServletException {
	}

}
