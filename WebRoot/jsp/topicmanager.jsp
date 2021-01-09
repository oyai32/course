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
<title>试题管理</title>

<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="this is my page">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<script src="${ctx }/js/jquery.js"></script> 
<link rel="stylesheet" href="${ctx }/css/rpage.css">
<script type="text/javascript" src="${ctx }/js/topic.js"></script>


</head>

<body onload="can('${ctx}')">
	<div class="title-back"></div>
	<h3>我出的题</h3>
	<c:choose>
		<c:when test="${fn:length(requestScope.topicLists)>0 }">
		<ul class="lie-top">
			<li style="width:40px;">序号</li>
			<li style="width:420px;">题目</li>
			<li style="width:40px;">难度</li>
			<li style="width:80px;">更新时间</li>
			<li style="width:120px;">操作</li>
		</ul>
			<c:forEach items="${requestScope.topicLists }" var="topic"
				varStatus="row">
				<ul class="lie" id="topic${topic.t_id }">
					<li style="width:40px;">${row.count }</li>
					<li style="width:420px;overflow: hidden;height:15px;">${topic.title}</li>
					<li style="width:40px;">${topic.difficulty }</li>
					<li style="width:80px;">${topic.update_time }</li>
					<li style="width:120px;" ><button onclick="update(1,${topic.t_id},'${ctx }')">修改</button>
						<button onclick="update(0,${topic.t_id},'${ctx }')">删除</button></li>
				</ul>
			</c:forEach>
			<c:set value="${requestScope.pageIndex }" var="index"></c:set>
			<c:set value="${requestScope.count}" var="count"></c:set>
			<div style="text-align: center;margin-top:30px;">
				<a href="${ctx }/servlet/TopicServlet?type=${param.type }&title=${param.title }&index=1">首页</a>&nbsp;&nbsp;<a
					href="${ctx }/servlet/TopicServlet?type=${param.type }&title=${param.title }&index=${index>1?(index-1):1} ">上一页</a>&nbsp;&nbsp;<a
					href="${ctx }/servlet/TopicServlet?type=${param.type }&title=${param.title }&index=${index-count<1?count:(index-1)} ">下一页</a>&nbsp;&nbsp;<a
					href="${ctx }/servlet/TopicServlet?type=${param.type }&title=${param.title }&index=${count} ">尾页</a>&nbsp;&nbsp;
				<select id="pageSelect">
					<c:forEach var="i" begin="1" end="${count }" step="1">
						<c:choose>
							<c:when test="${i==index }">
								<option selected="selected">${i }/${count }页</option>
							</c:when>
							<c:otherwise>
								<option>${i }/${count }页</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
			</div>
		</c:when>
		<c:otherwise>
	<div style="text-align: center;margin-top:30px;">暂无相关题目</div>
	</c:otherwise>
</c:choose>

</body>
</html>
