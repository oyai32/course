var zhflag=true;//帐号是否可用

$(function() {
//获取公告栏信息
	 $.ajax({
	 		type: "post",
	  		url: "servlet/PostServlet",
	  		data:"type=all",
	 	 	dataType: "json",
	  		success:function(plist){
	  				var post_id;
	  				var title;
	  				for(var i=0;i<plist.length;i++){
	  					post_id=plist[i].post_id;
	  					title=plist[i].title;
	  				$("#posts").append("<li><a href='"+ctx+"/servlet/PostServlet?b=dan&id="+post_id+"'>◎"+title+"</a></li>");
	  				}
	  		   }
			});
	 
});

/**
 * 注册 P:1登录  0注册  2 注销 3 修改密码
 */
function register(p) {
	if(p==0){
			$("#art-main").css({
				"filter" : "alpha(opacity = 50)",
				"-moz-opacity" : " 0.5",
				"-khtml-opacity" : "0.5",
				"opacity" : " 0.5"
			});
			$(".register").show();
	}else if(p==1){
		var userName=document.getElementsByName("userName")[0].value;
		var password=document.getElementsByName("password")[0].value;
		if(userName!="" && password!=""){
			$(".login").submit();
		}
	}else if(p==2){
		 $.ajax({
		 		type: "post",
		  		url: "servlet/LoginServlet",
		 	 	data:"p=logout",
		  		success:function(data){
		  			window.location.reload();
		 		}
			});
	}else if(p==3){
		$("#art-main").css({
			"filter" : "alpha(opacity = 50)",
			"-moz-opacity" : " 0.5",
			"-khtml-opacity" : "0.5",
			"opacity" : " 0.5"
		});
		$(".psw").show();
	}
}
/**
 * 检验注册信息
 * p:1 检测帐号是否重复  2：检测注册信息  3:修改密码
 */
function check(p){

	if(p==1){
		var userName=document.getElementsByName("userName")[1].value;
		 $.ajax({
		 		type: "post",
		  		url: "servlet/LoginServlet",
		 	 	data:"p=zh&userName="+userName,
		  		success:function(data){
		  			if(data==0){//帐号不可用
		  				$("#text").html("*帐号已存在");
		  				zhflag=false;
		  			}else{
		  				$("#text").html("");
		  				zhflag=true;
		  			}
		 		}
			});
	}else if(p==2){
		var userName=document.getElementsByName("userName")[1].value;
		var school=document.getElementsByName("school")[0].value;
		var name=document.getElementsByName("name")[0].value;
		var psd=document.getElementsByName("psd")[0].value;
		var repassword=document.getElementsByName("repassword")[0].value;	
		//alert(school+"-------"+name);
		//alert(psd+"-------"+psd);
		if(userName!=""&&school!=""&&name!=""&&psd!=""&&repassword!=""){//如果信息都不为空
			if(userName.length<6||userName.length>12||psd.length<6||psd.length>12){
				$("#text").html("*帐号密码长度需小于6或大于12");
				return false;
			}
			if(!zhflag){
				$("#text").html("*帐号已存在");
				return false;
			}
			if(psd==repassword){
				return true;
			}else{
				$("#text").html("*密码不一致");
				return false;
			}
		}else{
			$("#text").html("*填写信息不完整");
			return false;
		}
	}else if(p==3){
		var yuanpsw=document.getElementsByName("yuanpsw")[0].value;
		var xinpsw=document.getElementsByName("xinpsw")[0].value;
		var querepsw=document.getElementsByName("querepsw")[0].value;
		if(xinpsw.length<6||xinpsw.length>12){
			$("#text2").html("*密码长度需小于6或大于12");
		}else if(xinpsw!=querepsw){
			$("#text2").html("*密码不一致");
		}else{
			 $.ajax({
			 		type: "post",
			  		url: "servlet/UserServlet?type=updatepsw",
			 	 	data:$("#updatepsw").serialize(),
			  		success:function(data){
			  			if(data==0){
			  				$("#text2").html("*密码不正确,修改失败!");
			  			}else{
			  				alert("密码修改成功!");
			  				window.location.reload();
			  			}
			 		}
				});
		}
		return false;
	}
}