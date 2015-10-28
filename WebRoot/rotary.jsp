<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'rotary.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<style>
*{margin:0;padding:0;list-style-type:none;}
a,img{border:0;}
body{font:12px/180% Arial, Helvetica, sans-serif, "新宋体";}

.rotary{position:relative;width:854px;height:504px;margin:50px auto 0 auto;background:#d71f2e url(photo/rotary/bg1.png);}
.rotaryArrow{position:absolute;left:181px;top:104px;width:294px;height:294px;cursor:pointer;background-image:url(photo/rotary/arrow.png);}
.list{position:absolute;right:48px;top:144px;width:120px;height:320px;overflow:hidden;}
.list h3{display:none;}
.list li{height:37px;font:14px/37px "Microsoft Yahei";color:#ffea76;text-indent:25px;background:url(photo/rotary/user.png) 0 no-repeat;}
.list li a{color:#ffea76; text-decoration:none;}
.result{display:none;position:absolute;left:130px;top:190px;width:395px;height:118px;background-color:rgba(0,0,0,0.75);filter:alpha(opacity=90);}
.result a{position:absolute;right:5px;top:5px;width:25px;height:25px;text-indent:-100px;background-image:url(photo/rotary/close.png);overflow:hidden;}
.result p{padding:45px 15px 0;font:16px "Microsoft Yahei";color:#fff;text-align:center;}
.result em{color:#ffea76;font-style:normal;}
</style>

  </head>
  
<body>
<!-- 代码部分begin  -->
<div class="rotary">
	<div class="rotaryArrow" id="rotaryArrow"></div>
	<div class="list">
		<h3>中奖名单</h3>
		<ul>
			<li>1569****851</li>
			<li>1515****206</li>
			<li>1550****789</li>
			<li>1370****627</li>
			<li>1828****215</li>
			<li>1589****572</li>
			<li>1583****825</li>
			<li>1396****805</li>
			<li>1332****261</li>
			<li>1884****863</li>
			<li>1384****955</li>
			<li>1897****137</li>
			<li>1342****973</li>
			<li>1558****071</li>
			<li>1554****168</li>
			<li>1562****018</li>
			<li>1805****856</li>
			<li>1354****809</li>
			<li>1383****364</li>
		</ul>
	</div>
	<div class="result" id="result">
		<p id="resultTxt"></p>
		<a href="javascript:" id="resultBtn" title="关闭">关闭</a>
	</div>
</div>
<script src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script src="js/jquery.rotate.min.js"></script>
<script>
$(function(){
	var $rotaryArrow = $('#rotaryArrow');
	var $result = $('#result');
	var $resultTxt = $('#resultTxt');
	var $resultBtn = $('#result');

	$rotaryArrow.click(function(){
		var data = [0, 1, 2, 3, 4, 5, 6, 7];
		data = data[Math.floor(Math.random()*data.length)];
		switch(data){
			case 1: 
				rotateFunc(1,87,'恭喜您获得了 <em>1</em> 元代金券');
				break;
			case 2: 
				rotateFunc(2,43,'恭喜您获得了 <em>5</em> 元代金券');
				break;
			case 3: 
				rotateFunc(3,134,'恭喜您获得了 <em>10</em> 元代金券');
				break;
			case 4: 
				rotateFunc(4,177,'很遗憾，这次您未抽中奖，继续加油吧');
				break;
			case 5: 
				rotateFunc(5,223,'恭喜您获得了 <em>20</em> 元代金券');
				break;
			case 6: 
				rotateFunc(6,268,'恭喜您获得了 <em>50</em> 元代金券');
				break;
			case 7: 
				rotateFunc(7,316,'恭喜您获得了 <em>30</em> 元代金券');
				break;
			default:
				rotateFunc(0,0,'很遗憾，这次您未抽中奖，继续加油吧');
		}
	});

	var rotateFunc = function(awards,angle,text){  //awards:奖项，angle:奖项对应的角度
		$rotaryArrow.stopRotate();
		$rotaryArrow.rotate({
			angle: 0,
			duration: 5000,
			animateTo: angle + 1440,  //angle是图片上各奖项对应的角度，1440是让指针固定旋转4圈
			callback: function(){
				$resultTxt.html(text);
				$result.show();
			}
		});
	};

	$resultBtn.click(function(){
		$result.hide();
	});
});
</script>
<!-- 代码部分 end -->
</body>
</html>
