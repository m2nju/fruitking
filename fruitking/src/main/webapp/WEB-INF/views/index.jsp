<%@ page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="UTF-8">
<title>Fruit King</title>
<link rel="stylesheet" href="css/maincss.css">

<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<style>
	a, a:hover {
		color: #000000;
		text_decoration: none;
	}
	.logo {
		text-align: center;
	}
	.login {
		text-align: right;
		margin-right: 10px;
	}
      #floatMenu {
       position: absolute;
       right: 25px;
       top: 450px;
       background-color: bisque;
       color: #ffffff;
       text-align: center;
      }
      #floatMenu > a{
      		text-decoration: none;
      		width: 150px;
       		height: 150px;
       		background-color: bisque;
      }
      #floatMenu > a > img{
      		width: 100px;
      		height: 100px;
      }
</style>
<script>
      $(document).ready(function() {
	       var floatPosition = parseInt($("#floatMenu").css('top'));
	       // 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
	       // 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );
	       $(window).scroll(function() {
	        // 현재 스크롤 위치를 가져온다.
		        var scrollTop = $(window).scrollTop();
		        var newPosition = scrollTop + floatPosition + "px";      
		        /* 애니메이션 없이 바로 따라감
		         $("#floatMenu").css('top', newPosition);
		         */
		        $("#floatMenu").stop().animate({
		         	"top" : newPosition
	        	}, 500);
	       }).scroll();
      });
</script>
</head>
<body>
    <div id="top" style="height:2500px">
	    <div class="logo">
			<a href="./"><img src="img/logo.png" /></a>
	    </div>
	    <div class="login">
			<br>
			<%
				//String access_token = (String)session.getAttribute("access_token"); // 네이버 엑세스 토큰 
				//String refresh_token = (String)session.getAttribute("refresh_token"); // 네이버 리프레시 토큰
				
				String userName = (String)session.getAttribute("userName");
				if(!(userName == null)){	// 엑세스토큰이 쿠키에 보관되어 있다면 
					out.println(userName + "님 안녕하세요.<br>");
				}else{
			%>
			<a href="naverLogin">네이버로그인</a>
			<% }%>
	    </div>
		<div class="tab">
			<div class="tabmenu">
				<div class="tablinks" onclick="openTab(event)">사이트 소개</div>
				<div class="tablinks" onclick="openTab(event)">날씨 및 조세</div>
				<div class="tablinks" onclick="openTab(event)">경매 및 판매가</div>
				<div class="tablinks" onclick="openTab(event)">관련뉴스</div>
				<div class="tablinks" onclick="openTab(event)">공지사항</div>
				<div class="tablinks" onclick="openTab(event)">문의하기</div>
			</div>
	
			<section class="content"></section>
		</div>
	</div>
	
	<div id="floatMenu">
		<a href="#top">맨 위로</a><br>
		<a href="http://www.customs.go.kr/kcshome/index.jsp" target="_blank"><img src="img/kcs.png" /></a><br>
		<a href="https://www.kamis.or.kr/customer/main/main.do" target="_blank"><img src="img/kamis.png" /></a>
	</div>

	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
	<script>
		function autosize() { //ifame 크기 맞춰주는 함수
			var oFrame = top.document.getElementById("Iframe");
			contentHeight = oFrame.contentWindow.document.body.scrollHeight + 
			oFrame.contentWindow.document.body.offsetHeight - oFrame.contentWindow.document.body.clientHeight;
			if (contentHeight < 300) { //content 최소 높이
				contentHeight = 300;
			}
			oFrame.style.height = String(contentHeight + 30) + "px"; //content 높이 자동 맞춤
		}

		function openTab(evt) { //tab focus 함수
			var tablinks = document.getElementsByClassName("tablinks"); //탭을 불러옵니다. 
			for (var i = 0, len = tablinks.length; i < len; i++) {
				tablinks[i].className = tablinks[i].className.replace(
						" active", ""); //탭을 초기화시킵니다.
			}
			evt.currentTarget.className += " active"; //클릭한 탭을 활성화시킵니다.
		}

		function makeTemplate(data, clickedName) {
			var resultHTML = "";
			var html = document.getElementById("tabcontent").innerHTML;

			for (var i = 0, len = data.length; i < len; i++) {
				if (data[i].name === clickedName) {
					resultHTML = html.replace("{html}", data[i].html);
					break;
				}
			}
			document.querySelector(".content").innerHTML = resultHTML;
		}

		function sendAjax(url, clickedName) {
			var oReq = new XMLHttpRequest();
			oReq.addEventListener("load", function() {
				var data = JSON.parse(oReq.responseText);
				makeTemplate(data, clickedName);
			});
			oReq.open("GET", url);
			oReq.send();
		}

		var tabmenu = document.querySelector(".tabmenu");
		tabmenu.addEventListener("click", function(evt) {
			sendAjax("txt/html.txt", evt.target.innerHTML);
		})
	</script>
	<script id="tabcontent" type="my-template">
		<iframe src="./{html}" id="Iframe" style="display: block; width: 100%; height: 100%;" scrolling="no" frameborder="0" onLoad="autosize()"></iframe> 
	</script>
</body>
</html>

