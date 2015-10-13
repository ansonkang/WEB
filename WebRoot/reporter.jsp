<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head id="h1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.css">

    
    <base href="<%=basePath%>">
    
    <title>My JSP 'table1.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->


        <script type="text/javascript" src="https://www.google.com/jsapi?autoload={'modules':[{'name':'visualization','version':'1.1','packages':
['corechart','motionchart']}]}"></script><script type="text/javascript" src="https://www.google.com/jsapi?autoload={'modules':[{'name':'visualization',
'version':'1.1','packages':['corechart','motionchart']}]}"></script>
        <script type="text/javascript">

        google.load('visualization', '1.1', { 'packages': ['corechart'], 'language': 'zh' });
        google.setOnLoadCallback(drawChart);

        function drawChart()
        {
            /// <summary>繪製圖表</summary>

            var jsonData = $.ajax({
                url: "../Handler/GetData.ashx",
                dataType: "json",
                async: false,
                data: {ct:"column"}
            }).responseText;

            // 建立資料表
            // 方法一 json
            var data = new google.visualization.DataTable(jsonData);
            // 方法二 array 格式
            //var data = google.visualization.arrayToDataTable(array);

            // 設定圖表屬性
            var options = {
                title: '長條圖',
                width: 900,
                height: 400,
                is3D: true,     // 3D 效果
                backgroundColor: '#daf3f3',      // 背景顏色
                vAxis: {
                    title: '縱軸標題',
                    titleTextStyle: { color: '#0b9727',fontSize:20,italic:false }
                },      // 縱軸設定
                hAxis: {
                    title: '橫軸標題',
                    titleTextStyle: { color: '#3e0fac', fontSize: 20, italic: false }
                },      // 橫軸設定
                axisTitlesPosition: "out"       // 坐標軸標題位置 in:圖表內、out:圖表外、none:不顯示
            }

            // 只能使用 javascript 取得 container 
            var container = document.getElementById('chart_div');
            var chart = new window.google.visualization.ColumnChart(container);
            chart.draw(data, options);

            // 轉換成 png 圖片
            //chart_div.innerHTML = '<img src="' + chart.getImageURI() + '">';
        }
        
        $(document).ready(function(){
        	drawChart();
        });
        </script>
        <title>長條圖</title>
    </head>
    <body>
        <h1>北風資料庫報表－長條圖</h1>
        <hr />
        <div id="chart_div">
        </div>
    </body>
</html>