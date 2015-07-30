<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>

<script type="text/javascript">

	$(document).ready(function(){
		$("#submit").click(function(){
			if($("#username").val()==""||$("#password").val()=="")
				{alert("用户名和密码不能为空");}
			else {$.post("ts.web/tsServlet",{username:$("#username").val(),password:$("#password").val()},function (data) {alert(data);});}
			
		});
	});
</script>

<head>
       <meta name="viewport" content="width=device-width, initial-scale=1">
       <link rel="stylesheet" href="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.css">
       <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
       <script src="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.js"></script>
       <title>person table</title>
</head>
<body>
       <form target="hiddenIFrame">
       	<div data-role="fieldcontain">
       		<label for="text-1">用户名:</label>
       		<input name="username" id="username"
       			data-clear-btn="true" value="" type="text" data-inline="true"/>
       	</div>
       	<div data-role="fieldcontain">
       		<label for="text-1">密   码:   </label>
       		<input name="password" id="password" data-clear-btn="true"
       			value="" type="text" data-inline="true"/>
       	</div>
       	<a href="" id="submit" data-role="button" data-inline="true">提交</a>
       </form>
       <iframe style="display:none" name="hiddenIFrame" id="hiddenIFrame"/>
</body>
</html>
