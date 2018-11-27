<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set  var="notify" value="${notify }" scope="session"/>	<!--수정하는 공지사항의 정보 가져옴  -->
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>notify</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
</head>
<body>
	<div>
		<form method="post" action="update?id=${notify.id }">
			<table class="table table-striped" style="text-align: center;	border: 1px solid #dddddd;">
				<thead>
					<tr>
						<th colspan="2" style="background-color: #eeeeee; text-align: center;">공지사항 수정</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" class="form-control" name="title" maxlength="20" value="${notify.title }"></td>
					</tr>
					<tr>
						<td><input type="text" class="form-control" name="writer" maxlength="20" value="${notify.writer }"></td>
					</tr>
					<tr>			
						<td><textarea class="form-control" placeholder="글 내용" name="content" style="height: 350px">${notify.content }</textarea></td>
					</tr>
				</tbody>
			</table>
			<input type="submit" class="btn btn-primary pull-right" value="수정">
		</form>
	</div>
</body>
</html>

