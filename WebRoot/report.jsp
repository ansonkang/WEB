<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'report.jsp' starting page</title>
    
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
  </head>

<title>JSChart</title>

<script type="text/javascript" src="js/jscharts.js"></script>

</head>
<body>

<div id="graph">Loading graph...</div>

<script type="text/javascript">
	$(document).ready(function(){
			//var myData = new Array([1, 1], [2, 3], [3, 2], [4, 3], [5, 2], [6, 3], [7, 2]);
						$.post("./servlet/reportSer",{},
					function (data) {
					//字符串转JSON
					var temp=eval("("+data+")");
					
					var myData = new Array(['周一', 0], ['周二',0,], ['周三', 0], ['周四', 0], ['周五', 0], ['周六', 0], ['周日', 0]);
		for(var i=0;i<temp.length;i++)
		{
			//myData[i][0]=eval(temp[i].date.date);
			myData[i][0]=temp[i].date.date.toString();
			myData[i][1]=eval(temp[i].amount);
		}
	
		var colors = ['#FA5E1F', '#FDCB3F', '#71D743', '#D23333', '#BAE73F', '#AB7B55', '#B381C9'];
		var myChart = new JSChart('graph', 'bar');
		myChart.setDataArray(myData);
		myChart.colorizeBars(colors);
		myChart.setTitle('近7天业绩 （万元）');
		myChart.setTitleColor('#8E8E8E');
		myChart.setAxisNameX('日期');
		myChart.setAxisNameY('业绩');
		myChart.setAxisColor('#C4C4C4');
		myChart.setAxisNameFontSize(16);
		myChart.setAxisNameColor('#999');
		myChart.setAxisValuesColor('#7E7E7E');
		myChart.setBarValuesColor('#7E7E7E');
		myChart.setAxisPaddingTop(60);
		myChart.setAxisPaddingRight(140);
		myChart.setAxisPaddingLeft(150);
		myChart.setAxisPaddingBottom(40);
		myChart.setTextPaddingLeft(105);
		myChart.setTitleFontSize(11);
		myChart.setBarBorderWidth(1);
		myChart.setBarBorderColor('#C4C4C4');
		myChart.setBarSpacingRatio(50);
		myChart.setGrid(false);
		myChart.setSize(616, 321);
		myChart.setBackgroundImage('./js/chart_bg.jpg');
		myChart.draw();
					
	
	}).
				error(function() { alert("网络有问题，请联系网管！"); });
	


	});
</script>

</body>
</html>
