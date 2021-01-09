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
<script type="text/javascript" src="${ctx }/js/bbs.js"></script>


</head>

<body onload="can('${ctx}')">
<c:set value="${requestScope.bbs }" var="bbs"></c:set>
	<div class="title-back"></div>
	<h3>计算机类</h3>
	<div id="top-title">
		${bbs.title }
			<font>作者：${bbs.name}&nbsp;&nbsp;${bbs.create_time }</font>
			<p>${bbs.content }
	</div>
	<c:if test="${fn:length(requestScope.replyLists)>0 }">
	<div class="over">
	<ul class="huifu">
	<c:forEach var="reply" items="${requestScope.replyLists }">
		<li><div>
				<span>${reply.name }</span> 回复:<font>${reply.create_time }</font>
			</div>
			<p>
			<div class="huifu-text">${reply.content }</div>
		
		</li>
		</c:forEach>
	</ul>
	</div>
	</c:if>
	<div class="liuyan">
		我要回复：
		<p>
		
			<textarea  name="content"></textarea>
		<p>
				<div id="tishi"></div>
				<button  onclick="check(2,${bbs.bbs_id})">发表</button>
			
	</div>




</body>
</html>
