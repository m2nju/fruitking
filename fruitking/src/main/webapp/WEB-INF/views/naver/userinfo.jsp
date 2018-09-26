<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.BufferedReader"%>
<%@ page import="java.io.InputStreamReader"%>
<%@ page import="java.net.HttpURLConnection"%>
<%@ page import="java.net.URL"%>
<%@ page import="org.json.*"%>
<%@ page import="org.json.simple.JSONObject"%>
<%@ page import="org.json.simple.JSONArray"%>
<%@ page import="org.json.simple.parser.JSONParser"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 정보 조회하기</title>

</head>
<body>
	<%
		Cookie[] cookies = request.getCookies(); // 요청정보로부터 쿠키를 가져온다.
		String access_token = ""; // 네이버 엑세스 토큰
		String refresh_token = ""; // 리프레시 토큰	

		for (int i = 0; i < cookies.length; i++) { // 쿠키 배열을 반복문으로 돌린다.
			if (cookies[i].getName().toString().equals("access_token")) {
				access_token = cookies[i].getValue(); // 쿠키의 값을 가져온다.
			} else if (cookies[i].getName().toString().equals("refresh_token")) {
				refresh_token = cookies[i].getValue();
			}
		}
		String header = "Bearer " + access_token; // Bearer 다음에 공백 추가
		try {
			String apiURL = "https://openapi.naver.com/v1/nid/me";
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("Authorization", header);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer response1 = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response1.append(inputLine);
			}
			br.close();
/* 			out.println(response1.toString()); // 네이버에서 받아온 회원 정보를 출력 */

			String id = "";
			String nickname = "";
			int age; // 20대면 2, 30대면 3

			boolean is_man = false; // false 이면 Female, true이면 Male
			String email = "";
			String name = "";
			String birthday = "";

			JSONParser parser = new JSONParser();
			Object obj = parser.parse(response1.toString());
			// response1에 저장된 json형식의 String을 파싱하여 object로
			JSONObject jsonObj = (JSONObject) obj; // jsonObj는 전체 json 오브젝트 
			String response2 = jsonObj.get("response").toString();
			// 전체 json에서 response만 받아와서 String으로

			JSONParser parser2 = new JSONParser();
			Object obj2 = parser2.parse(response2); // obj는 response 오브젝트
			JSONObject jsonObj2 = (JSONObject) obj2; // 다시 그대로 반복하여 json 오브젝트로

			id = jsonObj2.get("id").toString();
			nickname = jsonObj2.get("nickname").toString();
			email = jsonObj2.get("email").toString();
			name = jsonObj2.get("name").toString();
			birthday = jsonObj2.get("birthday").toString();
			age = Integer.parseInt(jsonObj2.get("age").toString().substring(0, 1));
			if (jsonObj2.get("gender").toString().equals("M")) {
				is_man = true;
			} else if (jsonObj2.get("gender").toString().equals("W")) {
				is_man = false;
			}
			int defaultGrade = 2;

			//request.setAttribute("userEmail",email);
			//request.setAttribute("userName",name);
			//request.setAttribute("userAge",age);
			//request.setAttribute("userBirth",birthday);
			//request.setAttribute("userIsMan",is_man);
			//request.setAttribute("userGrade", defaultGrade);

			//response.sendRedirect("registUser");
	%>
			<form  method="post" name=registform action="registUser">
		 		<input type="hidden" name="userEmail" value="<%=email%>"><br> 
				<input type="hidden" name="userName" value="<%=name%>"><br>
				<input type="hidden" name="userAge" value="<%=age%>"><br>
				<input type="hidden" name="userBirth" value="<%=birthday%>"><br>
				<input type="hidden" name="userIsMan" value="<%=is_man%>"><br>
				<input type="hidden" name="userGrade" value="<%=defaultGrade%>"><br>
				 
				<script>document.registform.submit();</script>
				<!-- <input type="submit" value="등록"> -->
			</form>
	<%
		} catch (Exception e) {
			System.out.println(e);
		}
	%>
	
</body>
</html>
