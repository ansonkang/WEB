<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head id="h1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.css">
    <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script src="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.js"></script>
    <base href="<%=basePath%>">
    
    <title>My JSP 'table1.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<script type="text/javascript">

	$(document).ready(function(){
			{$.post("servlet/queServlet",{type:"go"},function(data){$("#div1").append(data).trigger("create");});}
			
			$("#submit").click(function(){
				var varAnswer="";
				var loginBtn=this;
				$("input:radio:checked").each(function(){varAnswer+=$(this).attr("id")+";"});

				$.post("servlet/queServlet",{type:"answer",answer:varAnswer},function(data){$("#div1").append(data).trigger("create");});
				/*提交按钮失效，以避免防止重新提交*/
				$(loginBtn).attr('disabled', 'disabled');
			}); 
	});
</script>
  </head>
  
  <body>
		  <div id="div1">
		  </div>
	  <input type="submit" data-inline="true" value="提交" id="submit">
	</body>
</html>
