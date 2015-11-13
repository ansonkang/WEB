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
.body{font:12px/180% Arial, Helvetica, sans-serif, "新宋体";}
.btn7{position:absolute;left:1px;top:104px;width:10px;height:30px;cursor:pointer;}
.btn15{position:absolute;left:1px;top:134px;width:10px;height:30px;cursor:pointer;}
.btn20{position:absolute;left:1px;top:164px;width:10px;height:30px;cursor:pointer;}
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
		$.post("./servlet/reportSer",{type:"bar",day:day},
					function (data) {
						fun_bar(data);
	}).
				error(function() { alert("网络有问题，请联系网管！"); });
				
				};
		//点击红圈时触发
		function click(){
				$.post("./servlet/reportSer",{type:"pie",day:2},
					function (data) {fun_pie(data);}).
				error(function() { alert("网络有问题，请联系网管！"); });
				
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
	function fun_pie(data){
	
							//字符串转JSON
					var temp=eval("("+data+")");

					var myData=new Array();
					var colors=new Array();
		for(var i=0;i<temp.length;i++)
		{
			colors[i]='#7CBD0F';
			

			var arr=new Array();
			arr[0]=temp[i].id.brand.toString();
			arr[1]=temp[i].id.amount;
			myData[i]=arr;
			
		}

		var myChart_pie = new JSChart('graph', 'pie');
		myChart_pie.setDataArray(myData);
		//myChart_pie.setDataArray([['A', 40],['B', 16],['C', 20],['D', 10],['E', 10],['F', 4]]);
		//myChart_pie.colorize(['#99CDFB','#3366FB','#0000FA','#F8CC00','#F89900','#F76600']);
		myChart_pie.setSize(600, 300);
		myChart_pie.setTitle('前5品牌贡献率');
		myChart_pie.setTitleFontFamily('Times New Roman');
		myChart_pie.setTitleFontSize(14);
		myChart_pie.setTitleColor('#0F0F0F');
		myChart_pie.setPieRadius(95);
		myChart_pie.setPieValuesColor('#FFFFFF');
		myChart_pie.setPieValuesFontSize(9);
		myChart_pie.setPiePosition(300, 165);
		//myChart_pie.setShowXValues(false);
		//设置副标题
		//myChart_pie.setLegend('#99CDFB', 'Papers where authors found');
		//myChart_pie.setLegend('#3366FB', 'Papers which cite from other articles');
		//myChart_pie.setLegend('#0000FA', 'Papers which cite from news');
		//myChart_pie.setLegend('#F8CC00', 'Papers which lack crucial');
		//myChart_pie.setLegend('#F89900', 'Papers with different conclusion');
		//myChart_pie.setLegend('#F76600', 'Papers with useful information');
		myChart_pie.setLegendShow(true);
		myChart_pie.setLegendFontFamily('Times New Roman');
		myChart_pie.setLegendFontSize(10);
		myChart_pie.setLegendPosition(350, 120);
		myChart_pie.setPieAngle(30);
		myChart_pie.set3D(true);
		myChart_pie.draw();
		};
</script>
	<div class="div">
	<ul class="nav1">
		<li href="" id="btn7" class="btn7"  data-role="button" value="7">最近7天</li>
       	<li href="" id="btn15"  class="btn15" data-role="button" value="15">15天</li>
       	<li href="" id="btn20"  class="btn20" data-role="button" value="20">20天</li>
	</ul>
</div>
</body>

</html>
