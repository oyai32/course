var course;//工程名
//页面加载调用方法获取工程名
 function can(c){
	 course=c;
 }
 

$(function(){
	  $('#pageSelect').change(function(){
	       // 1、当前选中的option的value属性
          var val = $(this).val();
          var pageIndex=val.substring(0,val.indexOf("/"));//当前页码
  		  window.location.href=course+"/servlet/TopicServlet?type=lie&index="+pageIndex;
	  });
	  $('#left_add').click(function(){
 		  main.location.href=course+"/jsp/addtopic.jsp?type=add";
	  });
});






/**
 * 添加与修改，检查
 * @param url
 * @param type
 * @returns {Boolean}
 */
function check(url,type) {
	var title = document.getElementsByName("title")[0].value;
	var optiona = document.getElementsByName("optiona")[0].value;
	var optionb = document.getElementsByName("optionb")[0].value;
	var optionc = document.getElementsByName("optionc")[0].value;
	var optiond = document.getElementsByName("optiond")[0].value;
	if (title == "") {
		document.getElementById("tishi").innerHTML = "*标题内容不能为空！";
	} else if (optiona == "" || optionb == "" || optionc == ""
			|| optiond == "") {
		document.getElementById("tishi").innerHTML = "*选项内容不能为空！";
	}else{
		if(type=="add"){//添加
		 $.ajax({
		 		type: "post",
		  		url: url,
		 	 	dataType: "text",
		  		data:$("#addTopic").serialize(),
		  		success:function(flag){
			  				if(flag==1){
				  				document.getElementById("tishi").innerHTML="*添加成功,可继续添加!";
				  				//重置
				  				document.getElementsByName("title")[0].value="";
				  				document.getElementsByName("optiona")[0].value="";
				  				 document.getElementsByName("optionb")[0].value="";
				  				document.getElementsByName("optionc")[0].value="";
				  				document.getElementsByName("optiond")[0].value="";
				  			}else{
				  				document.getElementById("tishi").innerHTML="*添加失败！";
				  			}
		  		}
		 });
		} else {// 修改
			$.ajax({
				type : "post",
				url : url,
				dataType : "text",
				data : $("#updateTopic").serialize(),
				success : function(flag) {
					if (flag == 1) {
						document.getElementById("tishi").innerHTML = "*修改成功!";
					} else {
						document.getElementById("tishi").innerHTML = "*修改失败！";
					}
				}

			});
			return false;

		}
	}
}
/**
 * 搜索检测
 */
function search(url){
	var searchValue=$("#searchTitle").val();
	if(searchValue!=""){
		main.location.href=url+"?type=search&index=1&searchTitle="+encodeURIComponent(searchValue);
	}
}

/**
 * 删除与修改
 * course:工程名
 */
function update(p,id,course){
	if(p==1){//点击修改
		window.location.href=course+"/servlet/TopicServlet?type=clickUpdate&id="+id;
	}else{
		 $.ajax({
		 		type: "post",
		  		url: course+"/servlet/TopicServlet",
		 	 	dataType: "text",
		  		data:"type=del&id="+id,
		  		success:function(flag){
		  			if(flag==1){
		  				$("#topic"+id).hide();
		  			}
		  		}
		  	});
		 
	}
}









