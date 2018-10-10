<%@ page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Chat Room</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript"
	src="//cdnjs.cloudflare.com/ajax/libs/socket.io/1.4.8/socket.io.min.js"></script>
</head>
<body>
	<div id="mydiv" style="overflow-y:auto; overflow-x:hidden; width:100%; height: 500px;">
	<%
		String userName = (String) session.getAttribute("userName");
		if (userName == null){
			Random random = new Random();
			userName = "비회원"+ Integer.toString(random.nextInt(90000)+10000);
		} 
	%>

	
	<script type="text/javascript">
		$(document).ready(function() {
			var sock = io.connect('http://fruitking.tk:9999');
			sock.on('connect', function() {
				var connect_string = 'new_connect';
				sock.send(connect_string);
			});

			sock.on('hello', function(msg) {
				$('#messages').append('<li>' + '>>Hello :' + msg + '</li>');
				console.log('Received Hello Message');
			});

			sock.on('message', function(msg) {
				// console.log(type(msg));
				if (msg.type === 'normal') {	//	내가 보냈을 때.
					$('#messages').append('>> ' + decodeURIComponent(msg.message) + '<br>');
					document.getElementById('sendbutton').click();
				} else {						// 	남이 보냈을 때.
					$('#messages').append('<li>' + msg.message + '</li>');
				}
				console.log('Received Message : ' + msg.type);
			});

			$('#sendbutton').on('click', function() {
				var input = $('#myMessage').val();
				input = String(input);
				if(input != ""){
					input = encodeURIComponent('<%=userName%>' + ' : ' + input);
	
					sock.send(input);
					$('#myMessage').val('');
					document.getElementById('sendbutton').click();
				}
				$("#mydiv").scrollTop($("#mydiv")[0].scrollHeight);
			});
			
			window.onload = function() {
			     document.getElementById('myMessage').onkeypress = function searchKeyPress(event) {
			        if (event.keyCode == 13) {
			            document.getElementById('sendbutton').click();
			        }
			    };
				
			    document.getElementById('sendbutton').onclick =doSomething;
			}
		})
	</script>
	<ul id="messages"></ul>
	</div>
	<input type="text" id="myMessage">
	<button id="sendbutton">입력</button>
	
</body>
</html>