<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../commons/taglib.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'success.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" href="css/index.css">
<style type="text/css">
form {
	border: 1px solid #ccc;
	padding: 30px 60px;
	width: 200px;
	text-align: center;
	margin: 100px auto;
}

a {
	text-align: center;
}

li {
	margin: 10px 0px;
}
</style>
<script src="${ctx }/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("button").click(function() {
			 $.ajax({
		 		type: "post",
		  		url: "servlet/LoginServlet",
		 	 	data:$("#login").serialize()+"&p=cslogin",
		  		success:function(){
		  			window.location.reload();
		 		}
			});
		});
	});
</script>
</head>

<body>
	<form id="login">
		登录超时,请重新登录！
		<p>
		<ul>

			<li>帐号:<input name="userName" />
			</li>
			<li>密码:<input name="password" type="password" /></li>
			<li><button>登录</button>
			</li>
		</ul>
	</form>
</body>
</html>
