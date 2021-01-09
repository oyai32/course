<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="commons/taglib.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>精品课程网----首页</title>
<meta name="viewport"
	content="initial-scale = 1.0, maximum-scale = 1.0, user-scalable = no, width = device-width">

<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet" href="style.css" media="screen">
<script type="text/javascript">
var ctx='${ctx}';
</script>
<script src="js/jquery.js"></script>
<script src="js/index.js"></script>
<script src="js/script.js"></script>

</head>
<body>
	<c:set value="${sessionScope.user }" var="u"></c:set>

	<div id="art-main">
		<div class="art-sheet clearfix">
			<header class="art-header">
				<div class="art-shapes" style="font-family: '华文行楷';">精品课程网</div>
				<h1 class="art-headline">There is no end to learning.</h1>
			</header>
			<nav class="art-nav">
				<ul class="art-hmenu">
					<li><a href="${ctx }/index.jsp" class="active">首页</a></li>
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
						<li><a href="${ctx }/jsp/homework.jsp">今日作业</a></li>
				</ul>
			</nav>
			<!-- --------------------------中间------------------------ -->
			<div class="art-layout-wrapper">
				<img src="images/elearn.jpg" class="top-left-img">
				<form  class="login" action="servlet/LoginServlet?p=login&&role=3" method="post">
					<c:choose>
							<%-- -----------------------如果未登录----------------------- --%>
						<c:when test="${empty u}">
							<ul>
								<li style="text-align: left;padding-bottom:20px;"><img
									src="images/ulogin.png" class="ulogin" />用户登录 USER LOGIN</li>
								<li>帐号:<input name="userName"  /></li>
								<li>密码:<input name="password" type="password" />
								</li>
								<li><img src="images/login.png" class="start" onclick="register(1)" /><img
									src="images/register.png" style="margin-left:30px;"
									class="start" onclick="register(0)" /></li>
							</ul>
						</c:when>
								<%-- -----------------------如果已登录----------------------- --%>
						<c:otherwise>
							<dl class="welcome">
								<dd>&nbsp;欢迎使用精品课程网!</dd>
								<dd>&nbsp;姓名：${u.name }</dd>
								<dd>&nbsp;学校：${u.school }</dd>
								<dd>&nbsp;角色:<c:if test="${u.role==2 }"> 教师</c:if><c:if test="${u.role==3 }"> 学生</c:if></dd>
								<dd><img src="images/logout.png" class="logout" onclick="register(2)"/><img src="images/updatepsw.png" class="logout" onclick="register(3)"/></dd>
							</dl>

						</c:otherwise>
					</c:choose>

				</form>
			</div>
			<!-- --------------登录下方内容------------------------ -->
			<!-- --------------通知公告------------------------ -->
			<div class="notice">
				<div class="art-blockheader">
					<h2 class="t">
						通知公告<a href="#">more..</a>
					</h2>
				</div>
				<ul id="posts">
				</ul>
			</div>
			<!-- --------------课程简介------------------------ -->
			<div class="introduction">
				<div class="art-blockheader">
					<h2 class="t">
						课程简介<a href="#">more..</a>
					</h2>
				</div>
				<img src="images/cyy.jpg" />
				<div class="cintro">&nbsp;&nbsp;&nbsp;&nbsp;C语言是一门通用计算机编程语言，应用广泛。C语言的设计目标是提供一种能以简易的方式编译、处理低级存储器、产生少量的机器码以及不需要任何运行环境支持便能运行的编程语言。C语言是编程方式灵活多样、功能强大、应用广泛的一种程序设计语言。从程序设计...</div>
			</div>
			<!-- --------------学习技巧----------------------- -->
			<div class="notice">
				<div class="art-blockheader">
					<h2 class="t">
						学习技巧<a href="#">more..</a>
					</h2>
				</div>
				<ul>
					<li><a href="#">◎第一章 程序设计基本概念</a></li>
					<li><a href="#">◎第二章 C程序设计的初步知识</a></li>
					<li><a href="#">◎第三章 顺序结构</a></li>
					<li><a href="#">◎第四章 选择结构</a></li>
					<li><a href="#">◎第五章 循环结构</a></li>
				</ul>
			</div>
			<!-- --------------选择功能----------------------- -->
			<ul class="choose">
				<li><a href="${ctx }/jsp/coursecenter.jsp"><img src="images/p1.jpg" /><font>课程中心 Course center</font></a>
				</li>
				<li><a href="${ctx }/jsp/download.jsp"><img src="images/p2.jpg" /><font>资料下载 Data download</font></a>
				</li>
				<li><a href="${ctx }/jsp/communication.jsp"><img src="images/p3.jpg" /><font>师生互动 Communication</font></a>
				</li>
				<li><a href="${ctx }/jsp/onlinetest.jsp"><img src="images/p4.jpg" /><font>在线测试 Online test</font></a>
				</li>
			</ul>
			<!-- --------------授课计划------------------------ -->
			<div class="introduction">
				<div class="art-blockheader">
					<h2 class="t">
						授课计划<a href="#">more..</a>
					</h2>
				</div>
				<ul>
					<li><a href="#">◎第一章 程序设计基本概念</a><font>[2015-3-25]</font></li>
					<li><a href="#">◎第二章 C程序设计的初步知识</a><font>[2015-3-24]</font></li>
					<li><a href="#">◎第三章 顺序结构</a><font>[2015-3-20]</font></li>
					<li><a href="#">◎第四章 选择结构</a><font>[2015-3-15]</font></li>
					<li><a href="#">◎第五章 循环结构</a><font>[2015-3-13]</font></li>
					<li><a href="#">◎第六章 循环结构</a><font>[2015-3-13]</font></li>
				</ul>
			</div>
			<!-- --------------教学课件----------------------- -->
			<div class="notice">
				<div class="art-blockheader">
					<h2 class="t">
						教学课件<a href="#">more..</a>
					</h2>
				</div>
				<ul>
					<li><a href="#">◎第一章 程序设计基本概念</a></li>
					<li><a href="#">◎第二章 C程序设计的初步知识</a></li>
					<li><a href="#">◎第三章 顺序结构</a></li>
					<li><a href="#">◎第四章 选择结构</a></li>
					<li><a href="#">◎第五章 循环结构</a></li>
					<li><a href="#">◎第六章 循环结构</a></li>
				</ul>
			</div>
			<!-- --------------图片展示----------------------- -->
			<div class="show">
				<div class="art-blockheader">
					<h2 class="t">
						图片展示<a href="#">more..</a>
					</h2>
				</div>
				<marquee behavior="alternate1" scrollamount="2"
					onmouseover="this.stop()" onmouseout="this.start()">
					<ul>
						<li><a href="#"><img src="images/1.jpg" /> </a></li>
						<li><a href="#"><img src="images/2.jpg" /> </a></li>
						<li><a href="#"><img src="images/3.jpg" /> </a></li>
						<li><a href="#"><img src="images/4.jpg" /> </a></li>
						<li><a href="#"><img src="images/5.jpg" /> </a></li>
						<li><a href="#"><img src="images/6.jpg" /> </a></li>
						<li><a href="#"><img src="images/7.jpg" /> </a></li>
						<li><a href="#"><img src="images/8.jpg" /> </a></li>
					</ul>
				</marquee>
			</div>

		</div>
		<footer class="art-footer">
			<div class="art-footer-inner">Copyright&copy; 2015  oyyl and cxh</div>
		</footer>

	</div>
	<!-- ---------注册框------------ -->
	<div class="register">
		<form action="servlet/LoginServlet?p=register" method="post">
			<ul>
				<li><img src="images/ulogin.png" class="ulogin" /><h2>&nbsp;学生注册</h2><br></li>
				<li>帐&nbsp;&nbsp;&nbsp;号:<input name="userName" onkeyup="check(1)"/></li>
				<li>学校名称:<input name="school" /></li>
				<li>姓&nbsp;&nbsp;&nbsp;名:<input name="name" /></li>
				<li>密&nbsp;&nbsp;&nbsp;码:<input type="password" name="psd"  /></li>
				<li>确认密码:<input type="password" name="repassword" /></li>

				<li><input type="submit" value="注册" onclick="return check(2)"></input>
				</li>
				<li id="text"></li>
			</ul>
			
		</form>
	</div>
		<!-- ---------修改密码框------------ -->
	<div class="psw">
		<form id="updatepsw">
			<ul>
				<li><img src="images/ulogin.png" class="ulogin" /><h2>&nbsp;修改密码</h2><br></li>
				<li>&nbsp;&nbsp;原密码:<input type="password" name="yuanpsw" /></li>
				<li>&nbsp;&nbsp;新密码:<input type="password" name="xinpsw" /></li>
				<li>确认密码:<input type="password" name="querepsw" /></li>

				<li><button onclick="return check(3)">保存</button>
				</li>
				<li id="text2"></li>
			</ul>
			
		</form>
	</div>
</body>
</html>