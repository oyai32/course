package filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.User;


public class LoginFilter extends HttpServlet implements Filter {

	
	private static List<String> list=new ArrayList<String>();
	
	static{
		list.add("/course/jsp/coursevideo.jsp");
		list.add("/course/index.jsp");
		list.add("/course/jsp/coursecenter.jsp");
		list.add("/course/jsp/wenxue.jsp");
	}
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	public void init(FilterConfig arg0) throws ServletException {

	}
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain filterChain) throws IOException, ServletException {
              response.setCharacterEncoding("utf-8");
		//获得下面代码中request，response，session对象
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp=(HttpServletResponse) response;
		HttpSession session = req.getSession();
		// 获取访问的url
		String requestUrl = req.getRequestURI();
		//从session里面取用户的用户名
		User user=(User)session.getAttribute("user");
		//登陆页面无需过滤
		String ctxPath = req.getContextPath();
//		String[] split = requestUrl.split("/");
		if(list.contains(requestUrl)||requestUrl.indexOf(".jpg")>0||requestUrl.indexOf(".png")>0||requestUrl.indexOf(".gif")>0){
			filterChain.doFilter(req,resp);
			return;
		}
		//判断如果没有取到用户信息，就跳转到登陆页面
		if(user==null||"".equals(user)){
			//跳转到登陆页面
			resp.sendRedirect(ctxPath+"/index.jsp");
		}else{
			//已经登录，继续此次请求
			filterChain.doFilter(request,response);
		}
		
		
	}
	public void destroy(){
		
	}

}
