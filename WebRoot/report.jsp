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

<style>
*{margin:0;padding:0;list-style-type:none;}
a,img{border:0;}
body{font:12px/180% Arial, Helvetica, sans-serif, "新宋体";}

.rotary{position:relative;width:854px;height:504px;margin:50px auto 0 auto;background:#d71f2e url(photo/rotary/bg1.png);}
.btn7{position:absolute;left:10px;top:104px;width:100px;height:30px;cursor:pointer;}
.btn15{position:absolute;left:10px;top:134px;width:100px;height:30px;cursor:pointer;}
.btn20{position:absolute;left:10px;top:164px;width:100px;height:30px;cursor:pointer;}
</style>

</head>
<body>

<div id="graph">Loading graph...</div>

<script type="text/javascript">
	function fun_day(day){						
		$.post("./servlet/reportSer",{day:day},
					function (data) {
					//字符串转JSON
					var temp=eval("("+data+")");

					var myData=new Array();
					var colors=new Array();
		for(var i=0;i<temp.length;i++)
		{
			colors[i]='#7CBD0F';
			

			var arr=new Array();
			arr[0]=temp[i].date.date.toString();//+'\n'+temp[i].week.toString()
			arr[1]=temp[i].amount;
			myData[i]=arr;
			
		}

		var myChart = new JSChart('graph', 'bar');
		myChart.setDataArray(myData);
		//设置点击弹出提示
		for(var j=0;j<temp.length;j++)
		{
			myChart.setTooltip([temp[j].date.date.toString(), temp[j].week.toString()]);
		}
		
		myChart.setTooltipPosition('ne');//N北  e东  右上
		
		myChart.colorizeBars(colors);
		myChart.setTitle('近期业绩 （万元）');
		myChart.setTitleColor('#8E8E8E');
		myChart.setAxisNameX('');
		myChart.setAxisNameY('业绩');
		//倾斜度
		//myChart.setAxisValuesAngle(30);
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
				
				};
	$(document).ready(function(){
		fun_day(7);
		$("#btn7").click(function(){fun_day($(this).attr("value"))});
		$("#btn15").click(function(){fun_day($(this).attr("value"))});
		$("#btn20").click(function(){fun_day($(this).attr("value"))});
	});
</script>
       	<a href="" id="btn7" class="btn7"  data-role="button" value="7">最近7天</a>
       	<a href="" id="btn15"  class="btn15" data-role="button" value="15">15天</a>
       	<a href="" id="btn20"  class="btn20" data-role="button" value="20">20天</a>
</body>

</html>
