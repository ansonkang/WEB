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
						var myData=new Array([1, 2], [2, 3], [3, 2], [4, 3], [5, 2], [6, 3], [7, 2]);
						myData[1][1]=5;
						var myChart = new JSChart('graph', 'line');
	myChart.setDataArray(myData);
	myChart.setTitle('周报');
	myChart.setTitleColor('#8E8E8E');
	myChart.setTitleFontSize(11);
	myChart.setAxisNameX('');
	myChart.setAxisNameY('');
	myChart.setAxisColor('#8420CA');
	myChart.setAxisValuesColor('#949494');
	myChart.setAxisPaddingLeft(100);
	myChart.setAxisPaddingRight(120);
	myChart.setAxisPaddingTop(50);
	myChart.setAxisPaddingBottom(40);
	myChart.setAxisValuesDecimals(3);
	myChart.setAxisValuesNumberX(10);
	myChart.setShowXValues(false);
	myChart.setGridColor('#C5A2DE');
	myChart.setLineColor('#BBBBBB');
	myChart.setLineWidth(2);
	myChart.setFlagColor('#9D12FD');
	myChart.setFlagRadius(4);
	myChart.setTooltip([1, 'GDP 7.80']);
	myChart.setTooltip([2, 'GDP 4.80']);
	myChart.setTooltip([3, 'GDP 6.50']);
	myChart.setTooltip([4, 'GDP 6.10']);
	myChart.setTooltip([5, 'GDP 4.40']);
	myChart.setTooltip([6, 'GDP 5.80']);
	myChart.setTooltip([7, 'GDP 4.00']);
	myChart.setLabelX([1, 'Mon']);
	myChart.setLabelX([2, 'Tue']);
	myChart.setLabelX([3, 'Wen']);
	myChart.setLabelX([4, 'Thu']);
	myChart.setLabelX([5, 'Fri']);
	myChart.setLabelX([6, 'Sat']);
	myChart.setLabelX([7, 'Sum']);
	myChart.setSize(616, 321);
	//myChart.setBackgroundImage('chart_bg.jpg');
	myChart.draw();
	
	}).
				error(function() { alert("网络有问题，请联系网管"); });
	


	});
</script>

</body>
</html>
