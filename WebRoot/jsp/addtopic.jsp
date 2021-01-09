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
<title>试卷</title>

<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="this is my page">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<script src="${ctx }/js/jquery.js"></script>
<link rel="stylesheet" href="${ctx }/css/rpage.css">
<script type="text/javascript"  src="${ctx }/js/topic.js"></script>

</head>

<body>
<c:choose>
<c:when test="${param.type=='add' }" >
	<div class="title-back"></div>
	<h3>添加题目</h3>
	<form  id="addTopic" >
	<table class="add-topic">
		<tr>
			<td>科目：</td>
			<td>&nbsp;<select name="subject"><option value="c语言">c语言</option>
					<option  value="c++">c++</option>
					<option  value="java">java</option>
						<option  value="计算机导论">计算机导论</option>
			</select></td>
		</tr>
		<tr>
			<td>题目：</td>
			<td>&nbsp;<input name="title" class="ninput" /></td>
		</tr>
		<tr>
			<td>选项：</td>
			<td>A.<input name ="optiona" class="ninput"/></td>
		</tr>
		<tr>
			<td></td>
			<td>B.<input name ="optionb" class="ninput" /></td>
		</tr>
		<tr>
			<td></td>
			<td>C.<input name ="optionc" class="ninput" /></td>
		</tr>
		<tr>
			<td></td>
			<td>D.<input name ="optiond"  class="ninput" /></td>
		</tr>
		<tr>
			<td>答案：</td>
			<td><input type="radio" id="answer" name="answer" value="A"  checked="checked"/>A&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio"
				name="answer" value="B" />B&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="answer" value="C"/>C&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
				type="radio" name="answer" value="D" />D</td>
		</tr>
			<tr>
				<td>难度：</td>
				<td><select name="difficulty"><option value="简单">简单</option>
						<option value="一般">一般</option>
						<option value="困难">困难</option>
				</select>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;"><button
						type="button"
						onclick="check('${ctx}/servlet/TopicServlet?type=add','add')">添加</button>
					<button type="reset">重置</button>
				</td>
			</tr>
		</table>
</form>
</c:when>
<c:otherwise>
<c:set value="${requestScope.topic }" var="topic"></c:set>
<div class="title-back"></div>
	<h3>修改题目</h3>
	<form  id="updateTopic" >
	<table class="add-topic">
		<tr>
			<td>科目：</td>
			<td>&nbsp;<input name="subject" value="${topic.subject }"/></td>
		</tr>
		<tr>
			<td>题目：</td>
			<td>&nbsp;<input name="title" class="ninput"  value="${topic.title }"/></td>
		</tr>
		<tr>
			<td>选项：</td>
			<td>A.<input name ="optiona" class="ninput" value="${topic.optiona }"/></td>
		</tr>
		<tr>
			<td></td>
			<td>B.<input name ="optionb" class="ninput" value="${topic.optionb }" /></td>
		</tr>
		<tr>
			<td></td>
			<td>C.<input name ="optionc" class="ninput"  value="${topic.optionc }"/></td>
		</tr>
		<tr>
			<td></td>
			<td>D.<input name ="optiond"  class="ninput"  value="${topic.optiond }"/></td>
		</tr>
		<tr>
			<td>答案：</td>
			<td><input name="answer" value="${topic.answer }"/></td>
		</tr>
			<tr>
				<td>难度：</td>
				<td><input name="difficulty" value="${topic.difficulty }"/></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;"><button onclick="return check('${ctx}/servlet/TopicServlet?type=update&id=${topic.t_id }','update')">保存</button>
					<button type="reset">重置</button>
				</td>
			</tr>
		</table>
</form>


</c:otherwise>
</c:choose>
<div id="tishi" ></div>
</body>
</html>
