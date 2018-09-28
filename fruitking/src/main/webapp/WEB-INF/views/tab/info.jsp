<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flexslider/2.2.0/flexslider-min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.css">
<style>
body {
		background: #eee;
		height: 530px;
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
</style>
</head>
<body>
	<div class="flexslider left">
	<ul class="slides">
		<li>
			<img src="img/apple.jpg/">
			<div class="meta">
				<h1>Data Mining</h1>
				<h2>십수년 간의 각종 공공데이터를 수집하여 정제</h2>
				<div class="category">
					<p>수확량, 기후, 조세, 물류량, 수입가격, 도매가, 소매가, 트렌드 등 과실류 가격에 영향을 주는 모든 데이터를 확보</p>
					<!--<span></span>-->
				</div>
			</div>
		</li>
		<li>
			<img src="img/fruitmarket.jpg">
			<div class="meta">
				<h1>Visualize Statistics Data</h1>
				<h2>통계 자료를 시각화하여 제공</h2>
				<div class="category">
					<p>실시간으로 모든 데이터를 한 눈에 볼 수 있게 직관적으로 도표화하여 서비스 제공</p>
					<!-- <span>Category</span>  -->
				</div>
			</div>
		</li>
		<li>
			<img src="img/fruitmarket2.jpg">
			<div class="meta">
				<h1>Price Prediction</h1>
				<h2>인공지능 - 딥러닝을 통한 가격 예측</h2>
				<div class="category">
					<p>정제한 데이터를 기반으로 가격 예측 모델을 제작하고 과실류 가격 전망을 예측</p>
				</div>
			</div>
		</li>
		<li>
			<img src="img/fruitimage.jpg">
			<div class="meta">
				<h1>Trend Recognition</h1>
				<h2>과실류 가격 트렌드 파악</h2>
				<div class="category">
					<p>과일 키워드 기준으로 뉴스를 크롤링하여 빠른 시간에 트렌트를 파악</p>
				</div>
			</div>
		</li>
	</ul>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/flexslider/2.2.0/jquery.flexslider-min.js"></script>
<script>
     $('.flexslider').flexslider({
		animation: "slide",
		controlNav: false
	});

</script>
</body>

</html>