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
<title>课程视频</title>

<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="this is my page">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<style type="text/css">
img {
	float: left;
	width: 250px;
	padding:10px;
	border:1px solid #ccc;
	margin:20px 10px 0px 0px;
}

.text {
	font-size: 14px;
	width: 400px;
	float: left;
	line-height: 20px;
}
</style>

</head>

<body>
	<video src="${ctx }/video/001.mp4" controls="controls" width="100%;"></video>
	<img src="${ctx }/images/ts014.jpg" />
	<div class="text">
		<h4>文学人类学概说 叶舒宪 (共31课时)</h4>
		《文学人类学概说》把握住人类学与知识全球化、后现代认识论的关系，从人类学与文学的相互作用这个新角度着眼，透析出20世纪文学创作观念变革与文学研究的范式革新的一个重要学术思想动力。本课程通过对文学人类学内涵的深刻阐释，充分描绘了文学与社会更深层次的关联；对于四重证据法以及文学人类学与比较文学的关系，叶舒宪教授也进行了极其生动的讲解，从而帮助对于文学人类学有兴趣...
		<p>
		学习要求：本课程需要在线学习41集视频(20分钟/集)，根据要求按时在线完成课后作业和考试，最终得到教务处确认的综合成绩达到60分以上者，可以认定相应学分。
	</div>
</body>
</html>
