package servlet;



import java.io.File;
import java.io.IOException;
import java.io.OutputStream;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.DownFile;

public class DownServlet extends HttpServlet {

	public DownServlet() {
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

		response.setContentType("text/html charset=utf-8");
	        
	        //解决中文乱码问题
	        String title=new String(request.getParameter("title").getBytes("iso-8859-1"),"utf-8");
	        String ext=request.getParameter("ext");
	        String filename=title+"."+ext;
	        //创建file对象
	        String path=this.getServletConfig().getServletContext().getRealPath("/");
	        File file=new File(path+"//upload//"+filename);
	        //从response对象中得到输出流,准备下载
	        OutputStream out=response.getOutputStream();
	        
	        DownFile.downFile(file, response, filename, out);//下载文件
	        //将写入到客户端的内存的数据,刷新到磁盘
	        out.flush();
	        out.close();
	        
 }

	public void init() throws ServletException {
	}

}
