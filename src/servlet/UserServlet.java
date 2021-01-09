package servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import biz.IUserBiz;
import biz.impl.UserBizImpl;

import model.User;

public class UserServlet extends HttpServlet {
	IUserBiz ub=new UserBizImpl();
	public UserServlet() {
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
		HttpSession session= request.getSession();
		PrintWriter out=response.getWriter();
		String type=request.getParameter("type");
		if("search".equals(type)){
			String userName=request.getParameter("userName");
			System.out.println(userName);
			String sql="select * from user where userName='"+userName+"'";
			User seluser=ub.selUser(sql);
			request.setAttribute("seluser", seluser);
			request.getRequestDispatcher("/backstage/usermanager.jsp").forward(request, response);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession session= request.getSession();
		PrintWriter out=response.getWriter();
		String type=request.getParameter("type");
		if("del".equals(type)||"csh".equals(type)){
			String userName=request.getParameter("userName");
			if("del".equals(type)){
				int d=Integer.parseInt(request.getParameter("d"));//解冻：1 冻结 0
				if(ub.delUser(userName,d))
					out.print(1); 
			}else if("csh".equals(type)){
				if(ub.cshPassword(userName))
					out.print(1);
			}
			
			out.flush();
			out.close();
		}else if("add".equals(type)){
			String userName=request.getParameter("userName");
			String name=request.getParameter("name");
			String school=request.getParameter("school");
			String[] subjects=request.getParameterValues("subject");
			String subject="";
			for(int i=0;i<subjects.length;i++){
				subject=subject+subjects[i]+",";
			}
			ub.addTeacher(userName, "000000", name, school, subject);
			request.getRequestDispatcher("/backstage/success.jsp").forward(request, response);

		}else if("updatepsw".equals(type)){
			String yuanpsw=request.getParameter("yuanpsw");
			String xinpsw=request.getParameter("xinpsw");
			User user=(User) session.getAttribute("user");
			String userName=user.getUserName();
			if(ub.updatepsw(userName, yuanpsw, xinpsw)){
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
