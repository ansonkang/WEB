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
		$("button").click(function(){
		//根据点击的按钮，获取基础信息明细
					{
						var vNmae=$(this).attr("name");
						$.post("servlet/typeServlet",{type:"select",typeM:vNmae},function(data){
							$("#div").empty().append(data).trigger("create");
							$("#save").val(vNmae).trigger("create");
				})};
			});
		
			//新增按钮
			$("#add").click(function(){
				var newInput = document.createElement("input"); 
				newInput.id="new";
				newInput.value="AAA";
				$("#divNeW").append(newInput).trigger("create");
			});
			//保存按钮
			$("#save").click(function(){
				var v=$("#divNeW input").each(function(){
				//逐个上传保存，后续考虑用json一次性传值,还需判断保存是否成功，失败及失败原因
				$.post("servlet/typeServlet",{type:"add",typeM:$("#save").attr("value"),typeL:$(this).val()},function(data){});
				});
				alert("保存成功");
			});
	};
	
	$(document).ready(function(){
	//刷新时，获取基础信息
				{$.post("servlet/typeServlet",{type:"load"},function(data){
					$("#divFooter").append(data).trigger("create");
					funClick();
				})};
	});
</script>


<link rel="stylesheet" href="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.css">
<script src="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.js"></script>
</head>
<body >

		    <div data-role="header" id="divFooter" data-type="horizontal">
		    </div>
		    
		    <div id="div"></div>
		    <div id="divNeW"></div>
			
			<div data-role="footer" id="divFooter" data-type="horizontal">
		    		<a type="button" data-role="fieldcontain" data-icon="plus" data-inline="true" name="add" id="add">新增</a>
		    		<a type="button" data-role="fieldcontain" data-icon="check" data-inline="true" name="edit" id="edit">编辑</a>
		    		<a type="button" data-role="fieldcontain" data-icon="check" data-inline="true" name="save"  value="类别" id="save">保存</a>
		    </div>


</body>
</html>
