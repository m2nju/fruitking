<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="org.json.simple.parser.JSONParser" %>
<%@ page import="java.lang.StringBuffer" %>
<%@ page import="org.jsoup.Jsoup"%>
<%@ page import="org.jsoup.nodes.Document"%>
<%@ page import="org.jsoup.nodes.Element"%>
<%@ page import="org.jsoup.select.Elements"%>
<%@ page import="java.text.Format" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>네이버 뉴스 조회</title>
<style>
	.newsSection{
		margin: 0px;
		padding-bottom: 20px;
	}
	.leftSection{
		float: left;
		padding-right: 10px;
	}
	.rightSection{
		min-height: 110px;
	}
	img{
		border: solid 3px;
		border-color: #ddd;
		border-radius: 10px;
	}
	.selectSection{
		text-align : right;
	}
</style>
</head>
<body>
	<% 
	String k1, k2;
	int firstIn = 1;
	k1 = null;
	k2 = null;
	k1 = request.getParameter("f1");
	k2 = request.getParameter("f2");
	%>
	<div class=selectSection>
	<form method=post>
		<%
		if((k1 == null) && (firstIn == 0)){//처음 과일 검색
		%><input id="case1" type="checkbox" name="f1" value="과일" checked="checked">과일<%
		}else if(k1 != null && k1.equals("과일")){%>
			<input id="case3" type="checkbox" name="f1" value="과일" checked="checked">과일<%	
		}else{//첫 검색도 아니고 과일 체크박스도 선택하지 않은 경우
		%><input id="case2" type="checkbox" name="f1" value="과일">과일<%
		}
		firstIn = 0;
		%>
		<% if(k2 != null && k2.equals("레몬")){
		%><input type="radio" name="f2" value="레몬" checked="checked">레몬<%
		}else{%>
			<input type="radio" name="f2" value="레몬" >레몬<%	
		}
		%>
		<% if(k2 != null && k2.equals("망고")){
		%><input type="radio" name="f2" value="망고" checked="checked">망고<%
		}else{%>
			<input type="radio" name="f2" value="망고" >망고<%	
		}
		%>
		<% if(k2 != null && k2.equals("바나나")){
		%><input type="radio" name="f2" value="바나나" checked="checked">바나나<%
		}else{%>
			<input type="radio" name="f2" value="바나나" >바나나	<%	
		}
		%>
		<% if(k2 != null && k2.equals("사과")){
		%><input type="radio" name="f2" value="사과" checked="checked">사과<%
		}else{%>
			<input type="radio" name="f2" value="사과" >사과<%	
		}
		%>
		<% if(k2 != null && k2.equals("오렌지")){
		%><input type="radio" name="f2" value="오렌지" checked="checked">오렌지<%
		}else{%>
			<input type="radio" name="f2" value="오렌지" >오렌지	<%	
		}
		%>
		<% if(k2 != null && k2.equals("포도")){
		%><input type="radio" name="f2" value="포도" checked="checked">포도<%
		}else{%>
			<input type="radio" name="f2" value="포도" >포도<%	
		}
		%>
		<input type="submit" value="검색">
	</form>
	</div>
<%
	String key = "";
	if(k1 != null){
		key += k1;
	}
	if(k2 != null){
		key += "&&" + k2;
	}
	//if(k3 != null){
	//	key += "&&" + k3;
	//}
	//if(k4 != null){
	//	key += "&&" + k4;
	//}
	if(key == "") key = "과일";
	%>
	<!--
	<h3>ㅇ<%=k1%>ㅇ</h3>
	<h3>ㅇ<%=k2%>ㅇ</h3>
	<h3>ㅇ<%=key%>ㅇ</h3>
	 -->
	<%
	String clientId = "wcz84T9Q8lZKWx4REGlt";//애플리케이션 클라이언트 아이디값";
	String clientSecret = "3aESDNOM7h";//애플리케이션 클라이언트 시크릿값";
    //String text = URLEncoder.encode(keyword1, "UTF-8"); //검색어";
    String text = URLEncoder.encode(key, "UTF-8"); //검색어";
    String display = "10"; //표시할 기사 갯수
    String sort = "sim"; //sim : 유사도 순		date : 날짜 순
    String apiURL = "https://openapi.naver.com/v1/search/news.json?query="+ text + "&display="+ display +"&start=1&sort=" + sort;
    URL url = new URL(apiURL);
    HttpURLConnection con = (HttpURLConnection)url.openConnection();
    con.setRequestMethod("GET");
    con.setRequestProperty("X-Naver-Client-Id", clientId);
    con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
    int responseCode = con.getResponseCode();
    BufferedReader br;
    if(responseCode==200) { // 정상 호출
        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
    } else {  // 에러 발생
        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
    }
    String inputLine;
    StringBuffer response1 = new StringBuffer();
    while ((inputLine = br.readLine()) != null) {
        response1.append(inputLine);
        //System.out.println(inputLine);
        //System.out.println("===========================================");
    }
    //br.close();
    //System.out.println(response);
    
    JSONParser parser = new JSONParser();
    Object obj = parser.parse(response1.toString());
    JSONObject jsonObj = (JSONObject)obj;
    JSONArray items = (JSONArray)jsonObj.get("items");
    
    for(int i = 0; i < items.size(); i++) {
    	JSONObject tmp = (JSONObject)items.get(i);
    	String title = tmp.get("title").toString();
    	String link = tmp.get("link").toString();
    	String description = tmp.get("description").toString();
    	String oldPubDate = tmp.get("pubDate").toString();
    	
    	//System.out.println(oldPubDate);
    	//Date date = new SimpleDateFormat("E, dd MMM yyyy HH:mm:ss Z").parse(oldPubDate);
    	//String newPubDate = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분").format(date);
    	
		Document newsHTML = Jsoup.connect(link).get();
		String newsHTMLString = newsHTML.html();
		Element ogTag = newsHTML.select("meta[property=og:image]").first();
    
		

 %>
 		<div class=newsSection>
 			<div class=leftSection>
 <%
			if(ogTag != null){
			//System.out.println(ogTag);
			String img = ogTag.attr("content");
			//System.out.println(img);
 %>
	 		<a href="<%=link %>" target="_blank"><img src="<%=img %>" style="width: 100px;height:100px;"/> </a>
<%	 		}
%>
	 		</div>
			<div class=rightSection>
		    	<a href="<%=link %>" target="_blank"><%=i+1 %>. <%=title%></a><br> 
		    	<%=description%> <br><br><br>
	    	</div>
    	</div>
<%
    }
    //System.out.println("title : " + obj.get("title"));
%>

</body>
</html>