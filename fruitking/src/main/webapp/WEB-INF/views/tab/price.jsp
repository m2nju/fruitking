<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>경매 및 판매가</title>
	</head>
	<body>
		<iframe src="./bananaChart" id="Iframe" style="display: block; width: 80%; height: 600px;" frameborder="0" onLoad="autosize()"></iframe>
		<form method=post>
		<input id="case1" type="checkbox" name="f1" value="과일" checked="checked">과일
			<input type="radio" name="f2" value="포도" >포도
			<input type="submit" value="검색">
		</form>
	</body>

</html>