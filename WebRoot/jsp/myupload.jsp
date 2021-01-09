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
<title>上传文件</title>

<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="this is my page">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${ctx }/css/rpage.css">
<script type="text/javascript" src="${ctx }/js/upload.js"></script>
<script src="${ctx }/js/jquery.js"></script>
<script src="${ctx }/js/upload.js"></script>
</head>

<body onload="can('${ctx}')">
	<div class="title-back"></div>
	<h3>我的上传</h3>

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
							<a href="#" onclick="del(${upload.upload_id})" >删除</a>
			
			</li>
		</ul>
	</c:forEach>
	<c:set value="${requestScope.pageIndex }" var="index"></c:set>
	<c:set value="${requestScope.count}" var="count"></c:set>
	<div style="text-align: center;margin:30px;">
		<a href="${ctx }/servlet/UploadServlet?type=my&index=1">首页</a>&nbsp;&nbsp;<a
			href="${ctx }/servlet/UploadServlet?type=my&index=${index>1?(index-1):1} ">上一页</a>&nbsp;&nbsp;<a
			href="${ctx }/servlet/UploadServlet?type=my&index=${index-count<1?count:(index-1)} ">下一页</a>&nbsp;&nbsp;<a
			href="${ctx }/servlet/UploadServlet?type=my&index=${count} ">尾页</a>&nbsp;&nbsp;
		<select id="myPageSelect">
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
	<div class="title-back"></div>
	<h3>上传文件</h3>
	<form action="${ctx}/servlet/UploadServlet" method="post"
		enctype="multipart/form-data">
		<div class="uptext">
			科目:<select name="subject"><option>c语言</option>
				<option>c++</option>
				<option>java</option>
			</select>
			<p>
			<p>
				标题:<input name="title" />
			<p>
			<p>
				路径:<input type="file" name="path" onchange="getName()" />
			<p>
			<p>
			<div id="tishi"></div>
			<button type="submit" onclick="return check()">上传</button>
		</div>
	</form>
</body>
</html>
