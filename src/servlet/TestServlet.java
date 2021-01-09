package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import biz.ITestBiz;
import biz.impl.TestBizImpl;

import model.Test;
import model.Topic;
import model.User;

public class TestServlet extends HttpServlet {
	ITestBiz tb=new TestBizImpl();
	public TestServlet() {
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
		String  sql=null;
		if("search".equals(type)){//搜索已有科目的试卷
			String subject = new String(request.getParameter("subject").getBytes("iso8859-1"), "utf-8");
			sql="select subject from topic where  subject like '%"+subject+"%' group by subject";
			List<Topic> topicLists=tb.selTopic(sql);//查到现有的科目,返回的是题目对象
			request.setAttribute("topicLists", topicLists);
			request.getRequestDispatcher("/jsp/testlie.jsp?p=search").forward(request, response);
		}else if("create".equals(type)){
			String subject = new String(request.getParameter("subject").getBytes("iso8859-1"), "utf-8");
			int nd=Integer.parseInt(request.getParameter("nd"));
			Map<Integer,String> map=new HashMap<Integer, String>();
			map.put(1, "简单");
			map.put(2, "一般");
			map.put(3, "困难");
			Map<Integer,String> map2=new HashMap<Integer, String>();
			map2.put(1, "基础题");
			map2.put(2, "练习题");
			map2.put(3, "竞赛题");
			request.setAttribute("testTop", subject+map2.get(nd));// 试卷标题
			sql="select * from topic where subject ='"+subject+"' and difficulty='"+map.get(nd)+"'";
			List<Topic> allTopics=tb.selTopic(sql);//查询所有符合的题目
			System.out.println(allTopics);
			List<Topic> topicLists=new ArrayList<Topic>();
			//随机产生题目
			int sj=allTopics.size();
			if(sj>10){//如果题目足够
				int index=0;
				boolean flag=true;
				do{
					index=(int)(Math.random()*sj-1);//随机产生一个数
					Topic t=allTopics.get(index);//拿到相应的对象
					if(topicLists.size()<1){//才产生一个随机对象
						topicLists.add(t);//把随机产生的这个对象放入集合中
					}else{
						for(int i=0;i<topicLists.size();i++){//循环所有题目
							int stid=topicLists.get(i).getT_id();
							if(t.getT_id()==stid){//已存在此题
								flag=false;
								break;
							}else{
								flag=true;
							}
						}
						if(flag){
							topicLists.add(t);//把随机产生的这个对象放入集合中
						}
					}
				}while(topicLists.size()!=10);//循环收取10个题目
				//把该试卷存入试卷表
				String test_id = UUID.randomUUID().toString();//生成唯一id
				tb.createTest(test_id, u_id,topicLists);
				request.setAttribute("test_id", test_id);
			}
			request.setAttribute("topicLists", topicLists);
			request.getRequestDispatcher("/jsp/test.jsp").forward(request, response);
		}else if("pigai".equals(type)){
			String myanswer=request.getParameter("myanswer");
			String test_id=request.getParameter("test_id");
			tb.addAnswer(test_id, myanswer, u_id);//将自己的答案存入答案表
			sql="select * from test where test_id='"+test_id+"'";
			Test test=tb.selDanTest(sql);
			String myAnswerList[]=myanswer.split(",");
			String rightAnswerList[]=test.getAllanswer().split(",");
			//String topicIdList[]=test.getAlltopic().split(",");
			//List<Integer> rightList=new ArrayList<Integer>();
			//装错误了的题的答案，正确的赋值1
			List<String> worryList=new ArrayList<String>();
			
			for(int i=0;i<rightAnswerList.length;i++){
				System.out.println(myAnswerList[i]+"----"+rightAnswerList[i]);
				if(myAnswerList[i].equals(rightAnswerList[i])){//答案正确
					worryList.add("1");
				}else{
					worryList.add(rightAnswerList[i]);
				}
			}
			
		
				String json =  JSONArray.fromObject(worryList).toString();
				System.out.println(json);
				out.write(json);
				out.flush();
				out.close();
		}
	
	}

	public void init() throws ServletException {
	}

}
