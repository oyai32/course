var zhflag=true;//帐号是否可用
 

$(function(){
	  $('.search button:eq(0)').click(function(){//点击第一个查询按钮
		  var userName=$("input[name=userName] :eq(0)").val();
			if(userName!=""){
				main.location.href="servlet/UserServlet?type=search&userName="+userName;
			}
	  });
	  $('.search button:eq(1)').click(function(){//点击第二个按钮，添加老师
			main.location.href="backstage/adduser.jsp";
	  });
	  $("#op button:eq(0)").click(function(){//点击初始化密码
		  var userName=$("#userName").html();
		  $.ajax({
		 		type: "post",
		  		url: ctx+"/servlet/UserServlet",
		 	 	dataType: "text",
		  		data:"type=csh&userName="+userName,
		  		success:function(flag){
		  			if(flag=1)
		  				alert("操作成功！");
		  		}
		  	});
	  });
});

/**
 * 1:解冻 2：冻结
 *  */
function jie(d){
		  var userName=$("#userName").html();
		  $.ajax({
		 		type: "post",
		  		url: ctx+"/servlet/UserServlet",
		 	 	dataType: "text",
		  		data:"type=del&d="+d+"&userName="+userName,
		  		success:function(flag){
		  			if(flag=1)
		  			window.location.reload();
		  		}
		  	});
}
/**
 * 检测
 * @param p  1：检测帐号是否存在  2：添加
 */
function check(p) {
	var userName = document.getElementsByName("userName")[0].value;
	if(p==1){
		$.ajax({
	 		type: "post",
	  		url: ctx+"/servlet/LoginServlet",
	 	 	data:"p=zh&userName="+userName,
	  		success:function(data){
	  			if(data==0){//帐号不可用
	  				$("#tishi").html("*帐号已存在");
	  				zhflag=false;
	  			}else{
	  				$("#tishi").html("");
	  				zhflag=true;
	  			}
	 		}
		});
	}else{
		if(zhflag){
			var name = document.getElementsByName("name")[0].value;
			var school = document.getElementsByName("school")[0].value;
			var ele;
			var flag;
			for(var i=0;i<$("input[name=subject]").length;i++){
				ele=document.getElementsByName("subject")[i];
				if(ele.checked){
					flag=true;
					return;
				}else{
					flag=false;
				}
			}
			if (userName == "") {
				document.getElementById("tishi").innerHTML = "*帐号不能为空！";
			} else if (name == "") {
				document.getElementById("tishi").innerHTML = "*姓名不能为空！";
			}else if (school == "") {
				document.getElementById("tishi").innerHTML = "*学校不能为空！";
			}else if (!flag) {
				document.getElementById("tishi").innerHTML = "*科目不能为空！";
			}else{
				return true;
			}
			return false;
		}else{
			$("#tishi").html("*帐号已存在");
			return false;
		}
	}
}

/**
 * 发布公告检测
 */
function postcheck() {
	var title = document.getElementsByName("title")[0].value;
	var content = document.getElementsByName("content")[0].value;
	if (title == "") {
		document.getElementById("tishi").innerHTML = "*主题不能为空！";
	} else if (content == "") {
		document.getElementById("tishi").innerHTML = "*内容不能为空！";
	}else{
		$.ajax({
	 		type: "post",
	  		url: ctx+"/servlet/PostServlet?type=fb",
	 	 	data:$("#addpost").serialize(),
	  		success:function(){
	  		window.location.reload();
	 		}
		});
	}
	return false;
}
/**
 * 删除公告
 * @param id
 */
function delpost(id){
	$.ajax({
	 		type: "post",
	  		url: ctx+"/servlet/PostServlet?type=del",
	 	 	data:"id="+id,
	  		success:function(data){
	  			if(data==1){
	  				window.location.reload();
	  			}
	 		}
		});
}