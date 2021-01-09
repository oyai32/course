<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/commons/taglib.jsp"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
<title>课程视频</title>

<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="this is my page">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${ctx }/css/kczx.css">

</head>

<body>
	<div class="con">
		<div class="title-back"></div>
		<h3>科学与技术</h3>
		<ul>
			<li><a href="${ctx }/jsp/wenxue.jsp"><img src="${ctx }/images/ts010.jpg" />从爱因斯坦到霍金的宇宙 </a><br>赵峥 
			</li>
				<li><a href="${ctx }/jsp/wenxue.jsp"><img src="${ctx }/images/ts011.jpg" />现代自然地理学 </a><br>王建  
			</li>
				<li><a href="${ctx }/jsp/wenxue.jsp"><img src="${ctx }/images/ts012.jpg" />魅力科学 </a><br>车云霞
			</li>
		</ul>
	</div>
		<div class="con">
		<div class="title-back"></div>
		<h3>社会与文化</h3>
		<ul>
			<li><a href="${ctx }/jsp/wenxue.jsp"><img src="${ctx }/images/ts015.jpg" />东方文学史 </a><br>王向远  
			</li>
				<li><a href="${ctx }/jsp/wenxue.jsp"><img src="${ctx }/images/ts014.jpg" />文学人类学概说</a><br>叶舒宪
			</li>
				<li><a href="${ctx }/jsp/wenxue.jsp"><img src="${ctx }/images/ts016.jpg" />美学原理 </a><br>叶朗  
			</li>
		</ul>
	</div>
		<div class="con">
		<div class="title-back"></div>
		<h3>自我与人生</h3>
		<ul>
			<li><a href="${ctx }/jsp/wenxue.jsp"><img src="${ctx }/images/ts022.jpg" />追寻幸福：西方伦理史视</a><br>韦正翔  
			</li>
				<li><a href="${ctx }/jsp/wenxue.jsp"><img src="${ctx }/images/ts023.jpg" />新伦理学 </a><br>王海明 
			</li>
				<li><a href="${ctx }/jsp/wenxue.jsp"><img src="${ctx }/images/ts024.jpg" />基督教与西方文化 </a><br>赵林  
			</li>
		</ul>
	</div>
</body>
</html>
