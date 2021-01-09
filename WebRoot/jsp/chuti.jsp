<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/commons/taglib.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html dir="ltr" lang="en-US">
<head>
<meta charset="utf-8">
<title>精品课程网----在线出题</title>
<meta name="viewport"
	content="initial-scale = 1.0, maximum-scale = 1.0, user-scalable = no, width = device-width">
<meta name="description" content="Description">
<meta name="keywords" content="Keywords">
<link rel="stylesheet" href="${ctx }/css/kczx.css">
<link rel="stylesheet" href="${ctx }/style.css" media="screen">
<script src="${ctx }/js/jquery.js"></script> 
<script src="${ctx }/js/script.js"></script>
<script type="text/javascript" src="${ctx }/js/topic.js"></script>
</head>
<body onload="can('${ctx}')">
				<c:set value="${sessionScope.user }" var="u"></c:set>
	<div id="art-main">
		<div class="art-sheet clearfix">
			<header class="art-header">
				<div class="art-shapes" style="font-family: '华文行楷';">精品课程网</div>
				<h1 class="art-headline">There is no end to learning.</h1>
			</header>
			<nav class="art-nav">
				<ul class="art-hmenu">
					<li><a href="${ctx }/index.jsp" >首页</a></li>
					<li><a href="${ctx }/jsp/coursecenter.jsp">课程中心</a></li>
					<li><a href="${ctx }/jsp/download.jsp">资料下载</a></li>
					<li><a href="${ctx }/jsp/communication.jsp">师生互动</a></li>
					<!-- ---------2:教师------1：学生----------- -->
					<c:choose>
					<c:when test="${u.role==2 }">
						<li><a href="${ctx }/jsp/chuti.jsp" class="active">在线出题</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="${ctx }/jsp/onlinetest.jsp">在线测试</a></li>
					</c:otherwise>
					</c:choose>
						<li><a href="${ctx }/jsp/homework.jsp">今日作业</a></li>
				</ul>
			</nav>
			<!-- --------------------------中间------------------------ -->
			<div class="art-layout-wrapper">
				<!-- -----------------------左边选项------------------------ -->
				<div class="left">
					<div class="search">
						<input name="searchTitle" id="searchTitle"/>
						<button  onclick="search('${ctx}/servlet/TopicServlet')" >搜索</button>
					</div>
					<img id="left_add" src="${ctx }/images/addtopic.png"/>
				</div>
				<!-- -----------------------右边视频------------------------ -->
				<div class="right">
					<iframe  scrolling="no"  name="main" src="${ctx }/servlet/TopicServlet?type=lie&index=1" ></iframe>
				</div>
			</div>



		</div>
		<footer class="art-footer">
			<div class="art-footer-inner">Copyright&copy; 2015  oyyl and cxh</div>
		</footer>

	</div>


</body>
</html>