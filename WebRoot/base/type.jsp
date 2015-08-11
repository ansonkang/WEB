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
												{$.post("servlet/typeServlet",{type:$(this).attr("name")},function(data){
					
					$("#div").empty().append(data).trigger("create");
				})};
			});
	};
	
	$(document).ready(function(){
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

		    <div data-role="controlgroup" id="divFooter" data-type="horizontal">
		    </div>
		    <div id="div"></div>


</body>
</html>
