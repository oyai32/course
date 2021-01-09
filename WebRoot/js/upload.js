var course;//工程名
//页面加载调用方法获取工程名
 function can(c){
	 course=c;
 }
 

 $(function(){
	  $('#allPageSelect').change(function(){
	       // 1、当前选中的option的value属性
         var val = $(this).val();
         var pageIndex=val.substring(0,val.indexOf("/"));//当前页码
 		  window.location.href=course+"/servlet/UploadServlet?type=all&index="+pageIndex;
	  });
	  $('#myPageSelect').change(function(){
	       // 1、当前选中的option的value属性
        var val = $(this).val();
        var pageIndex=val.substring(0,val.indexOf("/"));//当前页码
		  window.location.href=course+"/servlet/UploadServlet?type=my&index="+pageIndex;
	  });

});
/**
 * 删除
 */
 function del(id){
	 $.ajax({
	 		type: "get",
	  		url: course+"/servlet/UploadServlet",
	 	 	data:"type=del&id="+id,
	 	 	dataType:"text",
	  		success:function(data){
	  			window.location.reload();
	 		}
		});
 }
/**
 * 检测
 */
function check(url,type) {
	var path = document.getElementsByName("path")[0].value;
		if (path == "") {
			document.getElementById("tishi").innerHTML = "*请选择文件路径！";
			return false;
		}else{
			return true;
		}
}

/**
 * 获取文件名称
 */
function getName(){
	  var path = document.getElementsByName("path")[0].files;  
      //名称  
      var name=path[0].name;  
      var filename=name.substring(0,name.lastIndexOf("."));//这个是获取除后缀疑问的名称
      
      document.getElementsByName("title")[0].value=filename;
}

/**
 * 搜索检测
 */
function search(){
	var searchValue=$("#searchTitle").val();
	if(searchValue!=""){
		main.location.href=course+"/servlet/UploadServlet?type=search&index=1&searchTitle="+encodeURIComponent(searchValue);
	}
}