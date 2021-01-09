var course;//工程名
//页面加载调用方法获取工程名
 function can(c){
	 course=c;
 }
 
/**
 * 页面加载
 */
$(function(){
	  $('.search button').click(function(){//点击搜索按钮
		  var subject=$("input[name=search]").val();
			if(subject!=""){
				main.location.href=course+"/servlet/TestServlet?type=search&subject="+encodeURIComponent(subject);
			}
	  });
});

/**
 *提交试卷
 */
function tijiao(test_id) {
	var flag=true;//选项为空标记
	var qrFlag=true;//确认提交标记
	var myanswer="";//我的答案。用逗号隔开
	var radio;
	for(var j=1;j<=10;j++){
		radio=document.getElementsByName("topic"+j);
		for(var i=0;i<radio.length;i++){
			if(radio[i].checked){
				flag=true;
				myanswer=myanswer+radio[i].value+",";
				break;
			}else{
				flag=false;
			}
		}
		if(!flag){//有选项为空的题
			myanswer=myanswer+"0,";
			if(confirm("第"+j+"题未选择,是否继续提交?")){
				qrFlag=true;
			}else{
				qrFlag=false;
				break;
			}
		}
	}
	if(qrFlag){
		 $.ajax({
		 		type: "post",
		  		url: course+"/servlet/TestServlet",
		 	 	dataType: "json",
		  		data:"type=pigai&myanswer="+encodeURIComponent(myanswer)+"&test_id="+test_id,
		  		success:function(data){
		  			var worryList=data;
		  			
		  			var count=0;//正确的题目数
		  			var bian;//页面上对应的编号
		  			for(var i=0;i<worryList.length;i++){
		  				bian=i+1;
		  				if(worryList[i]=="1"){//答案正确
		  					$("#right"+bian).show();
		  					count++;
		  				}else{//答案错误
		  					$("#worry"+bian).show();
		  					$("#worry"+bian).html("× 正确答案:"+worryList[i]);
		  				}
		  			}
		  			$(".test-top span").html(count*10+"分");
		  			$(".test-top span").show();
		  			$(".test-bottom").hide();
		  		}
		 });
	}
return false;
}
