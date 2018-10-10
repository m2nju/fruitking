<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="css/qna.css">
</head>
<body>
	<form action="https://formspree.io/2mingju@naver.com" method="POST">
			<table class="table table-striped">
				<thead>
					<tr>
						<th colspan="2">문의하기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><label for="name">이메일:</label></td>
						<td> <input type="email" name="_replyto"></td>
					</tr>
					<tr>
						<td><label for="message">내용:</label></td>
						<td><textarea name="message"></textarea></td>
					</tr>
				</tbody>
			</table>
			<input type="submit" value="Send">
		</form>
</body>
</html>