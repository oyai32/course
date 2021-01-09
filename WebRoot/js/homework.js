var course;//工程名
var quanXuan=false;//已全选

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
	//---------------------------点击全选
	  $('.collect button:eq(0)').click(function(){
		 var length=document.getElementsByName("checkbox").length; 
		 if(!quanXuan){//未全选
			 for(var i=0;i<length;i++){
				 document.getElementsByName("checkbox")[i].checked=true;
			 }
			 quanXuan=true;
		 }else{
			 for(var i=0;i<length;i++){
				 document.getElementsByName("checkbox")[i].checked=false;
			 }
			 quanXuan=false;
		 }
	  });
	//-----------------点击批量下载
	  $('.collect button:eq(1)').click(function(){
			 var length=document.getElementsByName("checkbox").length; 
			var filenames="";
			 for(var i=0;i<length;i++){
				 if(document.getElementsByName("checkbox")[i].checked){
					 filenames=filenames+$("#filename"+(i+1)).html()+",";
				 }
			 }
			 var give_time=$("h3").html();
			 var subject=$(".subject:eq(0)").html();
			 $.ajax({
				url: course+"/servlet/CollectWorkServlet",
				type:"post",
				dataType:"text",
				data:"filenames="+filenames+"&give_time="+give_time+"&subject="+subject,
				success:function(){
					$("#tishi").html("已成功下载至桌面:【"+subject+"】"+give_time+".zip");
				
				}
				 
			 });
			 
			// window.location.href=course+"/servlet/CollectWorkServlet?type=down&give_time="+give_time+"&subject="+subject+"&filenames="+encodeURIComponent(filenames);
	  });
});

/**
 * 检测
 */
function check() {
	var path = document.getElementsByName("path")[0].value;
	var time = document.getElementsByName("give_time")[0].value;
		if (path == "") {
			document.getElementById("tishi").innerHTML = "*请选择文件路径！";
			return false;
		}else if(time==""){
			document.getElementById("tishi").innerHTML = "*请选择作业布置日期！";
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
 *
 *p:1:学生 2:老师
 */
function search(p){
	var subject=$("#subject").val();
		if(p==1){
			var start_time=$("#start_time").val();
			var end_time=$("#end_time").val();
			if(subject!=""&&start_time!=""&&end_time!=""){
				main.location.href=course+"/servlet/HomeWorkServlet?type=search&subject="+encodeURIComponent(subject)+"&start_time="+start_time+"&end_time="+end_time;
			}
		}else{
			var give_time=$("#give_time").val();
			if(give_time!=""){
				main.location.href=course+"/servlet/CollectWorkServlet?type=search&subject="+encodeURIComponent(subject)+"&give_time="+give_time;
			}
		}
}