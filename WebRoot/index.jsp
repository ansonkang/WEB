<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>

<script type="text/javascript">
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
					var inUser = document.getElementById("username").value;
					var inPass = document.getElementById("password").value; 
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
			$("#username").keyup(function(){
			var userNow = $(this).val();
			if(userNow == username) { //判断现在输入的用户名  和 当时保存在cookie的用户名是否一致
			$("#password").val(password);//一致 则把 第一次 保存在cookie的密码 自动填入
			}
			});
			
			$("#rememberPW").click(function(){//记住密码
			if($(this).is(":checked")){
			time = 60 * 60 * 60;
			}
			});
			
			$("#rememberPW").click();//默认保存密码
			
	//新建账号
		$("#new").click(function(){
			if($("#username").val()==""||$("#password").val()=="") {alert("用户名和密码不能为空");}
			else {$.post("ts.web/tsServlet",{username:$("#username").val(),password:$("#password").val(),type:"new"},function (data) {alert(data);}).
				error(function() { alert("网络有问题，请联系网管"); });}
			
		});
		//登录账号
		$("#up").click(function(){
						if($("#username").val()==""||$("#password").val()=="") {alert("用户名和密码不能为空");}
			else {$.post("ts.web/tsServlet",{username:$("#username").val(),password:$("#password").val(),type:"up"},
					function (data) {
						if(data=="nona"){alert("无此用户，请核实用户名！");}
						else if(data=="ok"){alert($("#username").val()+",欢迎你的登录！");location.href="./ticket.jsp";}
						else{alert(data);}})
							.error(function() { alert("网络有问题，请联系网管");});
				}
		});
	});
</script>

<head>
       <meta name="viewport" content="width=device-width, initial-scale=1">
       <link rel="stylesheet" href="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.css">
       <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
       <script src="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.js"></script>
       <title>登录页面</title>
</head>
<body>
       	<div data-role="fieldcontain">
       		<input name="username" id="username"
       			data-clear-btn="true" value="" type="text" data-inline="true"  placeholder="用户名..."/>
       	</div>
       	<div data-role="fieldcontain">
       		<input name="password" id="password"
       			data-clear-btn="true" value="" type="password" data-inline="true"  placeholder="密码..."/>
       	</div>
       	<div data-role="controlgroup" data-type="horizontal">
       			<label for="rememberPW">记住密码</label>
		<input type="checkbox" id="rememberPW" name="rememberPW" value="" ></input>
       	<a href="" id="new" data-role="button">注册</a>
       	<a href="" id="up" data-role="button"  onclick="submitFunc()">登录</a>
       	</div>
       </form>
</body>
</html>
