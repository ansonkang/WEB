<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'link.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<link rel="stylesheet" href="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.css">
	<script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
	<script src="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.js"></script>

  </head>
  
  <body>
    <div data-role="page" id="pageone">
  <div data-role="content">
    <ul data-role="listview" data-inset="true">
      <li data-role="divider">各种快捷</li>
      <li>
        <a data-ajax="false" href="./ticket.jsp">
        <img src="./photo/ticket.png">
        <h2>我要餐票</h2>
        <p>直链，餐票订购.</p>
        </a>
      </li>
      
      <li>
        <a data-ajax="false" href="./report.jsp">
        <img src="./photo/report.jpg">
        <h2>报表</h2>
        <p>常用报表</p>
        </a>
      </li>
      
      <li>
        <a data-ajax="false" href="#">
        <img src="./photo/wait.png">
        <h2>装修中。。。</h2>
        <p>ba la ba la ba la  搬砖中.</p>
        </a>
      </li>
    </ul>
  </div>
  </body>
</html>
