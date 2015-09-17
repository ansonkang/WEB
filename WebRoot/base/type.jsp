<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'type.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
	// 自定义函数
	function funClick(){
			//1据点击的按钮，获取基础信息明细
			$("button").click(function(){
							var vNmae=$(this).attr("name");
							$.post("servlet/typeServlet",{type:"select",typeM:vNmae},function(data){
								$("#div").empty().append(data).trigger("create");
								$("#save").val(vNmae).trigger("create");
								$("#divNeW").empty();
								//按住1秒，编辑
									  $("p").on("taphold",function(){									    
									    $(this).click(function(){
									    	location.href="./base/type.jsp#pagetwo";
									    	var vPageTwo=$(this);
									    	$("#pEdit").val(vPageTwo.html());
									    	$("#pEdit").attr("name",vPageTwo.attr("id"));
									    	vPageTwo.hide();
									    				});
									 	 });
							})
					}
				);
		
			//2新增按钮
			$("#add").click(function(){
				var newInput = document.createElement("input"); 
				newInput.id="new";
				newInput.placeholder="请录入，新增信息";
				$("#divNeW").append(newInput).trigger("create");
				$("#add").hide(1).trigger("create");
				$("#save").show().trigger("create");
			});
			//3保存按钮
			$("#save").click(function(){
				$("#divNeW input").each(function(){
				//逐个上传保存，后续考虑用json一次性传值,还需判断保存是否成功，失败及失败原因
				$.post("servlet/typeServlet",{type:"add",typeM:$("#save").attr("value"),typeL:$(this).val()},function(data){}).error(function() { alert("网络有问题，请联系网管");});
												});
				$("#add").show();
				var vName=$("#save").attr("value");
				alert(vName+"，保存成功！");
				$("button[name="+vName+"]").click();
			});
			
			//4 pagetwo页面删除按钮
			$("#pDelete").click(function(){
				$.post("servlet/typeServlet",{type:"delete",typeM:$("#pEdit").attr("name")},function(data){location.href="./base/type.jsp#pageone"});
			});
			//5 pagetwo页面保存按钮
			$("#pSvae").click(function(){
			});
			
	};
	
	$(document).ready(function(){
	//刷新时，获取基础信息
				{$.post("servlet/typeServlet",{type:"load"},function(data){
					$("#divFooter").append(data).trigger("create");
					//按钮赋权
					funClick();
					}
				)};
	});
</script>


<link rel="stylesheet" href="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.css">
<script src="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.js"></script>
</head>
<body  >
	<div data-role="page" id="pageone">
		    <div data-role="fieldcontain" id="divFooter" data-role="controlgroup" data-type="horizontal">
		    </div>
		    
		    <div id="div" class="ui-grid-a" ></div>
		    <div id="divNeW"></div>
			
			<div data-role="fieldcontain"   data-role="controlgroup" data-type="horizontal">
		    		<a type="button" data-role="fieldcontain" data-icon="plus" data-inline="true" name="add" id="add">新增</a>
		    		<a type="button" data-role="fieldcontain" data-icon="check" data-inline="true" name="save"  value="类别" id="save">保存</a>
		    </div>
	</div>  
	
	<div data-role="page" id="pagetwo">

		  <div data-role="content" id="change">
			<input id="pEdit" name="test"></input>
		  </div>

			  <div data-role="footer">
			  <a type="button" data-role="fieldcontain" data-icon="delete" data-inline="true" name="edit" id="pDelete">删除</a>
			  <a type="button" data-role="fieldcontain" data-icon="check" data-inline="true" name="edit" id="pSave">保存</a>
			  </div>
	</div>   



</body>
</html>
