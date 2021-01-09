<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/commons/taglib.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="${ctx }">
<title>精品课程网----后台管理</title>


<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript">
var ctx='${ctx}';
</script>
<script src="${ctx }/js/jquery.js"></script>
<script src="${ctx }/js/back.js"></script>
<style type="text/css">
table{
margin:40px auto 0px auto;line-height: 25px;}
body {
	padding: 0px;
	margin: 0px;
}

.title-back {
	height: 10px;
	background: #2777AD;
	margin-top: 20px;
}
h3 {
	margin: -16px 0px 0px 10px;
	padding: 0px 10px;
	background: white;
	width: 100px;
	font-size: 16px;
	text-align: center;
	color: #303A4F;
}
#tishi{
text-align: center;
color:red;
font-size:14px;
margin-top:-30px;}
</style>


</head>

<body>
		<div class="title-back"></div>
	<h3>添加教师</h3>
	<form action="${ctx }/servlet/UserServlet?type=add" method="post"
		onsubmit="return check(2)"> 
		<table>
			<tr>
				<td>帐号:</td>
				<td><input name="userName" onkeyup="check(1)"/>
				</td>
			</tr>
			<tr>
				<td>姓名:</td>
				<td><input name="name" />
				</td>
			</tr>
			<tr>
				<td>学校:</td>
				<td><input name="school"  />
				</td>
			</tr>
			<tr>
				<td>科目:</td>
				<td><input type="checkbox" name="subject" value="Java"/>Java  <input type="checkbox" name="subject" value="C语言"/>C语言<p>
				<input type="checkbox" name="subject" value="计算机导论"/>计算机导论 <input type="checkbox" name="subject" value="高等数学"/>高等数学
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;height:80px;"><input
					type="submit" value="添加" /><input type="reset" />
				</td>
			</tr>
		</table>
	</form>
	<div id="tishi"></div>
</body>
</html>
