<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
       <meta name="viewport" content="width=device-width, initial-scale=1">
       <link rel="stylesheet" href="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.css">
       <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
       <script src="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.js"></script>
       <title>person table</title>
</head>
  
<body>

<div data-role="page" id="pg1">

	  <div data-role="content">
	    <p>类别</p>
	  </div>
	
		  <div data-role="footer">
			    <div data-role="navbar">
			      <ul>
			        <li><a href="#pg1" data-icon="gear">类别</a></li>
			        <li><a href="#pg2" data-icon="gear">季节</a></li>
			        <li><a href="#pg3" data-icon="gear">存放位置</a></li>
			        <li><a href="#pg4" data-icon="gear">使用人</a></li>
			      </ul>
			    </div>
		  </div>
	</div> 
	
<div data-role="page" id="pg2">

	  <div data-role="content">
	    <p>季节</p>
	  </div>
	
		  <div data-role="footer">
			    <div data-role="navbar">
			      <ul>
			        <li><a href="#pg1" data-icon="gear">类别</a></li>
			        <li><a href="#pg2" data-icon="gear">季节</a></li>
			        <li><a href="#pg3" data-icon="gear">存放位置</a></li>
			        <li><a href="#pg4" data-icon="gear">使用人</a></li>
			      </ul>
			    </div>
		  </div>
	</div> 
	
	
	<div data-role="page" id="pg3">

	  <div data-role="content">
	    <p>存放位置</p>
	  </div>
	
		  <div data-role="footer">
			    <div data-role="navbar">
			      <ul>
			        <li><a href="#pg1" data-icon="gear">类别</a></li>
			        <li><a href="#pg2" data-icon="gear">季节</a></li>
			        <li><a href="#pg3" data-icon="gear">存放位置</a></li>
			        <li><a href="#pg4" data-icon="gear">使用人</a></li>
			      </ul>
			    </div>
		  </div>
	</div> 
	
	
	<div data-role="page" id="pg4">

	  <div data-role="content"> 
	    <p>使用人</p>
	  </div>
	
		  <div data-role="footer">
			    <div data-role="navbar">
			      <ul>
			        <li><a href="#pg1" data-icon="gear">类别</a></li>
			        <li><a href="#pg2" data-icon="gear">季节</a></li>
			        <li><a href="#pg3" data-icon="gear">存放位置</a></li>
			        <li><a href="#pg4" data-icon="gear">使用人</a></li>
			      </ul>
			    </div>
		  </div>
	</div> 
	
	
	<div data-role="page" id="pg1">

	  <div data-role="content">
	    <p>111111111</p>
	  </div>
	
		  <div data-role="footer">
			    <div data-role="navbar">
			      <ul>
			        <li><a href="#pg1" data-icon="gear">类别</a></li>
			        <li><a href="#pg2" data-icon="gear">季节</a></li>
			        <li><a href="#pg3" data-icon="gear">存放位置</a></li>
			        <li><a href="#pg4" data-icon="gear">使用人</a></li>
			      </ul>
			    </div>
		  </div>
	</div> 

</body>
</html>
