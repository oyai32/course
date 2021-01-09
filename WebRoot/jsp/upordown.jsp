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
<title>上传下载</title>

<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="this is my page">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${ctx }/css/rpage.css">
<script src="${ctx }/js/jquery.js"></script>
<script src="${ctx }/js/upload.js"></script>


</head>

<body onload="can('${ctx}')">
<c:choose>
<c:when test="${fn:length(requestScope.uploadList )>0 }">
<div class="title-back"></div>
	<h3>计算机类</h3>

	<ul class="lie-top">
		<li style="width:50px;">序号</li>
		<li style="width:400px;">文件名</li>
		<li style="width:80px;">上传人</li>
		<li style="width:60px;">大小</li>
		<li style="width:90px;">操作</li>
	</ul>
	<c:forEach items="${requestScope.uploadList }" var="upload"
		varStatus="row">
		<ul class="lie">
			<li style="width:50px;">${row.count }</li>
			<li style="width:400px;text-align: left;"><img
				src="${ctx }/images/${upload.ext }.png" />${upload.title }</li>
			<li style="width:80px;">${upload.name }</li>
			<li style="width:60px;">${upload.size }</li>
			<li style="width:90px;"><a
				href="${ctx }/servlet/DownServlet?title=${upload.title }&ext=${upload.ext}">下载</a>
			
			</li>
		</ul>
	</c:forEach>
	<c:set value="${requestScope.pageIndex }" var="index"></c:set>
	<c:set value="${requestScope.count}" var="count"></c:set>
	<c:set value="${requestScope.title}" var="title"></c:set>


	<div style="text-align: center;margin-top:30px;">
		<a href="${ctx }/servlet/UploadServlet?type=${param.type }&searchTitle=${title }&index=1">首页</a>&nbsp;&nbsp;<a
			href="${ctx }/servlet/UploadServlet?type=${param.type }&searchTitle=${title }&index=${index>1?(index-1):1} ">上一页</a>&nbsp;&nbsp;<a
			href="${ctx }/servlet/UploadServlet?type=${param.type }&searchTitle=${title }&index=${index-count<1?count:(index-1)} ">下一页</a>&nbsp;&nbsp;<a
			href="${ctx }/servlet/UploadServlet?type=${param.type }&searchTitle=${title }&index=${count} ">尾页</a>&nbsp;&nbsp;
		<select id="allPageSelect">
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
<div class="wu">抱歉~没有此类资料</div>
</c:otherwise>
</c:choose>
	

</body>
</html>
