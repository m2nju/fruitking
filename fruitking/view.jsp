<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notify</title>
<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
	<%
		int id = 0;
		if(request.getParameter("id") != null) {
			id = Integer.parseInt(request.getParameter("id"));
		}
		if(id == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>
<c:forEach items="${list }" var="notify">
	<c:if test="${notify.id == id }">
	
	<div>
		<div style="background-color: rgb(253,255,244);">
			<table class="table table-striped" style="text-align: center;	border: 1px solid #dddddd;">
				<thead>
					<tr>
						<th colspan="4" style="background-color: #eeeeee; text-align: center;">공지사항 보기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%;">글 제목</td>
						<td colspan="2">${notify.title }</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2">${notify.writer }</td>
					</tr>
					<tr>
						<td>작성 일자</td>
						<td colspan="2">${notify.regdate }</td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="2"><div style="min-height: 200px; text-align: left;">${notify.content }</div></td>
					</tr>
				</tbody>
			</table>
			<a href="notify.jsp" class="btn btn-primary">목록</a>
			<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?id=${notify.id }" class="btn btn-primary pull-right">삭제</a>
		</div>
	</div>
	
	</c:if>
</c:forEach>
</body>
</html>