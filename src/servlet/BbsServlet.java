package servlet;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import biz.IBbsBiz;
import biz.impl.BbsBizImpl;

import model.Bbs;
import model.Reply;
import model.User;

public class BbsServlet extends HttpServlet {
	IBbsBiz bbiz=new BbsBizImpl();

	public BbsServlet() {
		super();
	}

	public void destroy() {
		super.destroy();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();

		User user = (User) session.getAttribute("user");
		 int u_id=user.getU_id();
		 if(u_id==0){
				request.getRequestDispatcher("/jsp/chaoshi.jsp").forward(request, response);
				return ;
		 }
		String type = request.getParameter("type");
		String  sql=null;
		if("search".equals(type)){//查询
			String  countsql=null;
			int pageIndex=Integer.parseInt(request.getParameter("index"));//页面上传来的页面
			int  pageSize=5;//一页5条
			String p=request.getParameter("p");
			if("title".equals(p)){//按主题查询
				String title = new String(request.getParameter("title").getBytes("iso8859-1"), "utf-8");
				sql="select b.*,u.name from bbs b,user u where  title like '%"+title+"%' and u.u_id=b.u_id order by b.create_time desc  limit "+(pageIndex-1)*pageSize+","+pageSize;
				countsql="select count(1) from bbs  where  title like '%"+title+"%' " ;
				request.setAttribute("title", title);
			}else if("subject".equals(p)){//按科目查询
				String subject = new String(request.getParameter("subject").getBytes("iso8859-1"), "utf-8");
				sql="select b.*,u.name from bbs b,user u where  b.subject like '%"+subject+"%' and u.u_id=b.u_id order by b.create_time desc  limit "+(pageIndex-1)*pageSize+","+pageSize;
				countsql="select count(1)  from bbs  where  subject like '%"+subject+"%' " ;
				request.setAttribute("subject", subject);
			}else if("all".equals(p)){//查询所有
				sql="select b.*,u.name from bbs b,user u where b.u_id=u.u_id order by b.create_time desc  limit "+(pageIndex-1)*pageSize+","+pageSize;
				countsql="select count(1)  from bbs   " ;
			}
			List<Bbs> bbsLists=bbiz.selBbs(sql);
			int length=bbiz.countBbs(countsql);//总条数
			request.setAttribute("bbsLists", bbsLists);
			int count=length%pageSize>0?(length/pageSize+1):length/pageSize;
			request.setAttribute("count", count);
			request.setAttribute("pageIndex", pageIndex);
			request.getRequestDispatcher("/jsp/bbs.jsp?p="+p).forward(request, response);
		}else if("addbbs".equals(type)){
			String subject =request.getParameter("subject");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			if(bbiz.createBbs(title, subject, content, u_id)){
				out.print(1);
			}
			out.flush();
			out.close();
		}else if("dan".equals(type)){//点击进入单个页面
			int bbs_id=Integer.parseInt(request.getParameter("id"));
			sql="select b.*,u.name from bbs b,user u where b.u_id=u.u_id and bbs_id="+bbs_id;
			Bbs bbs=bbiz.selDanBbs(bbs_id);
			request.setAttribute("bbs", bbs);
			List<Reply> replyLists=bbiz.selReply(bbs_id);
			request.setAttribute("replyLists", replyLists);
			request.getRequestDispatcher("/jsp/bbsdan.jsp").forward(request, response);
		}else if("addreply".equals(type)){
			String content = request.getParameter("content");
			int bbs_id=Integer.parseInt(request.getParameter("id"));
			if(bbiz.addReply(u_id, bbs_id, content)){
				out.print(1);			
			}
			out.flush();
			out.close();
		}
	}

	public void init() throws ServletException {
	}

}
