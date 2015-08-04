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
		$("#new").click(function(){
			if($("#username").val()==""||$("#password").val()=="")
				{alert("用户名和密码不能为空");}
			else {$.post("ts.web/tsServlet",{username:$("#username").val(),password:$("#password").val(),type:"new"},function (data) {alert(data);});}
			
		});
		$("#up").click(function(){
						if($("#username").val()==""||$("#password").val()=="")
							{alert("用户名和密码不能为空");}
			else {$.post("ts.web/tsServlet",{username:$("#username").val(),password:$("#password").val(),type:"up"},
					function (data) {
						if(data=="nona"){alert("无此用户，请核实用户名！");}
						else if(data=="error"){alert($("#username").val()+",你的密码有误！");}
						else if(data=="ok"){
										alert($("#username").val()+",欢迎你的登录！");
										location.href="./table1.jsp";
									 }
						else{alert(data);}
									});
				}
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
       	<div data-role="fieldcontain">
       		<input name="username" id="username"
       			data-clear-btn="true" value="" type="text" data-inline="true"  placeholder="用户名..."/>
       	</div>
       	<div data-role="fieldcontain">
       		<input name="password" id="password"
       			data-clear-btn="true" value="" type="text" data-inline="true"  placeholder="密码..."/>
       	</div>
       	<div data-role="controlgroup" data-type="horizontal">
       	<a href="" id="new" data-role="button"
       		 >
       		注册
       	</a>
       	<a href="" id="up" data-role="button"  >登录</a>
       	</div>
       </form>
</body>
</html>
