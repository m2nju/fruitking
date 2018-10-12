<%@ page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<meta charset="UTF-8">
	<title>Fruit King</title>
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<link rel="stylesheet" href="css/maincss.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flexslider/2.2.0/flexslider-min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.css">
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
	<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script>
	      $(document).ready(function() {
		       var floatPosition = parseInt($("#floatMenu").css('top'));
		       // 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
		       // 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );
		       $(window).scroll(function() {
		        // 현재 스크롤 위치를 가져온다.
			        var scrollTop = $(window).scrollTop();
			        var newPosition = scrollTop + floatPosition + "px";
			         $("#floatMenu").css('top', newPosition);  //애니메이션 없이 바로 따라감
			         // $("#floatMenu").stop().animate({"top" : newPosition}, 500);
		       }).scroll();
	      });
	      
	      function goTop(){
	    		$('html').scrollTop(0);
	    		// scrollTop 메서드에 0 을 넣어서 실행하면 끝 !!
	    		// 간혹 이 소스가 동작하지 않는다면
	    		// $('html, body') 로 해보세요~
	    	}
	</script>
	<style>
		#floatMenu {
			position: absolute;
			right: 25px;
			top: 120px;
			background-color: white;
			color: #ffffff;
			text-align: center;
		}
		#floatMenu > a{
			text-decoration: none;
			width: 150px;
			height: 150px;
			padding: 5px;
		}
		#floatMenu > a > img{
			width: 70px;
			height: 70px;
			border: solid 3px;
			border-color: #aaa;
			background-color: #aaa;
			border-radius: 10px;
		}
		.flexslider {
			width: 790px;
			margin: 0 auto;
			box-shadow: none;
		}
		
		.flexslider li {
			position: relative;
		}
		
		.flexslider li .meta {
			position: absolute;
			bottom: 20px;
			left: 20px;
			color: white;
			display: flex;
			flex-direction: column;
			justify-content: flex-start;
			align-items: flex-start;
			font-family: 'Roboto', sans-serif;
		}
		
		.flexslider li h1 {
			background: rgba(51, 51, 51, 0.7);
			padding: 12px 18px 12px;
			margin-bottom: 0;
			font-size: 2.0em;
			font-weight: 300;
		}
		
		.flexslider li h2 {
			background: rgba(51, 51, 51, 0.7);
			padding: 13px 18px 11px;
			font-size: 1.3em;
			margin-bottom: 0;
			font-weight: 300;
		}
		
		.flexslider li .category {
			display: flex;
			flex-direction: row;
		}
		
		.flexslider li .category p {
			background: #B43104;
			margin-right: 7px;
			font-size: 0.9em;
			padding: 12px 18px 10px;
			font-weight: 300;
		}
		
		.flexslider li .category span {
			background: #e43837;
			margin-top: 17px;
			padding: 8px 12px 0;
			font-size: 0.9em;
			font-weight: 300;
			height: 26px;
		}
		
		.flexslider li h1,
		.flexslider li h2,
		.flexslider li .category p,
		.flexslider li .category span {
			-webkit-animation-duration: .6s;
			animation-duration: .6s;
			-webkit-animation-fill-mode: both;
			animation-fill-mode: both;
			-webkit-animation-name: fadeOutLeft;
			animation-name: fadeOutLeft;
		}
		
		.flexslider li.flex-active-slide .meta h1,
		.flexslider li.flex-active-slide .meta h2,
		.flexslider li.flex-active-slide .meta .category p,
		.flexslider li.flex-active-slide .meta .category span {
			-webkit-animation-delay: .4s;
			animation-delay: .4s;
			-webkit-animation-duration: .6s;
			animation-duration: .6s;
			-webkit-animation-fill-mode: both;
			animation-fill-mode: both;
			-webkit-animation-name: fadeInLeft;
			animation-name: fadeInLeft;
		}
		
		.flexslider li.flex-active-slide .meta h2 {
			-webkit-animation-delay: .5s;
			animation-delay: .5s;
		}
		
		.flexslider li.flex-active-slide .meta .category p {
			-webkit-animation-delay: .6s;
			animation-delay: .6s;
		}
		
		.flexslider li.flex-active-slide .meta .category span {
			-webkit-animation-delay: .8s;
			animation-delay: .8s;
		}
		
		.flex-direction-nav {
			position: absolute;
			top: 0;
			left: 30px;
		}
		
		.flex-direction-nav a {
			text-decoration: none;
			display: block;
			width: 30px;
			height: 30px;
			background-color: #333;
			margin: -20px 0 0;
			position: absolute;
			top: 50px;
			z-index: 10;
			overflow: hidden;
			opacity: .5;
			cursor: pointer;
			color: #fff;
			-webkit-transition: all .3s ease;
			-moz-transition: all .3s ease;
			transition: all .3s ease;
		}
		
		.flex-direction-nav .flex-prev {
			text-align: left;
			left: -10px;
		}
		
		.flex-direction-nav .flex-next {
			text-align: right;
			left: 30px;
		}
		
		.flexslider:hover .flex-prev {
			left: -10px;
		}
		
		.flexslider:hover .flex-next {
			left: 30px;
		}
		
		.flexslider:hover .flex-next:hover,
		.flexslider:hover .flex-prev:hover {
			opacity: 1;
		}
		
		.flex-direction-nav a:before {
			font-family: FontAwesome;
			content: '\f104';
			font-size: 25px;
			display: flex;
			justify-content: center;
			align-items: center;
			position: relative;
			top: 0;
			padding: 2px;
			font-size: 19px;
		    line-height: 27px;
		}
		
		.flex-direction-nav a.flex-next:before {
			content: '\f105';
		}
		
		@-webkit-keyframes fadeInLeft {
			0% {
				opacity: 0;
				-webkit-transform: translate3d(-100%, 0, 0);
				transform: translate3d(-100%, 0, 0);
			}
			100% {
				opacity: 1;
				-webkit-transform: none;
				transform: none;
			}
		}
		
		@keyframes fadeInLeft {
			0% {
				opacity: 0;
				-webkit-transform: translate3d(-100%, 0, 0);
				transform: translate3d(-100%, 0, 0);
			}
			100% {
				opacity: 1;
				-webkit-transform: none;
				transform: none;
			}
		}
		
		@-webkit-keyframes fadeOutLeft {
			0% {
				opacity: 1;
			}
			100% {
				opacity: 0;
				-webkit-transform: translate3d(-100%, 0, 0);
				transform: translate3d(-100%, 0, 0);
			}
		}
		
		@keyframes fadeOutLeft {
			0% {
				opacity: 1;
			}
			100% {
				opacity: 0;
				-webkit-transform: translate3d(-100%, 0, 0);
				transform: translate3d(-100%, 0, 0);
			}
		}
