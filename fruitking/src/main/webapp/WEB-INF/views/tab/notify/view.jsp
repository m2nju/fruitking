<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set  var="notify" value="${notify }" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>notify</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
</head>
<body>
	<div>
		<div>
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
						<td>작성 일자</td>
						<td colspan="2">${notify.regdate }</td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="2"><div style="min-height: 200px; text-align: left;">${notify.content }</div></td>
					</tr>
					<%-- <%
						if(nextNotify.getId() == notify.getId()){
					%>
						<tr>
							<td>윗글</td>
							<td colspan="2">윗글이 없습니다.</td>
						</tr>
					<%
						} else {
					%>
						<tr>
							<td>윗글</td>
							<td colspan="2"><a href="view.jsp?id=<%=nextNotify.getId() %>"><%= nextNotify.getTitle() %></a></td>
						</tr>
					<%
						}
						if(priorNotify.getId() == notify.getId()){
					%>
						<tr>
							<td>아랫글</td>
							<td colspan="2">아랫글이 없습니다.</td>
						</tr>
					<%
						} else {
					%>
						<tr>
							<td>아랫글</td>
							<td colspan="2"><a href="view.jsp?id=<%=priorNotify.getId()%>"><%= priorNotify.getTitle() %></a></td>
						</tr>
					<%
						}
					%> --%>
				</tbody>
			</table>
			<a href="notify" class="btn btn-primary">목록</a>
			<a href="updateNotify.jsp?id=${notify.id }" class="btn btn-primary">수정</a>
			<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?id=${notify.id }" class="btn btn-primary pull-right">삭제</a>
		</div>
	</div>

</body>
</html>