<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/flexslider/2.2.0/jquery.flexslider-min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
	.dropdown-submenu {
	    position: relative;
	}
	
	.dropdown-submenu .dropdown-menu {
	    top: 0;
	    left: 100%;
	    margin-top: -1px;
	}
	div, li {
		cursor: pointer;
	}
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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"><script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC_6z_sVa7_dirTxeWwFTWhExf4V2UyfMU&callback=initMap&region=KR"></script>
</head>
<body onload="initialize()">

	<div class="btn-group dropdown">
		<button class="btn btn-secondary dropdown-toggle" type="button" data-toggle="dropdown">
			N.America<span class="caret"></span>
		</button>
		
		<ul class="dropdown-menu">
			<li class="dropdown-submenu">
				<a class="america" tabindex="-1" href="#">
					미국 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;▶
				</a>
				<ul class="dropdown-menu">
					<li><a tabindex="-1" href="#" onclick="weatherCall(sanfrancisco)">샌프란시스코</a></li>
					<li><a tabindex="-1" href="#" onclick="weatherCall(florida)">플로리다</a></li>
				</ul>
			</li>
			<li><a tabindex="-1" href="#" onclick="weatherCall(canada)">캐나다</a></li>
		</ul>
	</div>

	<div class="btn-group dropdown">
		<button class="btn btn-secondary dropdown-toggle" type="button" data-toggle="dropdown">
			S.America<span class="caret"></span>
		</button>
		<div class="dropdown-menu">
			<div class="dropdown-item" onclick="weatherCall(chile)">칠레</div>
			<div class="dropdown-item" onclick="weatherCall(peru)">페루</div>
		</div>
	</div>

	<div class="btn-group dropdown">
		<button class="btn btn-secondary dropdown-toggle" type="button" data-toggle="dropdown">
			Europe<span class="caret"></span>
		</button>
		<div class="dropdown-menu" aria-labelledby="europe">
		 	<div class="dropdown-item" onclick="weatherCall(spain)">스페인</div>
			<div class="dropdown-item" onclick="weatherCall(italia)">이탈리아</div>
			<div class="dropdown-item" onclick="weatherCall(portugal)">포르투갈</div>
		</div>
	</div>
	
	<div class="btn-group dropdown">
		<button class="btn btn-secondary dropdown-toggle" type="button" data-toggle="dropdown">
			Asia<span class="caret"></span>
		</button>
		<div class="dropdown-menu" aria-labelledby="asia">
			<div class="dropdown-item" onclick="weatherCall(china)">중국  <span>▶</span></div>
			<div class="dropdown-item" onclick="weatherCall(vietnam)">베트남</div>
			<div class="dropdown-item" onclick="weatherCall(india)">인도</div>
			<div class="dropdown-item" onclick="weatherCall(turkey)">터키</div>
		</div>
	</div>

	<div class="btn-group dropdown">
		<button class="btn btn-secondary dropdown-toggle" type="button" data-toggle="dropdown">
			Oceania<span class="caret"></span>
		</button>
		<div class="dropdown-menu" aria-labelledby="oceania">
			<div class="dropdown-item" onclick="weatherCall(australia)">호주</div>
			<div class="dropdown-item" onclick="weatherCall(newzealand)">뉴질랜드</div>
		</div>
	</div>
	<br><br>
	<div id="map" style="width:940px; height:705px;"></div>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function(){
	  $('.dropdown-submenu a.america').on("click", function(e){
	    $(this).next('ul').toggle();
	    e.stopPropagation();
	    e.preventDefault();
	  });
	});
</script>
<script type="text/javascript">
	var temp, humidity, description, windSpeed, clouds;
	var spain = {name:"spain", x:"37.740431", y:"-3.798545", zoom:6};
	var italia = {name:"italia", x:"42.747164", y:"12.482229", zoom:6};
	var india = {name:"india", x:"23.155863", y:"79.274986", zoom:5};
	var canada = {name:"canada", x:"54.900407", y:"-124.822772", zoom:3};
	var chile = {name:"chile", x:"-27.059213", y:"-69.940916", zoom:5};
	var china = {name:"china", x:"34.163425", y:"104.113050", zoom:5};
	var vietnam = {name:"vietnam", x:"13.616213", y:"108.387259", zoom:6};
	var newzealand = {name:"newzealand", x:"-41.952664", y:"172.736174", zoom:6};
	var peru = {name:"peru", x:"-10.566522", y:"-76.015074", zoom:6};
	var turkey = {name:"turkey", x:"39.809856", y:"35.225156", zoom:6};
	var florida = {name:"florida", x:"27.760675", y:"-81.416535", zoom:6};
	var sanfrancisco = {name:"san francisco", x:"37.768852", y:"-122.422174", zoom:5};
	var australia = {name:"australia", x:"-24.446094", y:"134.696140", zoom:4};
	var portugal = {name:"portugal", x:"39.600134", y:"-8.075996", zoom:7};
	
	var weatherIconImgURL;
	function weatherCall(city){
		name = city.name;
		x = city.x;
		y = city.y;
		zoom = city.zoom;
		var key = "1042afb6d0833b90b43ecbaccad5b137";
		var apiURI = "http://api.openweathermap.org/data/2.5/weather?q="+name+"&appid="+key;
		$.ajax({
			url: apiURI,
			success: function(result) {
				temp = (result.main.temp - 273.15).toFixed(2) + "˚C";
				humidity = result.main.humidity + "%";
				description = result.weather[0].description;
				windSpeed = result.wind.speed + "m/s";
				clouds = result.clouds.all + "%";
			}
		});
		mapLoad(name, x, y, zoom);
	};
