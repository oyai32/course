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
<title>精品课程网----今日作业</title>
<meta name="viewport"
	content="initial-scale = 1.0, maximum-scale = 1.0, user-scalable = no, width = device-width">
<meta name="description" content="Description">
<meta name="keywords" content="Keywords">
<link rel="stylesheet" href="${ctx }/css/kczx.css">
<link rel="stylesheet" href="${ctx }/style.css" media="screen">
<script src="${ctx }/js/jquery.js"></script>
<script src="${ctx }/js/script.js"></script>
<script src="${ctx }/js/homework.js"></script>
<link href="${ctx }/My97DatePicker/skin/WdatePicker.css"
	rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript"
	src="${ctx }/My97DatePicker/WdatePicker.js"></script>

</head>
<body onload="can('${ctx}')">
	<c:set value="${sessionScope.user }" var="u"></c:set>
	<div id="art-main">
		<div class="art-sheet clearfix">
			<header class="art-header">
				<div class="art-shapes" style="font-family: '华文行楷';">精品课程网</div>
				<h1 class="art-headline">There is no end to learning.</h1>
			</header>
			<nav class="art-nav">
				<ul class="art-hmenu">
					<li><a href="${ctx }/index.jsp">首页</a></li>
					<li><a href="${ctx }/jsp/coursecenter.jsp">课程中心</a></li>
					<li><a href="${ctx }/jsp/download.jsp">资料下载</a></li>
					<li><a href="${ctx }/jsp/communication.jsp">师生互动</a></li>
					<!-- ---------2:教师------1：学生----------- -->
					<c:choose>
						<c:when test="${u.role==2 }">
							<li><a href="${ctx }/jsp/chuti.jsp">在线出题</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${ctx }/jsp/onlinetest.jsp">在线测试</a></li>
						</c:otherwise>
					</c:choose>
					<li><a href="${ctx }/jsp/homework.jsp" class="active">今日作业</a>
					</li>
				</ul>
			</nav>
			<!-- --------------------------中间------------------------ -->
			<div class="art-layout-wrapper">
				<c:choose>
				<%-- -----------------------教师------------------------ --%>
					<c:when test="${u.role==2 }">
						<%-- -----------------------左边选项------------------------ --%>
						<div class="left">

							<div class="search" style="line-height: 30px;">
								&nbsp;科&nbsp;目:&nbsp;<select id="subject"><option>Java</option>
									<option>高等数学</option>
									<option>C语言</option>
									<option>计算机导论</option>
								</select>
								<p></p>
								布置日期:<input id="give_time" class="Wdate"
									onclick="WdatePicker({isShowWeek:true})" style="width:120px;" />
								<p></p>
								<button style="margin-left:80px;" onclick="search(2)">搜索</button>
								<p></p>
							</div>


						</div>
						<%-- -----------------------右边------------------------ --%>
						<div class="right">
							<iframe scrolling="no" name="main"
								src="${ctx }/servlet/CollectWorkServlet?type=all"></iframe>
						</div>

					</c:when>
						<%-- -----------------------学生------------------------ --%>
					<c:otherwise>

						<%-- -----------------------左边选项------------------------ --%>
						<div class="left">

							<div class="search" style="line-height: 30px;">
								&nbsp;科&nbsp;目:&nbsp;<select id="subject"><option>Java</option>
									<option>高等数学</option>
									<option>C语言</option>
									<option>计算机导论</option>
								</select>
								<p></p>
								布置日期:从<input id="start_time" class="Wdate"
									onclick="WdatePicker({isShowWeek:true})" style="width:120px;" />
								<p></p>
								&nbsp;&nbsp;&nbsp;&nbsp;至<input id="end_time" class="Wdate"
									onclick="WdatePicker({isShowWeek:true})" style="width:120px;" />
								<p></p>
								<button style="margin-left:80px;" onclick="search(1)">搜索</button>
								<p></p>
							</div>


						</div>
						<%-- -----------------------右边------------------------ --%>
						<div class="right">
							<iframe scrolling="no" name="main"
								src="${ctx }/servlet/HomeWorkServlet?type=all"></iframe>
						</div>

					</c:otherwise>
				</c:choose>
			</div>





		</div>
	<footer class="art-footer">
		<div class="art-footer-inner">Copyright&copy; 2015 oyyl and cxh</div>
	</footer>

	</div>


</body>
</html>