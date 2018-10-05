<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set  var="notify" value="${notify }" scope="session"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>notify</title>
	<link rel="stylesheet" href="css/bootstrap.css">
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