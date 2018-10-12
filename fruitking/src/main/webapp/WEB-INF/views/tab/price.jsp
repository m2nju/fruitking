<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>경매 및 판매가</title>
	</head>
	<body>
		<%
			String chartName = null;
		%>
		<form method=post>
			<input type="radio" name="chart" value="바나나" >바나나
			<input type="radio" name="chart" value="포도" >포도
			<input type="submit" value="검색">
		</form>
		<%
			chartName = request.getParameter("chart");
			if(chartName != null){
		%>
		<iframe src="./bananaChart" id="Iframe" style="display: block; width: 80%; height: 600px;" frameborder="0" onLoad="autosize()"></iframe>
		 <%
		 }%>
	</body>

</html>