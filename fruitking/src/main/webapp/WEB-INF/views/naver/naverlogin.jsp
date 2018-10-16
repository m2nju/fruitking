<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>네이버로그인</title>
</head>
<body>
	<%	// 네이버 로그인 요청시
		String clientId = "ravoW4uifW7U6hs5l8QL";//애플리케이션 클라이언트 아이디값";
		String redirectURI = URLEncoder.encode("http://fruitking.tk/callBack", "UTF-8");	// Callback 받을 경로
		SecureRandom random = new SecureRandom();
		String state = new BigInteger(130, random).toString();
		String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
		apiURL += "&client_id=" + clientId;
		apiURL += "&redirect_uri=" + redirectURI;
		apiURL += "&state=" + state;
		session.setAttribute("state", state);
	%>
	<a href="<%=apiURL%>"><img height="50"
		src="http://static.nid.naver.com/oauth/small_g_in.PNG" /></a>
</body>
</html>