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
<script type="text/javascript">
var ctx='${ctx}';
</script>
<script src="${ctx }/js/jquery.js"></script>
<script src="${ctx }/js/back.js"></script>
<style type="text/css">
body {
	padding: 0px;
	margin: 0px;
}

.title-back {
	height: 10px;
	background: #2777AD;
	margin-top: 20px;
}
td{
border:1px solid #ccc;
padding:5px 10px;}
h3 {
	margin: -16px 0px 0px 10px;
	padding: 0px 10px;
	background: white;
	width: 100px;
	font-size: 16px;
	text-align: center;
	color: #303A4F;
}

table {
	margin: 50px auto;
	background:#ccc;
}

td {
	height: 30px;
	background:white;
}
.wu{
text-align: center;
padding:20px;}
</style>

</head>

<body>
		<c:set value="${requestScope.seluser }" var="u"></c:set>
	<div class="title-back"></div>
	<h3>用户信息</h3>
	<c:choose>
<c:when test="${empty u}">
<div class="wu">此用户不存在</div>

</c:when>
<c:otherwise>
	<table cellpadding="0" cellspacing="0">
		<tr>
			<td>帐号</td>
			<td>姓名</td>
			<td>学校</td>
			<td>科目</td>
			<td>角色</td>
			<td>注册时间</td>
				<td>状态</td>
				<td>操作</td>
		</tr>
				<tr>
			<td id="userName">${u.userName }</td>
			<td>${u.name }</td>
			<td>${u.school }</td>
			<td>${u.subject }</td>
			<td><c:if test="${u.role==2 }">教师</c:if><c:if test="${u.role==3 }">学生</c:if><c:if test="${u.role==1 }">管理员</c:if></td>
			<td>${u.create_time }</td>
			
				<td><c:if test="${u.del==1 }">正常</c:if><c:if test="${u.del==0 }">冻结</c:if></td>
				<td id="op"><button>初始化密码</button><c:if test="${u.del==1 }"><button onclick="jie(0)">冻结</button></c:if><c:if test="${u.del==0 }"><button  onclick="jie(1)">恢复</button></c:if></td>
		</tr>
	</table>
	</c:otherwise>
	</c:choose>
</body>
</html>
