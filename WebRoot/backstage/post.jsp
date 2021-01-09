<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/commons/taglib.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="${ctx }">

<title>精品课程网----后台管理</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script type="text/javascript" src="${ctx }/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
var ctx='${ctx}'
//window.onload=function(){
//window.parent.document.getElementById("yin").style.display="none";//隐藏父窗口的部分内容
//}

</script>
<script src="${ctx }/js/back.js"></script>

<style type="text/css">
table {
	background: #ccc;
	margin: 0px auto;
}


td {
	background: white;
	text-align: center;
}

.title-back {
	height: 10px;
	background: #2777AD;
}

h3 {
	margin: -16px 0px 0px 10px;
	padding: 0px 10px;
	background: white;
	width: 100px;
	font-size: 16px;
	text-align: center;
	color: #303A4F;
}

#tishi {
	color: red;
	font-size: 14px;
	text-align: center;
}
#over{
height:240px;
padding:30px 0px;
overflow: auto;
}
</style>

</head>

<body>
	<div class="title-back"></div>
	<h3>发布公告</h3>
	<form id="addpost">
		<div class="cx">
			<table style="margin:20px auto;">
				<tr>
					<td>主题：</td>
					<td><input name="title" style="width:100%;" />
					</td>
				</tr>
				<tr>
					<td>内容：</td>
					<td><textarea rows="7" cols="70" name="content"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="发布"
						onclick="return postcheck()" />
					</td>
				</tr>
			</table>
			<div id="tishi"></div>
		</div>
	</form>
	<div class="title-back"></div>
	<h3>公告列表</h3>
	<div id="over">
	<table>
		<tr>
			<td>序号</td>
			<td style="width:200px">主题</td>
			<td style="width:350px">内容</td>
			<td>创建时间</td>
			<td>操作</td>
		</tr>
		<c:forEach var="post" items="${requestScope.plist }" varStatus="row">
			<tr>
				<td>${row.count }</td>
				<td><a href="${ctx }/servlet/PostServlet?b=dan&id=${post.post_id}">${post.title }</a></td>
				<td ><div style="width:340px;height:20px;overflow: hidden;line-height: 25px;">${post.content }</div></td>
				<td>${post.create_time }</td>
				<td><button onclick="delpost(${post.post_id})">删除</button>
				</td>
			</tr>

		</c:forEach>
	</table>
	</div>

</body>
</html>
