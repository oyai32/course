<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/commons/taglib.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html dir="ltr" lang="en-US">
<head>
<meta charset="utf-8">
<title>精品课程网----资料下载</title>
<meta name="viewport"
	content="initial-scale = 1.0, maximum-scale = 1.0, user-scalable = no, width = device-width">
<meta name="description" content="Description">
<meta name="keywords" content="Keywords">
<link rel="stylesheet" href="${ctx }/style.css" media="screen">
<link rel="stylesheet" href="${ctx }/css/rpage.css">
<script src="${ctx }/js/jquery.js"></script>
<script src="${ctx }/js/homework.js"></script>
<link href="${ctx }/My97DatePicker/skin/WdatePicker.css"
	rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript"
	src="${ctx }/My97DatePicker/WdatePicker.js"></script>
	
</head>
<body onload="can('${ctx}')" style="padding-top:10px;">
<p>
	<div class="title-back"></div>
	<h3>我的作业</h3>
	<c:choose>
<c:when test="${fn:length(requestScope.homeWorkList )>0 }">
<ul class="lie-top km" style="margin-top:30px;">
		<li style="width:50px;">序号</li>
		<li style="width:150px;">科目</li>
		<li style="width:120px;">布置日期</li>
		<li style="width:120px;">提交日期</li>
		<li style="width:50px;">操作</li>
	</ul>
	<div class="over" style="border:0px;height:200px;width:720px;">
	<c:forEach items="${requestScope.homeWorkList }" var="homeWork" varStatus="row">
	<ul class="lie km">
		<li style="width:50px;">${row.count }</li>
		<li style="width:150px;">${homeWork.subject }</li>
		<li style="width:120px;">${homeWork.give_time }</li>
		<li style="width:120px;">${homeWork.submit_time }</li>
		<li style="width:50px;"><a href="${ctx }/servlet/CollectWorkServlet?type=down&filename=【${ homeWork.subject}】${sessionScope.user.name}(${homeWork.give_time }).doc">下载</a></li>
	</ul>
	</c:forEach>
	</div>
</c:when>
	<c:otherwise>
					<div style="margin:20px 340px;">
						暂无提交记录
					</div>
				</c:otherwise>
	</c:choose>
		<div class="title-back" style="margin-top:30px;"></div>
	<h3>提交作业</h3>
	<form action="${ctx}/servlet/HomeWorkServlet" method="post"
		enctype="multipart/form-data">
		<div  class="tjhomework" >
		&nbsp;科&nbsp;目:<select name="subject"><option>C语言</option>
			<option>高等数学</option>
			<option>Java</option>
			<option>计算机导论</option>
		</select>
		<p>
			任课教师:<select name="consignee"><option>李明</option>
				<option>彭宇</option>
				<option>肖平</option>
			</select>
		<p>
			布置日期:<input class="Wdate" onclick="WdatePicker({isShowWeek:true})"
				style="width:120px;" name="give_time"/>
		<p>
			路径:<input type="file" name="path"/>
		<p>
		<div id="tishi"></div>
			<button  onclick="return check()">提交</button>
	</div>
	</form>
</body>
</html>