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
	<c:choose>
		<c:when test="${fn:length(requestScope.bbsLists )>0 }">
			<div class="title-back"></div>
			<h3>计算机类</h3>

			<ul class="lie-top">
				<li style="width:80px;">回复量</li>
				<li style="width:420px;">标题</li>
				<li style="width:80px;">作者</li>
				<li style="width:80px;">创建时间</li>
			</ul>
			<c:forEach var="bbs" items="${requestScope.bbsLists}" varStatus="row">
				<ul class="lie">
					<li style="width:80px;">${row.count }</li>
					<li style="width:420px;"><a
						href="${ctx }/servlet/BbsServlet?type=dan&id=${bbs.bbs_id}">${bbs.title
							}</a>
					</li>
					<li style="width:80px;">${bbs.name }</li>
					<li style="width:80px;">${bbs.create_time }</li>
				</ul>
			</c:forEach>
			<c:set value="${requestScope.pageIndex }" var="index"></c:set>
	<c:set value="${requestScope.count}" var="count"></c:set>
		<c:set value="${requestScope.subject}" var="subject"></c:set>
				<c:set value="${requestScope.title}" var="title"></c:set>
<div style="text-align: center;margin-top:30px;">
		<a href="${ctx }/servlet/BbsServlet?type=search&p=${param.p }&subject=${subject }&title=${title }&index=1">首页</a>&nbsp;&nbsp;<a
			href="${ctx }/servlet/BbsServlet?type=search&p=${param.p }&subject=${subject }&title=${title }&index=${index>1?(index-1):1} ">上一页</a>&nbsp;&nbsp;<a
			href="${ctx }/servlet/BbsServlet?type=search&p=${param.p }&subject=${subject }&title=${title }&index=${index-count<1?count:(index-1)} ">下一页</a>&nbsp;&nbsp;<a
			href="${ctx }/servlet/BbsServlet?type=search&p=${param.p }&subject=${subject }&title=${title }&index=${count} ">尾页</a>&nbsp;&nbsp;
		<select id="allPageSelect" onchange="changePage('${param.p }','${subject }','${title }')">
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
			<div class="liuyan">
				<form id="addbbs">
					新的留言：
					<p>
						科目:<input name="subject" style="width:200px" />
					<p>
						主题:<input name="title" />
					<p>
						内容:<textarea name="content"></textarea>
					<p>
					<div id="tishi"></div>
					<button  onclick="return check(1)">发表</button>
				</form>
			</div>

		</c:when>
		<c:otherwise>
			<div class="wu">抱歉~暂无此类讨论</div>
		</c:otherwise>
	</c:choose>





</body>
</html>
