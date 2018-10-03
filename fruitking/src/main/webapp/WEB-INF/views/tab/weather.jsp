<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	#main_menu {list-style: none;}
	#main_menu>li {display:inline-block; width:200px; background:#f4f4f4; text-align: center; padding:10px 0;}
	#main_menu>li>ul {list-style:none;display:none;position:absolute; background:#000; width:200px; margin-top:10px;}
	#main_menu>li>ul>li {color:#fff; padding:10px 0;}
	
	/* 오버액션 */
	#main_menu>li:hover>ul {display:block;}
	.weatherInfo{
		display: inline;
	}
	.weatherInfo{
		display: inline;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC_6z_sVa7_dirTxeWwFTWhExf4V2UyfMU&callback=initMap&region=KR"></script>
<script>
	function initialize(name, x, y, zoom) {
		/*
		http://openapi.map.naver.com/api/geocode.php?key=f32441ebcd3cc9de474f8081df1e54e3&encoding=euc-kr&coord=LatLng&query=서울특별시 노원구 섬밭로 258
		위의 링크에서 뒤에 주소를 적으면 x,y 값을 구할수 있습니다.
		*/
		var zoomLevel = zoom; // 첫 로딩시 보일 지도의 확대 레벨
		var markerTitle = name; // 현재 위치 마커에 마우스를 올렸을때 나타나는 이름
		
		var myLatlng = new google.maps.LatLng(x, y);
		var mapOptions = {
			zoom: zoomLevel,
			center: myLatlng,
			mapTypeId: google.maps.MapTypeId.ROADMAP
		}
		var map = new google.maps.Map(document.getElementById('map_view'), mapOptions);
		
		var marker = new google.maps.Marker({
			position: myLatlng,
			map: map,
			title: markerTitle
		});
		
	}
</script>
</head>
<body>
	<button onclick="weatherCall(australia)">호주</button>
	<button onclick="weatherCall(canada)">캐나다</button>
	<button onclick="weatherCall(chile)">칠레</button>
	<button onclick="weatherCall(china)">중국</button>
	<button onclick="weatherCall(portugal)">포르투갈</button>
	<button onclick="weatherCall(spain)">스페인</button>
	<button onclick="weatherCall(italia)">이탈리아</button>
	<button onclick="weatherCall(india)">인도</button>
	<button onclick="weatherCall(newzealand)">뉴질랜드</button>
	<button onclick="weatherCall(peru)">페루</button>
	<button onclick="weatherCall(turkey)">터키</button>
	<button onclick="weatherCall(florida)">플로리다</button>
	<button onclick="weatherCall(sanfrancisco)">샌프란시스코</button>
	<button onclick="weatherCall(vietnam)">베트남</button>

	<h1></h1>
	온도 : <div class="weatherInfo" id="temp"></div><br>
	습도 : <div class="weatherInfo" id="humidity"></div><br>
	상세 날씨 : <div class="weatherInfo" id="description"></div><br>
	풍속 : <div class="weatherInfo" id="windSpeed"></div><br>
	운량 : <div class="weatherInfo" id="clouds"></div><br>
	
	<div id="map_view" style="width:940px; height:705px;"></div>
	
	<script type="text/javascript">
		
		var florida = {name:"florida", x:"27.760675", y:"-81.416535", zoom:6};
		var sanfrancisco = {name:"san francisco", x:"37.768852", y:"-122.422174", zoom:5};
		
		var weatherIconImgURL;
		function weatherCall(city){
			name = city.name;
			x = city.x;
			y = city.y;
			zoom = city.zoom;
			initialize(name, x, y, zoom);
			var key = "1042afb6d0833b90b43ecbaccad5b137";
			var apiURI = "http://api.openweathermap.org/data/2.5/weather?q="+name+"&appid="+key;
			$.ajax({
				url: apiURI,
				success: function(result) {
				   
					document.getElementById("temp").innerHTML=(result.main.temp - 273.15).toFixed(2) + "˚C";
					document.getElementById("humidity").innerHTML=result.main.humidity + "%";
					document.getElementById("description").innerHTML=result.weather[0].description;
					document.getElementById("windSpeed").innerHTML=result.wind.speed + "m/s";
					document.getElementById("clouds").innerHTML=result.clouds.all + "%";
				}
			});
		};
	</script>
</body>
</html>