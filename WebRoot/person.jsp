<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'person.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<link rel="stylesheet" href="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.css">
	<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script src="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.js"></script>
	<script type="text/javascript">
	
	$(document).ready(function(){
	//手机摇动功能
		init();
	});
	function funGOClick(){
	var v=$("#inGo").val();
	var div=$("#div");
	div.empty();
		{$.post("servlet/personSer",{msg:v},function(data){div.append(data).trigger("create")});}
	};
	
	
	function init() {
	    if (window.DeviceMotionEvent) {
	        // 移动浏览器支持运动传感事件
	        window.addEventListener('devicemotion', deviceMotionHandler, false);
	    }
	}
	var SHAKE_THRESHOLD = 30;
	// 定义一个变量保存上次更新的时间
	var last_update = 0;
	// 紧接着定义x、y、z记录三个轴的数据以及上一次出发的时间
	var x;
	var y;
	var z;
	var last_x;
	var last_y;
	var last_z;
	var count = 0;
	var num = 0;
	var lastSpeed = 0;
	var timer;
	function deviceMotionHandler(eventData) {
	    // 获取含重力的加速度
	    var acceleration = eventData.accelerationIncludingGravity;
	    // 获取当前时间
	    var curTime = new Date().getTime();
	    var diffTime = curTime - last_update;
	    // 固定时间段
	    if (diffTime > 20) {
	        last_update = curTime;
	        x = acceleration.x;
	        y = acceleration.y;
	        z = acceleration.z;
	
	        //var speed = Math.abs(x + y + z - last_x - last_y - last_z) / diffTime * 30000;
	        var speed = Math.sqrt(x * x + y * y + z * z);
	        var ds = Math.abs(speed - lastSpeed);
	
	
	        if (ds > SHAKE_THRESHOLD) {
	            // TODO:在此处可以实现摇一摇之后所要进行的数据逻辑操作
	            count++;
	            clearTimeout(timer);
	            timer = setTimeout(function () {
	                window.removeEventListener('devicemotion', deviceMotionHandler, false);
	                //alert("2秒内没有增加摇动次数，摇动结束");
	                //alert("您摇动了：" + count + "次！");
	                $("#h1").text(count);
	                init();
	            }, 2000);
	
	        }
	        last_x = x;
	        last_y = y;
	        last_z = z;
	        if (count / 2 > 10) {
	            alert("亲,最高不超过11次哦!");
	            $("#shaketext").html(Math.round(count / 2));
	            count = 0;
	        }
	        lastSpeed = speed;
	    }
	} 



	
  	</script>
  </head>
  
  <body>
    This is my JSP page. <br>
    <input id="inGo"></input>
    <button id="go" onclick="funGOClick()">GO</button>
    <div id="div"></div>
    <h1 id="h1">0</h1>
    
  </body>
</html>
