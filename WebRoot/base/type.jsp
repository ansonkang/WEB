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
       
       <script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>

	<script type="text/javascript">
	
		$(document).ready(function(){
					$.post("servlet/typeServlet",{type:"123"},function (data) {alert("22");});
			$("#add").click(function(){
			

			
						alert($("#type1").attr("value"));

			});

		});
	</script>
</head>
  
<body>

<div data-role="page" id="pg1">

	<div data-role="header">
	        <a href="#" data-role="button" id="edit">编辑</a>
			<h1>基础信息</h1>
	        <a href="#" data-role="button" class="ui-btn-right" data-icon="plus" id="add">增加</a>
	 </div>
	 
	  <div data-role="content" id="div1">
	    <p id="p1">类别</p>
	   </div>
						  <div data-role="footer">
							    <div data-role="navbar">
							      <ul>
							        <li><a href="#pg1" data-icon="gear" id="type1" value="类别">类别</a></li>
							        <li><a href="#pg2" data-icon="gear">季节</a></li>
							        <li><a href="#pg3" data-icon="gear">存放位置</a></li>
							        <li><a href="#pg4" data-icon="gear">使用人</a></li>
							      </ul>
							</div>
				  </div>
		</div> 
	
<div data-role="page" id="pg2">
	<div data-role="header">
	        <a href="#" data-role="button" id="edit">编辑</a>
			<h1>基础信息</h1>
	        <a href="#" data-role="button" class="ui-btn-right" data-icon="plus" id="add">增加</a>
	 </div>

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
	<div data-role="header">
	        <a href="#" data-role="button" id="edit">编辑</a>
			<h1>基础信息</h1>
	        <a href="#" data-role="button" class="ui-btn-right" data-icon="plus" id="add">增加</a>
	 </div>

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
	<div data-role="header">
	        <a href="#" data-role="button" id="edit">编辑</a>
			<h1>基础信息</h1>
	        <a href="#" data-role="button" class="ui-btn-right" data-icon="plus" id="add">增加</a>
	 </div>

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
	
	
<div data-role="page" id="pg5">
	<div data-role="header">
	        <a href="#" data-role="button" id="edit">编辑</a>
			<h1>基础信息</h1>
	        <a href="#" data-role="button" class="ui-btn-right" data-icon="plus" id="add">增加</a>
	 </div>

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