</script>
<script>
	function mapLoad(name, x, y, zoom) {
		var zoomLevel = zoom; // 첫 로딩시 보일 지도의 확대 레벨
		var markerTitle = name; // 현재 위치 마커에 마우스를 올렸을때 나타나는 이름
		var markerMaxWidth = 300;
		//말풍선
		var contentString	= '<div>' +
			'<h2>' + name + '</h2>'+
			'온도 : <div class="weatherInfo" id="temp">'+ temp +'</div><br>' +
			'습도 : <div class="weatherInfo" id="humidity">' + humidity + '</div><br>' +
			'날씨 : <div class="weatherInfo" id="description">' + description + '</div><br>' +
			'풍속 : <div class="weatherInfo" id="windSpeed">' + windSpeed + '</div><br>' +
			'운량 : <div class="weatherInfo" id="clouds">' + clouds + '</div><br>' +
			'</div>';
	
		var myLatlng = new google.maps.LatLng(x, y);
		var mapOptions = {
			zoom: zoomLevel,
			center: myLatlng,
			mapTypeId: google.maps.MapTypeId.ROADMAP
		}
		var map = new google.maps.Map(document.getElementById('map'), mapOptions);

		var marker = new google.maps.Marker({
			position: myLatlng,
			map: map,
			title: markerTitle
		});
		var infowindow = new google.maps.InfoWindow(
			{
				content: contentString,
				maxWidth: markerMaxWidth
			}
		);
		
		google.maps.event.addListener(marker, 'click', function() {
			infowindow.open(map, marker);
		});
	}
</script>
<script>
$.get("/txt/locations.txt", function(data) {
    var lines = data.split("\n");
    $.each(lines, function(n, elem) {
        alert(elem);
    })
})
	function initialize() {
		var locations = [
			    ['florida', 27.760675, -81.416535, 6],
			    ['san francisco', 37.768852, -122.422174, 5],
			    ['australia', -24.446094, 134.696140, 5],
			    ['portugal', 39.600134, -8.075996, 5]
			];
		
		var map = new google.maps.Map(document.getElementById('map'), {
			zoom: 2,
			center: new google.maps.LatLng(35, 150),
			mapTypeId: google.maps.MapTypeId.ROADMAP
		});
		
		var contentString, marker, infowindow, i, temp, humidity, description, windSpeed, clouds;
		var key = "1042afb6d0833b90b43ecbaccad5b137";
		for (i = 0; i < locations.length; i++) {
			var apiURI = "http://api.openweathermap.org/data/2.5/weather?q="+locations[i][0]+"&appid="+key;
			$.ajax({
				url: apiURI,
				success: function(result) {
					temp = (result.main.temp - 273.15).toFixed(2) + "˚C";
					humidity = result.main.humidity + "%";
					description = innerHTML=result.weather[0].description;
					windSpeed = result.wind.speed + "m/s";
					clouds = result.clouds.all + "%";
				}
			});
			marker = new google.maps.Marker({
				position: new google.maps.LatLng(locations[i][1], locations[i][2]),
				map: map
			});
			0
			contentString	= '<div>' +
			'<h2>' + name + '</h2>'+
			'온도 : <div class="weatherInfo" id="temp">'+ temp +'</div><br>' +
			'습도 : <div class="weatherInfo" id="humidity">' + humidity + '</div><br>' +
			'날씨 : <div class="weatherInfo" id="description">' + description + '</div><br>' +
			'풍속 : <div class="weatherInfo" id="windSpeed">' + windSpeed + '</div><br>' +
			'운량 : <div class="weatherInfo" id="clouds">' + clouds + '</div><br>' +
			'</div>';
			
			infowindow = new google.maps.InfoWindow(
				{
					content: contentString,
					maxWidth: 300
				}
			);
			
			google.maps.event.addListener(marker, 'click', (function(marker, i) {
				return function() {
					infowindow.setContent(contentString);
					infowindow.open(map, marker);
				}
			})(marker, i));
		}
		
	}
</script>
</head>
</body>
</html>