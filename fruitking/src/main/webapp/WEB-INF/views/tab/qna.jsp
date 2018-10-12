<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/qna.css">
<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
	<h1>문의하기</h1><br>
	<form action="https://formspree.io/2mingju@naver.com" method="POST">
		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd;">
			<thead>
				<tr>
					<th colspan="5" style="background-color: #eeeeee; text-align: center;">양식에 맞게 작성해 주세요!</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="width: 20%;">이메일</td>
					<td><input type="email" class="form-control" placeholder="example@example.com" name="_replyto"></td>
				</tr>
				<tr>
					<td><label for="message">내용</label></td>
					<td><textarea class="form-control" placeholder="OOOO은 어떻게 해야하죠???" name="message"></textarea></td>
				</tr>
			</tbody>
		</table>
		<input type="submit" class="btn btn-primary pull-right" value="send">
	</form>
</body>
</html>