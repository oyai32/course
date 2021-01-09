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
<script src="${ctx }/js/jquery.js"></script>
<script src="${ctx }/js/homework.js"></script>
<link href="${ctx }/My97DatePicker/skin/WdatePicker.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="${ctx }/css/rpage.css">
<script language="javascript" type="text/javascript"
	src="${ctx }/My97DatePicker/WdatePicker.js"></script>
<style type="text/css">
.collect {
	padding-left: 120px;
	line-height: 30px;
}

.collect button {
	float: left;
	margin: 0px;
}

</style>
</head>
<body onload="can('${ctx}')" style="padding-top:10px;">
	<c:choose>
		<c:when test="${requestScope.type=='all' }">
			<c:choose>
		<c:when test="${fn:length(requestScope.give_time )>0 }">
			<div class="title-back"></div>
			<h3>最近一次</h3>
			<div class="collect">
			<br>
			 <p>
			 <font style="margin:20px 0px;">布置日期:${requestScope.give_time }</font>
			 <br>
			 <p>
			<c:forEach var="subject" varStatus="row" items="${requestScope.subjectList }">
				科目:${subject }<p>提交人数:${requestScope.countList[row.index] }人
				<p>
				未提交人:${requestScope.weiNamesList[row.index] }
				<p>
			</c:forEach>
			
			</div>
	</c:when>
		<c:otherwise>
		<div class="wu" style="margin-left:-220px;">还没有同学交作业哦~</div>
		</c:otherwise>
		</c:choose>
		</c:when>
		<c:otherwise>
			<p>
			<div class="title-back"></div>
			<h3 style="width:120px;">${requestScope.give_time }</h3>
		<c:choose>
		<c:when test="${fn:length(requestScope.homeWorkList )>0 }">
			<div class="collect">
				提交人数:${requestScope.count }人
				<p>
					未提交人:
					<c:forEach items="${requestScope.weiUsers }" var="weiUser">${weiUser.name }、</c:forEach>
				<p>
					<br>
					<button>全选</button>
					<button>批量下载</button>
			</div>
			<ul class="lie-top km" style="margin-top:30px;">
				<li style="width:70px;">序号</li>
				<li style="width:150px;" >科目</li>
				<li style="width:90px;">姓名</li>
				<li style="width:130px;">提交日期</li>
				<li style="width:50px;">操作</li>
			</ul>
			<c:forEach items="${requestScope.homeWorkList }" var="homeWork"
				varStatus="row">
				<ul class="lie km">
					<li style="width:70px;"><input type="checkbox" name="checkbox" />${row.count}</li>
					<li style="width:150px;" class="subject">${homeWork.subject }</li>
					<li style="width:90px;">${homeWork.name }</li>
					<li style="width:130px;">${homeWork.submit_time }</li>
					<li style="width:50px;"><a href="${ctx }/servlet/CollectWorkServlet?type=down&filename=${homeWork.filename}">下载</a></li>
					<li style="display:none;" id="filename${row.count}">${homeWork.filename}</li>
				</ul>
			</c:forEach>
		</c:when>
		<c:otherwise>
		<div class="wu" style="margin-left:-220px;">该天没有布置${param.subject }作业哦~</div>
		</c:otherwise>
		</c:choose>
			<p>
			<div id="tishi" style="margin:10px 0px 10px 250px;"></div>
		</c:otherwise>
	</c:choose>






</body>
</html>