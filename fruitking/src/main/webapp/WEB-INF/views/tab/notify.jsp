<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 목록</title>
</head>
<body>

	<h1>공지사항</h1>
	<br> 공지사항 전체 수 : ${count }
	<br>
	<br>

	<c:forEach items="${list}" var="notify">
		${notify.id }<br>
		${notify.writer }<br>
		${notify.title }<br>
		${notify.content }<br>
		${notify.regdate }<br>
	</c:forEach>
	
	<br>

	<c:forEach items="${pageStartList}" var="pageIndex" varStatus="status">
		<a href="notify?start=${pageIndex}">${status.index +1 }</a>&nbsp; &nbsp;
	</c:forEach>

	<br>
	<br>
	
	<form method="post" action="write">
		writer : <input type="text" name="writer"><br> 
		title : <input type="text" name="title"><br>
		<textarea name="content" cols="60" rows="6"></textarea>	<br> 
		<input type="submit" value="등록">
	</form>
</body>
</html>