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
<title>师生留言</title>

<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="this is my page">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${ctx }/css/rpage.css">
<script type="text/javascript" src="${ctx }/js/jquery-1.9.1.min.js"></script>
<style type="text/css">
body {
	width: 100%;
	text-align: center;
	overflow: hidden;
}

h2 {
	width: 100%;
	text-align: center;
}

.fbtime {
	font-size:13px;
	text-align: center;
}

textarea {

	font-size: 15px;
	width:90%;
	line-height: 30px;
	margin: 30px auto;
	height: 300px;
	background: white;
	border: 0px;
}
#over{
width:100%;
height:500px;
overflow: auto;}
</style>

</head>

<body onload="can('${ctx}')">
<div id="over">
	<c:set var="p" value="${requestScope.post}"></c:set>

	<h2>${p.title }</h2>
	<div class="fbtime">发布时间:${p.create_time }</div>
	<p>
		<textarea disabled="disabled">${p.content }</textarea>
		</div>
</body>
</html>
