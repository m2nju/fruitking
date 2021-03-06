<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 목록</title>
<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>

	<h1>공지사항</h1>
	<br>
	<div>
		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd;">
			<thead>
				<tr>
					<th style="background-color: #eeeeee; text-align: center;">번호</th>
					<th style="background-color: #eeeeee; text-align: center;">작성자</th>
					<th style="background-color: #eeeeee; text-align: center;">제목</th>
					<th style="background-color: #eeeeee; text-align: center;">작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="notify">	<!--공지사항 정보 출력  -->
					<tr>
						<td>${notify.id }</td>
						<td>${notify.writer }</td>
						<td><a href="notify/viewNotify?id=${notify.id }">${notify.title }</a></td>
						<td>${notify.regdate }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<c:forEach items="${pageStartList}" var="pageIndex" varStatus="status">
			<a href="notify?start=${pageIndex}">${status.index +1 }</a>&nbsp; &nbsp;
		</c:forEach>
		<%
			try{
				if (session.getAttribute("userId") != "null") {	//현재 세션에 유저 있는지 확인
					int grade = (Integer) session.getAttribute("userGrade");
					if (grade <= 1) {	//유저 등급에 따라 글쓰기 기능 사용
			%>
						<a href="writeNotify" class="btn btn-primary pull-right">글쓰기</a>
			<%
					}
				}
			}catch (Exception e){
				System.out.println(e);
			}
		%>
	</div>
</body>
</html>

