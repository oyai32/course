package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import model.Post;

import biz.IPostBiz;
import biz.impl.PostBizImpl;

public class PostServlet extends HttpServlet {
	IPostBiz postBiz = new PostBizImpl();

	public PostServlet() {
		super();
	}

	public void destroy() {
		super.destroy();
	}

	/**
	 * 后台公告管理
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String b = request.getParameter("b");// 页面传来的标记
		if ("lie".equals(b)) {// 获取公告列表
			String sql = "select * from post order by create_time desc";
			List<Post> plist = postBiz.selPost(sql);
			request.setAttribute("plist", plist);
			request.getRequestDispatcher("/backstage/post.jsp").forward(
					request, response);

		}else if("dan".equals(b)){
			int post_id=Integer.parseInt(request.getParameter("id"));
			Post post=postBiz.selPost(post_id);
			request.setAttribute("post", post);
			request.getRequestDispatcher("/jsp/postdetail.jsp").forward(
					request, response);
		}
	}

	/**
	 * 首页的公告栏
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String type = request.getParameter("type");
		if ("fb".equals(type)) {// 发布公告
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			System.out.println(title + "-----" + content);
			System.out.println(postBiz.fbPost(title, content));

		} else if ("all".equals(type)) {
			String sql = "select * from post order by create_time desc limit 0,5";
			List<Post> plist = postBiz.selPost(sql);
			String json = null;
			if (plist != null) {
				json = JSONArray.fromObject(plist).toString();
			}
			out.write(json);
		}else if ("del".equals(type)) {// 删除公告
			int post_id = Integer.parseInt(request.getParameter("id"));
			if(postBiz.delPost(post_id)){
				out.print(1);
			}else{
				out.print(0);
			}
		}
		out.flush();
		out.close();
	}

	public void init() throws ServletException {
	}

}
