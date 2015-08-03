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
		
		$("#btnTS").click(function(){
		 $('#lab1').text("11111");
		});
		$("#down").click(function(){
			if($("#username").val()==""||$("#password").val()=="")
				{alert("用户名和密码不能为空");}
			else {$.post("ts.web/tsServlet",{username:$("#username").val(),password:$("#password").val(),type:"new"},function (data) {alert(data);});}
			
		});
	});
</script>

  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.css">
    <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script src="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.js"></script>
    <base href="<%=basePath%>">
    
    <title>My JSP 'table.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <title>table</title>
  <body>
  	<a href="" id="btnTS" data-role="button">Link button</a>
  	<br>
	<form id='f1'>
  	<p>喜爱的颜色：</p>
  		<fieldset data-role="controlgroup">
  			<legend>请选择您喜爱的颜色：</legend>
  			<label for="red" id="lab1">红色</label>
  			<input type="radio" name="favcolor" id="red"
  				value="red">
  			<label for="green" id="lab2">绿色</label>
  			<input type="radio" name="favcolor" id="green"
  				value="green">
  			<label for="blue" id="lab3">蓝色</label>
  			<input type="radio" name="favcolor" id="blue"
  				value="blue">
  			<label for="yellow" id='lab4'>黄色</label>
  			<input type="radio" name="favcolor" id="yellow"
  				value="yellow">
  		</fieldset>
  	</form>
  	<div data-role="controlgroup" data-type="horizontal">
  		<a href="" id="up" data-role="button" data-rel="back">返回</a>
  		<a href="" id="down" data-role="button">下一题</a>
  	</div>
  </body>
</html>