.navbar {
	padding-left: 5rem;
	text-align: center;
}
	</style>

</head>
<body>
	<div id="floatMenu">
		<a href="http://www.customs.go.kr/kcshome/index.jsp" target="_blank"><img src="img/kcs.png" /></a>
		<br>
		<a href="https://www.kamis.or.kr/customer/main/main.do" target="_blank"><img src="img/kamisLogo.png"/></a>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		<img id="upbutton" onclick="goTop()" width="40" src="img/up.png"/>
		
	</div>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="./"><img src="img/logo.png" style="width: auto; height: 80px;"/></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNavAltMarkup">		
			<div id="tabmenu" class="navbar-nav">
				<a id="tablinks" class="nav-item nav-link" onclick="openTab(event)">날씨 및 조세</a>
				<a id="tablinks" class="nav-item nav-link" onclick="openTab(event)">경매 및 판매가</a>
				<a id="tablinks" class="nav-item nav-link" onclick="openTab(event)">관련 뉴스</a>
				<a id="tablinks" class="nav-item nav-link" onclick="openTab(event)">공지사항</a>
				<a id="tablinks" class="nav-item nav-link" onclick="openTab(event)">문의하기</a>
				<a id="tablinks" class="nav-item nav-link" onclick="openTab(event)">실시간 채팅</a>
			</div>
			
			<div class="navbar-nav">
			<%
				//String access_token = (String)session.getAttribute("access_token"); // 네이버 엑세스 토큰 
				//String refresh_token = (String)session.getAttribute("refresh_token"); // 네이버 리프레시 토큰
				String userName = (String) session.getAttribute("userName");
				if (!(userName == null)) { // 엑세스토큰이 쿠키에 보관되어 있다면 
			%>
				<a class="nav-item nav-link" data-toggle="modal" data-target="#myModal">회원 정보 보기</a>
				<div id="myModal" class="modal fade" role="dialog">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="	">회원 정보 조회</h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>
							
							<div class="modal-body">
								<p>
									이름 : <%=session.getAttribute("userName")%>
								</p>
								<p>
									이메일 : <%=session.getAttribute("userEmail")%>
								</p>
								<p>
									연령대 : <%=session.getAttribute("userAge")%>0 대
								</p>
								<p>
									생일 : <%=session.getAttribute("userBirth")%>
								</p>
								<p>
									성별 :
								<%
									if (session.getAttribute("userIsMan").equals(true)) {
											out.print("남자");
										} else {
											out.print("여자");
										}
								%>
								</p>
								<p>
									회원 등급 :
								<%
									int grade = (Integer) session.getAttribute("userGrade");
										if (grade == 0) {
											out.print("관리자");
										} else if (grade == 1) {
											out.print("운영자");
										} else if (grade == 2) {
											out.print("일반 회원");
										} else if (grade == 3) {
											out.print("임시 회원");
										}
								%>
								</p>
							</div>
							
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
				<a class="nav-item nav-link" href="logout" onclick="return confirm('정말로 로그아웃하겠습니까?')">로그아웃</a>
				<%
					} else {
				%>
				<a class="nav-item nav-link" href="naverLogin">로그인</a>
				<%
					}
				%>
			</div>
		</div>
	</nav>

	<div id="top" style="height: 2500px;">
	<section class="content">
		<div class="flexslider left">
			<ul class="slides">
				<li><img src="img/apple.jpg/">
					<div class="meta">
						<h1>Data Mining</h1>
						<h2>십수년 간의 각종 공공데이터를 수집하여 정제</h2>
						<div class="category">
							<p>수확량, 기후, 조세, 물류량, 수입가격, 도매가, 소매가, 트렌드 등 과실류 가격에 영향을 주는 모든
								데이터를 확보</p>
							<!--<span></span>-->
						</div>
					</div></li>
				<li><img src="img/fruitmarket.jpg">
					<div class="meta">
						<h1>Visualize Statistics Data</h1>
						<h2>통계 자료를 시각화하여 제공</h2>
						<div class="category">
							<p>실시간으로 모든 데이터를 한 눈에 볼 수 있게 직관적으로 도표화하여 서비스 제공</p>
							<!-- <span>Category</span>  -->
						</div>
					</div></li>
				<li><img src="img/fruitmarket2.jpg">
					<div class="meta">
						<h1>Price Prediction</h1>
						<h2>인공지능 - 딥러닝을 통한 가격 예측</h2>
						<div class="category">
							<p>정제한 데이터를 기반으로 가격 예측 모델을 제작하고 과실류 가격 전망을 예측</p>
						</div>
					</div></li>
				<li><img src="img/fruitimage.jpg">
					<div class="meta">
						<h1>Trend Recognition</h1>
						<h2>과실류 가격 트렌드 파악</h2>
						<div class="category">
							<p>과일 키워드 기준으로 뉴스를 크롤링하여 빠른 시간에 트렌트를 파악</p>
						</div>
					</div></li>
			</ul>
		</div>
		</section>
	</div>	
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/flexslider/2.2.0/jquery.flexslider-min.js"></script>
	<script>
		$('.flexslider').flexslider({
			animation : "slide",
			controlNav : false
		});
	</script>
	<script>
		function autosize() { //ifame 크기 맞춰주는 함수
			var oFrame = top.document.getElementById("Iframe");
			contentHeight = oFrame.contentWindow.document.body.scrollHeight
					+ oFrame.contentWindow.document.body.offsetHeight
					- oFrame.contentWindow.document.body.clientHeight;
			if (contentHeight < 500) { //content 최소 높이
				contentHeight = 500;
			}
			oFrame.style.height = String(contentHeight + 30) + "px"; //content 높이 자동 맞춤
		}

		function openTab(evt) { //tab focus 함수
			var tablinks = document.getElementsByClassName("nav-item nav-link"); //탭을 불러옵니다. 
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

		var tabmenu = document.querySelector("#tabmenu");
		tabmenu.addEventListener("click", function(evt) {
			sendAjax("txt/tabmapping.txt", evt.target.innerHTML);
		})
	</script>
	<script id="tabcontent" type="my-template">
		<iframe src="./{html}" id="Iframe" style="display: block; width: 100%; height: 100%;" frameborder="0" onLoad="autosize()"></iframe> 
	</script>
</body>
</html>

