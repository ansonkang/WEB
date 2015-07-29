<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<form action="/servlet/tsServlet" method="post">
	<input type="text" name="name"></input>
	<input type="submit" name="btn" value="submit"></input>
	</form>
</html>
