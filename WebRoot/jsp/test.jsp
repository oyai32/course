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
<title>试卷</title>

<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="this is my page">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${ctx }/css/rpage.css">
<script src="${ctx }/js/jquery.js"></script>
<script src="${ctx }/js/test.js"></script>
<style type="text/css">
body{
width:690px;}
</style>

</head>

<body onload="can('${ctx}')">
	<div class="title-back"></div>
	<h3>计算机类</h3>
<c:choose>
<c:when test="${fn:length(requestScope.topicLists )>0 }">
<div class="test">
		<div class="test-top">${requestScope.testTop }<span></span></div>
		<form id="mytest">
		<c:forEach items="${requestScope.topicLists }" var="topic" varStatus="row">
			<dl class="test-content">
			<dt>${row.count }、${topic.title }</dt>
			<dd><input type="radio" name="topic${row.count }" value="A"/>A、${topic.optiona }</dd>
			<dd><input type="radio" name="topic${row.count }"  value="B"/>B、${topic.optionb }</dd>
			<dd><input type="radio" name="topic${row.count }"  value="C"/>C、${topic.optionc }</dd>
			<dd><input type="radio" name="topic${row.count }"  value="D"/>D、${topic.optiond }</dd>
		<dd class="worry" id="worry${row.count }" ></dd>
		<dd class="right"  id="right${row.count }">√</dd>
			</dl>
		</c:forEach>
		<div class="test-bottom">
		<button type="submit" onclick="return tijiao('${requestScope.test_id}')">提交</button>
		</div>
		</form>
	</div>

</c:when>
<c:otherwise>
<div class="wu">抱歉~<p>此类型题库有限，无法生成试卷！</div>
</c:otherwise>
</c:choose>


	


</body>
</html>
