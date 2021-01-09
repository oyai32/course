package util;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.MissingResourceException;
import java.util.ResourceBundle;




public class DBUtils {
	private static ResourceBundle resourceBundle; // 资源束对象
	// SQL数据库引擎
	private static String driver = "com.mysql.jdbc.Driver";
	// 数据源
	private static String connectDB;
	// 用户名
	private static String userName;
	// 密码
	private static String password;

	public static Connection conn = null;

	/**
	 * 获得连接
	 * 
	 * @return
	 */
	public static Connection getConn() {
		try {
			// 从配置文件中读取
			try {
				resourceBundle = ResourceBundle.getBundle("database");
			} catch (MissingResourceException e) {
				e.printStackTrace();
			}
			String ip = resourceBundle.getString("ip");
			String port = resourceBundle.getString("port");
			String dbname = resourceBundle.getString("dbname");
			userName = resourceBundle.getString("account");
			password = resourceBundle.getString("password");
			connectDB = "jdbc:mysql://" + ip + ":" + port + "/" + dbname
					+ "?characterEncoding=utf-8";
			// System.out.println("connectDB:"+connectDB);
			// 创建连接
			Class.forName(driver);
			conn = DriverManager.getConnection(connectDB, userName, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

	/**
	 * 关闭链接释放资源
	 * 
	 */
	private static void close(ResultSet rs, PreparedStatement pst,
			Connection conn) {
		try {
			if (rs != null)
				rs.close();
			if (pst != null)
				pst.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	
  /**
   * 增删改
   * @param sql
   * @param objs
   * @return
   */
	public static int update(String sql, Object... objs) {
		Connection conn = null;
		PreparedStatement pst = null;
		try {
			conn = getConn();
			pst = conn.prepareStatement(sql);
			for (int i = 0; i <objs.length; i++) {
				pst.setObject((i + 1), objs[i]);
			}
			return pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(null, pst, conn);
		}
		return -1;
	}
	 /**
	  * 查询结果为一条
	  * @param sql
	  * @param objs
	  * @return
	  */
	public static <T> T query(String sql,Class<T> t,Object...objs){
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs=null;
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			conn=getConn();
			pst=conn.prepareStatement(sql);
			for (int i = 0; i < objs.length; i++) {
				pst.setObject((i + 1), objs[i]);
			}
			rs=pst.executeQuery();
			if (rs != null && rs.next()) {
				map = rsToMap(rs);
				return mapToBean(t,map);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs,pst,conn);
		}
		return null;
	}
	
	 /**
	  * 查询一个字段的数据
	  * @param sql
	  * @param objs
	  * @return
	  */
	public static Object selOne(String sql,Object...objs){
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs=null;

		try {
			conn=getConn();
			pst=conn.prepareStatement(sql);
			for (int i = 0; i < objs.length; i++) {
				pst.setObject((i + 1), objs[i]);
			}
			rs=pst.executeQuery();
			if (rs != null && rs.next()) {
				return rs.getObject(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs,pst,conn);
		}
		return null;
	}
	
	
	/**
	  * 查询数量
	  * @param sql
	  * @param objs
	  * @return
	  */
	public static int count(String sql,Object...objs){
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs=null;
		try {
			conn=getConn();
			pst=conn.prepareStatement(sql);
			for (int i = 0; i < objs.length; i++) {
				pst.setObject((i + 1), objs[i]);
			}
			rs=pst.executeQuery();
			if (rs != null && rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs,pst,conn);
		}
		return 0;
	}
	/**
	 * 查询结果为多条
	 * @param sql
	 * @param objs
	 * @return
	 */
   public static <T> List<T> queryList(String sql,Class<T> t,Object...objs){
	  List<T> list=new ArrayList<T>();
	  Connection conn=null;
	  PreparedStatement pst=null;
	  ResultSet rs=null;
	  try {
		  conn=getConn();
		pst=conn.prepareStatement(sql);
		for(int i=0;i<objs.length;i++){
			pst.setObject(i+1, objs[i]);
		}
		rs=pst.executeQuery();
		while(rs.next()){
			list.add(mapToBean(t,rsToMap(rs)));
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}finally{
		close(rs, pst, conn);
	}
	return list;
   }
	/**
	 * resultset 转换 MAP
	 * @param rs
	 * @return
	 * @throws SQLException
	 */
	private static Map<String,Object> rsToMap(ResultSet rs) throws SQLException{
		Map<String, Object> map = new HashMap<String, Object>();
		ResultSetMetaData rsm=rs.getMetaData();
		int count=rsm.getColumnCount();
		for(int i=1;i<=count;i++){
			String key = rsm.getColumnLabel(i).replace("_", "").toUpperCase();
			Object value = rs.getObject(rsm.getColumnLabel(i));
			map.put(key, value);
		}
		return map;
	}
	/**
	 * 把Map转化为bean对象
	 * @param <T>
	 * @param t
	 * @param map
	 * @return
	 */
	 private static <T> T mapToBean(Class<T> t,Map<String,Object> map){
		 T obj=null;
		    try {
		    	obj=t.newInstance();
			Method[] method=t.getDeclaredMethods();
				for (Method mtd : method) {
				  String mtdname=mtd.getName();
				  if(mtdname.startsWith("get")){
					  continue;
				  }
				  if(mtdname.startsWith("set")){
					  String paramName=(mtdname.substring(3).replace("_","")).toUpperCase();
					  if(mtd.getParameterTypes()[0].equals(Integer.class)||mtd.getParameterTypes()[0].equals(int.class)){
						  if(map.get(paramName)!=null)
							  
						  mtd.invoke(obj,Integer.parseInt(map.get(paramName).toString()));
				  }else if(mtd.getParameterTypes()[0].equals(String.class)){
					  if(map.get(paramName)!=null)
						  mtd.invoke(obj,map.get(paramName));
					  }else if(mtd.getParameterTypes()[0].equals(Float.class)||mtd.getParameterTypes()[0].equals(float.class)){
						  if (map.get(paramName) != null)
						  mtd.invoke(obj,Float.parseFloat(map.get(paramName).toString()));
					  }
				    }
				  } 
		        }catch (IllegalAccessException e) {
						e.printStackTrace();
					} catch (IllegalArgumentException e) {
						e.printStackTrace();
					} catch (InvocationTargetException e) {
						e.printStackTrace();
					} catch (InstantiationException e) {
						e.printStackTrace();
				  }
				return obj;
	}
	 
	
}
