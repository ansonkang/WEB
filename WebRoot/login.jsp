<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
		 <meta name="viewport" content="width=device-width, initial-scale=1">
       <link rel="stylesheet" href="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.css">
       <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
       <script src="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.js"></script>

<script type="text/javascript">
	//新建cookie 方法。   
	//hours为空字符串时,cookie的生存期至浏览器会话结束。hours为数字0时,建立的是一个失效的cookie,这个cookie会覆盖已经建立过的同名、同path的cookie（如果这个cookie存在）。   
	function setCookie(name,value,hours,path){   
	    var name = escape(name);   
	    var value = escape(value);   
	    var expires = new Date();   
	    expires.setTime(expires.getTime() + hours*3600000);   
	    path = path == "" ? "" : ";path=" + path;   
	    _expires = (typeof hours) == "string" ? "" : ";expires=" + expires.toUTCString();   
	    document.cookie = name + "=" + value + _expires + path;   
	}   
	//获取cookie值    方法
	function getCookieValue(name){   
	    var name = escape(name);   
	    //读cookie属性，这将返回文档的所有cookie   
	    var allcookies = document.cookie;          
	    //查找名为name的cookie的开始位置   
	    name += "=";   
	    var pos = allcookies.indexOf(name);       
	    //如果找到了具有该名字的cookie，那么提取并使用它的值   
	    if (pos != -1){                                             //如果pos值为-1则说明搜索"version="失败   
	        var start = pos + name.length;                  //cookie值开始的位置   
	        var end = allcookies.indexOf(";",start);        //从cookie值开始的位置起搜索第一个";"的位置,即cookie值结尾的位置   
	        if (end == -1) end = allcookies.length;        //如果end值为-1说明cookie列表里只有一个cookie   
	        var value = allcookies.substring(start,end);  //提取cookie的值   
	        return unescape(value);                           //对它解码         
	        }      
	    else return "";                                             //搜索失败，返回空字符串   
	}   
	
			function submitFunc(){
		//点击登录时 ，将输入的用户名和密码保存到Cookie中
		var inUser = document.getElementById("j_username").value;
		var inPass = document.getElementById("j_password").value; 
		setCookie('cookUser', inUser, time, '/');//set 获取用户名和密码 传给cookie
		setCookie('cookPass', inPass, time, '/');
		//if(checkedImage()){
		//document.form1.submit();
		//}
		}
		
		//设置Cookie保存时间
		var time = 0;
		
		$(document).ready(function(){
			//获取Cookie保存的用户名和密码
			var username = getCookieValue("cookUser");
			var password = getCookieValue("cookPass");
			//输入用户名 促发一个事件
			$("#j_username").keyup(function(){
			var userNow = $(this).val();
			if(userNow == username) { //判断现在输入的用户名  和 当时保存在cookie的用户名是否一致
			$("#j_password").val(password);//一致 则把 第一次 保存在cookie的密码 自动填入
			}
			});
			
			$("#rememberPW").click(function(){//记住密码
			if($(this).is(':checked')){
				time = 60 * 60 * 60;
			}
			});
		});

</script>
  </head>
  
  <body>
  	<div data-role="content">
	    <input type="text"  id="j_username" name="j_username" value="">
		<input type="password"   id="j_password" name="j_password" value="" />
		<label for="rememberPW">记住密码</label>
		<input type="checkbox" id="rememberPW" name="rememberPW" value=""></input>
		<button onclick="submitFunc()"></button>
	</div>
  </body>
</html>
