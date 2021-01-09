<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/commons/taglib.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<title>试卷列表</title>

<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="this is my page">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${ctx }/css/rpage.css">


</head>

<body>
	<div class="title-back"></div>
	<h3>文学类</h3>

	<div class="topic-lie">
		<a href="#">c语言基础题</a>
		<p>
			<a href="#">c语言练习题</a>
		<p>
			<a href="#">c语言竞赛题</a>
		<p>
			<a href="#">c语言基础题</a>
		<p>
			<a href="#">c语言练习题</a>
		<p>
			<a href="#">c语言竞赛题</a>
	</div>




</body>
</html>
