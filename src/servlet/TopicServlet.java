package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Topic;
import model.User;

import dao.impl.TopicDaoImpl;

import biz.ITopicBiz;
import biz.impl.TopicBizImpl;

public class TopicServlet extends HttpServlet {
	ITopicBiz tb = new TopicBizImpl();

	public TopicServlet() {
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
//		int u_id = 1;// 默认
		String type = request.getParameter("type");
		if ("add".equals(type)||"update".equals(type)) {// 添加、修改题目
			System.out.println(type);
			String subject = request.getParameter("subject");
			String title = request.getParameter("title");
			String optiona = request.getParameter("optiona");
			String optionb = request.getParameter("optionb");
			String optionc = request.getParameter("optionc");
			String optiond = request.getParameter("optiond");
			String answer = request.getParameter("answer");
			String difficulty = request.getParameter("difficulty");
			if("add".equals(type)){
				if (tb.addTopic(subject, title, optiona, optionb, optionc, optiond,
						answer, difficulty, u_id)) {// 添加成功
					out.print(1);
				} else {
					out.print(0);
				}
			}else{

				int t_id=Integer.parseInt(request.getParameter("id"));
				System.out.println(t_id);
				if (tb.updateTopic(t_id, subject, title, optiona, optionb, optionc, optiond, answer, difficulty)) {// 修改成功
					out.print(1);
				} else {
					out.print(0);
				}
			}
			out.flush();
			out.close();
		}else if("search".equals(type)){//题目搜索 
			int pageIndex=Integer.parseInt(request.getParameter("index"));
			int  pageSize=10;//一页5条
			String searchTitle = request.getParameter("searchTitle");
			String title = new String(searchTitle.getBytes("iso8859-1"), "utf-8");
			String sql="select * from topic where title like ?";
			List<Topic> topicLists=tb.selTopic(sql,"%"+title+"%");
			sql="select count(1) from topic where title like '%"+title+"%'";
			int length=tb.countTopic(sql);//总共多少条
			int count=length%pageSize>0?(length/pageSize+1):length/pageSize;
			request.setAttribute("topicLists", topicLists);
			request.setAttribute("count", count);
			request.setAttribute("pageIndex", pageIndex);
			request.getRequestDispatcher("/jsp/topicmanager.jsp?type=search&title="+searchTitle).forward(request, response);
		}else if("clickUpdate".equals(type)){//点击修改
			int t_id=Integer.parseInt(request.getParameter("id"));
			String sql="select * from topic where t_id=?";
			Topic topic=tb.selOneTopic(sql,t_id);
			request.setAttribute("topic",topic);
			request.getRequestDispatcher("/jsp/addtopic.jsp?type=update").forward(request, response);
		}else if("lie".equals(type)){
			int pageIndex=Integer.parseInt(request.getParameter("index"));
			String sql="select * from topic where u_id=? limit ?,?";
			int  pageSize=10;//一页5条
			List<Topic> topicLists=tb.selTopic(sql,u_id,(pageIndex-1)*pageSize,pageSize);
			System.out.println(topicLists);
			sql="select count(1) from topic where u_id="+u_id;
			int length=tb.countTopic(sql);//总共多少条
			int count=length%pageSize>0?(length/pageSize+1):length/pageSize;
			request.setAttribute("topicLists", topicLists);
			request.setAttribute("count", count);
			request.setAttribute("pageIndex", pageIndex);
			request.getRequestDispatcher("/jsp/topicmanager.jsp?type=lie").forward(request, response);
		}else if("del".equals(type)){
			int t_id=Integer.parseInt(request.getParameter("id"));
			if(tb.delTopic(t_id)){
				out.print(1);
			}else{
				out.print(0);
			}
			out.flush();
			out.close();
		}
	}

	public void init() throws ServletException {
	}

}
