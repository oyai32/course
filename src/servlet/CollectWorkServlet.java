package servlet;

import java.io.File;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.DBUtils;
import util.DownFile;

import model.HomeWork;
import model.User;

import biz.IHomeWorkBiz;
import biz.impl.HomeWorkBizImpl;
/**
 * 老师收取作业，查询作业
 * @author Administrator
 *
 */
public class CollectWorkServlet extends HttpServlet {
	IHomeWorkBiz hb=new HomeWorkBizImpl();
	public CollectWorkServlet() {
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
		String name=user.getName();
//		String consignee="李明";
//		int u_id = 1;// 默认
		String type = request.getParameter("type");
		String sql=null;
		List<HomeWork> homeWorkList=null;
		request.setAttribute("type", type);
		if("all".equals(type)){
			sql="select subject from user where name=?";
			String subjects=DBUtils.selOne(sql, name).toString();
			String subjectList[]=subjects.split(",");//该教师所教的科目
			sql="select give_time from homework where consignee=? order by give_time desc limit 0,1";//最近的一次布置日期
			Object give_time=DBUtils.selOne(sql, name);
			System.out.println(give_time+"----------");
			request.setAttribute("give_time", give_time);
			List<Integer> countList=new ArrayList<Integer>();
			List<String> weiNamesList=new ArrayList<String>();
			for(int i=0;i<subjectList.length;i++){
				System.out.println(subjectList[i]);
				//查询每个科目的未交人数
				sql="select count(1) from homework where consignee='"+name+"'  and subject ='"+subjectList[i]+"' and give_time = '"+give_time+"' ";
				System.out.println(sql+"/n-----------"+hb.countCollect(sql));
				countList.add(hb.countCollect(sql));
				//查询每个科目的未交人姓名
				sql="select * from user where u_id not in(select u_id from homework where consignee='"+name+"'  and subject ='"+subjectList[i]+"' and  give_time = '"+give_time+"'  ) and role=3";
				List<User> weiUsers=hb.weiUsers(sql);
				String weiNames="";
				for(int j=0;j<weiUsers.size();j++){
					weiNames=weiNames+","+weiUsers.get(j).getName();
				}
				System.out.println(sql+"/n-----------"+weiNames);
				weiNamesList.add(weiNames);
			}
			request.setAttribute("subjectList", subjectList);
			request.setAttribute("countList", countList);
			request.setAttribute("weiNamesList", weiNamesList);
			request.getRequestDispatcher("/jsp/shouhomework.jsp").forward(request, response);
		}else if("search".equals(type)){
			String subject = new String(request.getParameter("subject").getBytes("iso8859-1"), "utf-8");
			String give_time=request.getParameter("give_time");
			request.setAttribute("give_time", give_time);
			sql="select h.*,u.name from homework h,user u where h.u_id=u.u_id and  consignee='"+name+"'  and h.subject ='"+subject+"' and give_time = '"+give_time+"' order by give_time desc ";
			homeWorkList=hb.selHomeWork(sql);
			sql="select count(1) from homework where consignee='"+name+"'  and subject ='"+subject+"' and give_time = '"+give_time+"' ";
			request.setAttribute("count", hb.countCollect(sql));
			sql="select * from user where u_id not in(select u_id from homework where consignee='"+name+"'  and subject ='"+subject+"' and  give_time = '"+give_time+"'  ) and role=3";
			List<User> weiUsers=hb.weiUsers(sql);
			request.setAttribute("weiUsers", weiUsers);
			request.setAttribute("homeWorkList", homeWorkList);
			request.getRequestDispatcher("/jsp/shouhomework.jsp?subject="+subject).forward(request, response);
		}else if("down".equals(type)){
			  //解决中文乱码问题
	        String filename=new String(request.getParameter("filename").getBytes("iso-8859-1"),"utf-8");
	        System.out.println("down----------"+filename);
	        //创建file对象
	        String path=this.getServletConfig().getServletContext().getRealPath("/");
	        OutputStream out=response.getOutputStream();
	
	        	File file=new File(path+"//upload//"+filename);
	        	//从response对象中得到输出流,准备下载
	        	DownFile.downFile(file, response,filename, out);//下载文件
	       
	        //将写入到客户端的内存的数据,刷新到磁盘
	        	
	        out.flush();
	        out.close();
		}
		
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
        String subject=request.getParameter("subject");
        String give_time=request.getParameter("give_time");
        byte[] buffer = new byte[1024];
        String path=this.getServletConfig().getServletContext().getRealPath("/");
        // 生成的ZIP文件名
        String strZipName = "【"+subject+"】"+give_time+".zip";
        System.out.println(strZipName);
        ZipOutputStream out = new ZipOutputStream(new FileOutputStream("C:\\Users\\Administrator\\Desktop\\"+strZipName));
        //解决中文乱码问题
        String filenames=request.getParameter("filenames");
        System.out.println("filenames-------------"+filenames);
        String filename[]=filenames.split(",");
        
        // 需要同时下载的几个文件
        
    //    File[] file1 = { new File("C:/log_client.txt"), new File("C:/360AppLoader.exe"), new File("C:/56656.txt")};
        File[] file1 = new File[filename.length];
        for(int j=0;j<filename.length;j++){
        	file1[j]=new File(path+"//upload//"+filename[j]);
        }
        for (int i = 0; i < file1.length; i++)
        {
            FileInputStream fis = new FileInputStream(file1[i]);
            out.putNextEntry(new ZipEntry(file1[i].getName()));
            int len;
            // 读入需要下载的文件的内容，打包到zip文件
            while ((len = fis.read(buffer)) > 0)
            {
                out.write(buffer, 0, len);
            }
            out.closeEntry();
            fis.close();
        }
        out.flush();
        out.close();
        System.out.println("生成.zip成功");
	}

	
	public void init() throws ServletException {
		
	}

}
