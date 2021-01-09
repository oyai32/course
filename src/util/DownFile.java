package util;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.OutputStream;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
/**
 * 下载文件的方法
 * @author Administrator
 *
 */
public class DownFile {

	public static void downFile(File file,HttpServletResponse response,String filename, OutputStream out) throws IOException{


        //设置response的编码方式
        response.setContentType("application/x-msdownload");

        //写明要下载的文件的大小
        response.setContentLength((int)file.length());

        //设置附加文件名
       // response.setHeader("Content-Disposition","attachment;filename="+filename);
        
        //解决中文乱码
        response.setHeader("Content-Disposition","attachment;filename="+new String(filename.getBytes("utf-8"),"iso-8859-1"));       

        //读出文件到i/o流
		try {
			FileInputStream fis = new FileInputStream(file);
			BufferedInputStream buff=new BufferedInputStream(fis);
			byte [] b=new byte[1024];//相当于我们的缓存
			
			long k=0;//该值用于计算当前实际下载了多少字节
			//开始循环下载
			while(k<file.length()){
				int j=buff.read(b,0,1024);
				k+=j;
				//将b中的数据写到客户端的内存
				out.write(b,0,j);
			}
			//buff.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}


	}
}
