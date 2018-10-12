<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>Fruit King</title>
	<style type="text/css">
	.chart {
		width: 70%;
		position: relative;
		float: left;
	}
	
	.expected {
		width: 25%;
		position: relative;
		float: right;
	}
	</style>
</head>
<body>
	<div class="chart">
		<%
			String chartName = request.getParameter("chart");
	
		%>
		<form method=post>
			<% if(chartName != null && chartName.equals("banana")) {%><input type="radio" name="chart" value="banana" checked="checked">바나나<%}else{ %>
			<input type="radio" name="chart" value="banana">바나나<%}%>
			<% if(chartName != null && chartName.equals("grape")) {%><input type="radio" name="chart" value="grape" checked="checked">포도<%}else{ %>
			<input type="radio" name="chart" value="grape">포도<%} %>
			<input type="submit" value="조회">
		</form>
		<%
			if(chartName != null){
		%>
		<iframe src="./<%=chartName%>Chart" id="Iframe" style="display: block; width: 100%; height: 400px;" frameborder="0""></iframe>
		<%
			}
		%>
	</div>
	
	<div class="expected">
		<h2>예상가격</h2>
		<form method="post" action="getPrice">  
			date : <input type="text" name="date"><br>
			<input type="submit" value="확인">
		</form>
	</div>
</body>
</html>