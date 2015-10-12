<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>餐票</title>
    
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
	function funWeekend(day_S,day_E){
	//根据数据的日期，计算该区间内周末的天数，周六+周天
		var vNum=funDay(day_S,day_E);//计算间隔天数
		var j=0;
		var d=day_S;
		for(var i=0;i<vNum;i++)
			{
			d.getDay();
				if(d.getDay()==0)
					j=j+1;
				if(d.getDay()==6)
					j=j+1;
				d=new Date(d.setDate(d.getDate()+1));
			}
		return j;
	}
		function funDay(day_S,day_E){
	//根据数据的日期，计算该区间天数
		var vN=parseInt((day_E-day_S) / 1000 / 60 / 60 / 24)+2;//计算间隔天数
		return vN;
	}
	$(document).ready(function(){
		$("#count").change(function(){
			var v= $(this).val();
			
			var vData=26;//开始日期，每月26号
			var vData_E= new Date();
			var vMonth=vData_E.getMonth()+1;
			if(vData_E.getDate()>=vData)
					{var vMonth=vMonth+1;}//特殊情况，27，28申请餐票
			vData_E=new Date(vData_E.getFullYear()+'/'+vMonth+'/'+vData);
			var vData_S= new Date();//结算日期，当前时间	
			var d=funDay(vData_S,vData_E);		
			var w=funWeekend(vData_S,vData_E);
			
			$("#day").val(d-w);
			if(v-d+w>=0)
				{
					$("#red").val(v-d+w);
					$("#add").val(0);
				}
			else
				{	
					$("#red").val(0);
					$("#add").val(-(v-d+w));
				}
		});
		
				$("#day").change(function(){
					var d= $("#day").val();
					
					var t= $("#count").val();
					
					if(d!=""&&d!=null)
					  {
					  	var c=t-d;
					  	
					  	if(c>=0)
							{
								$("#add").val(c);
								$("#red").val(0);
								
							}
						else
							{	
								$("#add").val(0);
								$("#red").val(-c);
								
							}
					  }
		});

	});
</script>
  </head>
  
  <body>
  	现有餐票数量 <br>
 	<div data-role="fieldcontain">
	 		<input id="count" min="0" max="18" value="0" type="range" />
 	</div>
 		今天至26号，计划用餐总天数 (含今天)<br><input id="day" />
		需领用餐票数量 <br><input id="add" readonly="true"/>
 		需退餐票数量 <br><input id="red" readonly="true"/>
</body>
</html>
