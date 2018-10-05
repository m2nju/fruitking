<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>notify</title>
	<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
	<div>
		<form method="post" action="write">
			<table class="table table-striped" style="text-align: center;	border: 1px solid #dddddd;">
				<thead>
					<tr>
						<th colspan="2" style="background-color: #eeeeee; text-align: center;">공지사항 작성</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" class="form-control" placeholder="글 제목" name="title" maxlength="20"></td>
					</tr>
					<tr>
						<td><input type="text" class="form-control" placeholder="작성자" name="writer" maxlength="20"></td>
					</tr>
					<tr>			
						<td><textarea class="form-control" placeholder="글 내용" name="content" style="height: 350px"></textarea></td>
					</tr>
				</tbody>
			</table>
			<input type="submit" class="btn btn-primary pull-right" value="글쓰기">
		</form>
	</div>
</body>
</html>