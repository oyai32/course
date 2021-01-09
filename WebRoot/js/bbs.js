var course;//工程名
//页面加载调用方法获取工程名
 function can(c){
	 course=c;
 }
 

$(function(){
	  $('.search button:eq(0)').click(function(){//点击第一个搜索按钮，按主题搜索
		  var title=$("input[name=search] :eq(0)").val();
			if(title!=""){
				main.location.href=course+"/servlet/BbsServlet?type=search&p=title&index=1&title="+title;
			}
	  });
	  
	  $('.search button:eq(1)').click(function(){//点击第二个搜索按钮，按科目搜索
		  var subject=$("input[name=search] :eq(1)").val();
			if(subject!=""){
				main.location.href=course+"/servlet/BbsServlet?type=search&p=subject&index=1&subject="+subject;
			}
	  });
});

function changePage(p,subject,title){
  var val = $("#allPageSelect").val();
  var pageIndex=val.substring(0,val.indexOf("/"));//当前页码
	  window.location.href=course+"/servlet/BbsServlet?type=search&p="+p+"&subject="+subject+"&title="+title+"&index="+pageIndex;
	  
}

/**
 * 检测
 * @param p  1：发表新贴  2：发表回复
 */
function check(p,id) {
	var content = document.getElementsByName("content")[0].value;
	if(p==1){//新帖
		var title = document.getElementsByName("title")[0].value;
		var subject = document.getElementsByName("subject")[0].value;
		if (title == "") {
			document.getElementById("tishi").innerHTML = "*主题内容不能为空！";
		} else if (subject == "") {
			document.getElementById("tishi").innerHTML = "*科目不能为空！";
		}else if (content == "") {
			document.getElementById("tishi").innerHTML = "*内容不能为空！";
		}else{
			 $.ajax({
			 		type: "post",
			  		url: course+"/servlet/BbsServlet?type=addbbs",
			 	 	dataType: "text",
			  		data:$("#addbbs").serialize(),
			  		success:function(data){
			  			if(data==1){
			  				window.location.href=course+"/servlet/BbsServlet?type=search&p=all&index=1";
			  			}
			  		}
			  	});
		}
		return false;
	}else{//回复
		 if (content == "") {
				document.getElementById("tishi").innerHTML = "*内容不能为空！";
			}else{
				 $.ajax({
				 		type: "post",
				  		url: course+"/servlet/BbsServlet?type=addreply&id="+id,
				 	 	dataType: "text",
				  		data:"content="+content,
				  		success:function(data){
				  			if(data==1){
				  				window.location.href=course+"/servlet/BbsServlet?type=dan&id="+id;
				  			}
				  		}
				  	});
			}
		return false;
	}
}
