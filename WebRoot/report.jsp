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
    *{margin: 0;padding: 0;}
    .lanren ul a{font-family: '微软雅黑';font-size: 14px;color: #333;text-decoration: none;}
    .lanren ul a:hover{color: #000;text-decoration: none;}
    .lanren ul li{width: 100px;height: 35px;line-height: 35px;text-align: center;position: relative;}
    .lanren ul li:hover{background: #c1c1c1;}
    .lanren ul{width: 100px;height: auto;position: absolute;background: #DADADA;list-style: none;}

    .lanren ul.nav2{left: 99px;top: 0;display: none;}
    .lanren ul.nav3{left: 99px;top: 0;display: none;}
    .lanren .nav1 .li1:hover ul.nav2{display: block;background: #c1c1c1;}
    .lanren .nav2 .li2:hover ul.nav3{display: block;background: #c1c1c1;}
</style>

</head>
<body>

<div id="graph">Loading graph...</div>

<script type="text/javascript">
	$(document).ready(function(){
	//就在7天柱状图
		fun_day(7);
			$("#btn7").click(function(){fun_day($(this).attr("value"))});
			$("#btn15").click(function(){fun_day($(this).attr("value"))});
			$("#btn20").click(function(){fun_day($(this).attr("value"))});
	});
	
		function fun_day(day){						
		$.post("./servlet/reportSer",{day:day},
					function (data) {
						fun_bar(data);
	}).
				error(function() { alert("网络有问题，请联系网管！"); });
				
				};
		function click(){
			fun_pie();
	};
	
	//柱状图
	function fun_bar(data){
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
			myChart.setTooltip([temp[j].date.date.toString(), temp[j].week.toString()],click);
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
		};
	//大饼图
	function fun_pie(){
		var myChart_pie = new JSChart('graph', 'pie');
		myChart_pie.setDataArray([['A', 40],['B', 16],['C', 20],['D', 10],['E', 10],['F', 4]]);
		myChart_pie.colorize(['#99CDFB','#3366FB','#0000FA','#F8CC00','#F89900','#F76600']);
		myChart_pie.setSize(600, 300);
		myChart_pie.setTitle('Phd Reference Chart');
		myChart_pie.setTitleFontFamily('Times New Roman');
		myChart_pie.setTitleFontSize(14);
		myChart_pie.setTitleColor('#0F0F0F');
		myChart_pie.setPieRadius(95);
		myChart_pie.setPieValuesColor('#FFFFFF');
		myChart_pie.setPieValuesFontSize(9);
		myChart_pie.setPiePosition(180, 165);
		myChart_pie.setShowXValues(false);
		myChart_pie.setLegend('#99CDFB', 'Papers where authors found');
		myChart_pie.setLegend('#3366FB', 'Papers which cite from other articles');
		myChart_pie.setLegend('#0000FA', 'Papers which cite from news');
		myChart_pie.setLegend('#F8CC00', 'Papers which lack crucial');
		myChart_pie.setLegend('#F89900', 'Papers with different conclusion');
		myChart_pie.setLegend('#F76600', 'Papers with useful information');
		myChart_pie.setLegendShow(true);
		myChart_pie.setLegendFontFamily('Times New Roman');
		myChart_pie.setLegendFontSize(10);
		myChart_pie.setLegendPosition(350, 120);
		myChart_pie.setPieAngle(30);
		myChart_pie.set3D(true);
		myChart_pie.draw();
		};
</script>
	<div class="lanren">
	<ul class="nav1">
	    <li c><a id="btn7" value="7">近7天</a>
	       <!--
	       <ul class="nav2">
	            <li class="li2"><a href="#">二级导航</a></li>
	            <li class="li2"><a href="#">二级导航</a>
	                <ul class="nav3">
	                    <li class="li3"><a href="#">三级导航</a></li>
	                    <li class="li3"><a href="#">三级导航</a></li>
	                    <li class="li3"><a href="#">三级导航</a></li>
	                    <li class="li3"><a href="#">三级导航</a></li>
	                </ul>
	            </li>
	            <li class="li2"><a href="#">二级导航</a></li>
	            <li class="li2"><a href="#">二级导航</a></li>
	        </ul> 
	         --> 
	    </li>
	    <li ><a  id="btn15" value="15">近15天</a></li>
	    <li ><a  id="btn20" value="20">近20天</a></li>
	</ul>
</div>
</body>

</html>
