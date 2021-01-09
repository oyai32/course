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
	<h3>计算机类</h3>
	<div class="topic-lie">
	<c:if test="${param.p=='search' }">
<c:choose>
<c:when test="${fn:length(requestScope.topicLists )>0 }">
	<c:forEach var="topic" items="${requestScope.topicLists }">
		<a href="${ctx }/servlet/TestServlet?type=create&subject=${topic.subject }&nd=1">${topic.subject }基础题</a>
			<p>
				<a href="${ctx }/servlet/TestServlet?type=create&subject=${topic.subject }&nd=2">${topic.subject }练习题</a>
			<p>
				<a href="${ctx }/servlet/TestServlet?type=create&subject=${topic.subject }&nd=3">${topic.subject }竞赛题</a>
				<p>
	</c:forEach>
	</c:when>
	<c:otherwise>
					<div class="wu" >
						抱歉~
						<p>暂无此科目试卷
					</div>
				</c:otherwise>
	</c:choose>
	</c:if>
	
	<c:if test="${param.p=='ji' }">
				<p>
	<a href="${ctx }/servlet/TestServlet?type=create&subject=C&nd=1">C语言基础题</a>
			<p>
				<a href="${ctx }/servlet/TestServlet?type=create&subject=C&nd=2">C语言练习题</a>
			<p>
				<a href="${ctx }/servlet/TestServlet?type=create&subject=C&nd=3">C语言竞赛题</a>
			
	</c:if>
	</div>




</body>
</html>
