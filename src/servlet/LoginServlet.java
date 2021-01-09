package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.Response;

import model.Post;
import model.User;

import biz.IPostBiz;
import biz.IUserBiz;
import biz.impl.PostBizImpl;
import biz.impl.UserBizImpl;

import util.DBUtils;

public class LoginServlet extends HttpServlet {

	IUserBiz ub=new UserBizImpl();
	IPostBiz pb=new PostBizImpl();
	public LoginServlet() {
		super();
	}

	public void destroy() {
		super.destroy();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);

	}
/**
 * 登录与注册
 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession session= request.getSession();
		PrintWriter out=response.getWriter();
		
		String p=request.getParameter("p");//register：注册  login：登录
		User u=new User();
		//---------------------------------注册------------------------
		if("register".equals(p)){
			String userName=request.getParameter("userName");
			String school=request.getParameter("school");
			String name=request.getParameter("name");
			String password=request.getParameter("psd");
			if(ub.register(userName, password, name, school)){//将数据插入user表,注册成功
				u.setUserName(userName);
				u.setPassword(password);
				u.setSchool(school);
				u.setName(name);
				u.setRole(3);
				session.setAttribute("user", u);//把名字存入session
				response.sendRedirect("/course/index.jsp");
			}
		}
		//--------------------------------登录------------------------
		else if("login".equals(p)){		
			int role=Integer.parseInt(request.getParameter("role"));
			String userName=request.getParameter("userName");
			String password=request.getParameter("password");
			if(role==1){//管理员登录
				String sql="select * from user where userName='"+userName+"' and password='"+password+"' and role=1";
				u =ub.login(sql);//查找用户，返回用户信息
				if(u!=null){//存在此用户
					session.setAttribute("user", u);//用户信息存于session
					response.sendRedirect("/course/backindex.jsp");
				}else{
					response.sendRedirect("/course/backstage/backlogin.jsp");
				}
			}else{//不是管理源
				String sql="select * from user where userName='"+userName+"' and password='"+password+"' and role!=1 and del=1";
				u =ub.login(sql);//查找用户，返回用户信息
				if(u!=null){//存在此用户
					session.setAttribute("user", u);//用户信息存于session
				}
				response.sendRedirect("/course/index.jsp");
			}
			
		}
		//-------------用户注销
		else if("logout".equals(p)){
			session.removeAttribute("user");
			out.flush();
			out.close();
		}else if("zh".equals(p)){//检测帐号是否可用
			String userName=request.getParameter("userName");
			if(ub.cxzh(userName)){//帐号可用
				out.print(1);
			}else{
				out.print(0);
			}
			out.flush();
			out.close();
		}else if("cslogin".equals(p)){//超时后登录
			String userName=request.getParameter("userName");
			String password=request.getParameter("password");
			String sql="select * from user where userName='"+userName+"' and password ='"+password+"'";
			u=ub.login(sql);
			if(u!=null){
				session.setAttribute("user", u);//用户信息存于session
			}
			out.flush();
			out.close();
		}

	}

	public void init() throws ServletException {
	}

}
