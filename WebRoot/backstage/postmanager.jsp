<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../commons/taglib.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>精品课程网----后台管理</title>
<meta name="viewport"
	content="initial-scale = 1.0, maximum-scale = 1.0, user-scalable = no, width = device-width">

<link rel="stylesheet" href="../css/index.css">
<link rel="stylesheet" href="../style.css" media="screen">
<script src="../js/jquery.js"></script>
<script src="../js/script.js"></script>
<script src="../js/back.js"></script>
<style type="text/css">

.title-back {
	height: 10px;
	background: #2777AD;
	margin-top:20px;
}

h3 {
	margin: -16px 0px 0px 10px;
	padding: 0px 10px;
	background: white;
	width: 100px;
	font-size:16px;
	text-align: center;
	color: #303A4F;
}
</style>
</head>
<body>
	<div id="art-main">
		<div class="art-sheet clearfix">
			<header class="art-header">
				<div class="art-shapes" style="font-family: '华文行楷';">精品课程网后台</div>
				<h1 class="art-headline">There is no end to learning.</h1>
			</header>
			<nav class="art-nav">
				<ul class="art-hmenu">
					<li><a href="${ctx }/backindex.jsp" >用户管理</a></li>
					<li><a href="${ctx }/backstage/postmanager.jsp" class="active">公告管理</a>
					</li>

				</ul>
			</nav>
		
			<!-- --------------------------中间------------------------ -->
			<div class="art-layout-wrapper" id="back-iframe">
				 <iframe scrolling="no" name="main" src="${ctx }/servlet/PostServlet?b=lie"></iframe> 
			</div>





		</div>
		<footer class="art-footer">
			<div class="art-footer-inner">Copyright&copy; 2015  oyyl and cxh</div>		</footer>

	</div>

</body>
</html>