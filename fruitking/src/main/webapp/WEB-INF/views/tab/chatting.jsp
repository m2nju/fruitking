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
	<%
		String userName = (String) session.getAttribute("userName");
	%>

	
	<script type="text/javascript">
		$(document).ready(function() {
			var sock = io.connect('http://fruitking.tk:9999');
			var textt = "";
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
				if (msg.type === 'normal') {
					
					$('#messages').append('>> ' + decodeURIComponent(msg.message) + '<br>');
				} else {
					$('#messages').append('<li>' + msg.message + '</li>');
				}
				console.log('Received Message : ' + msg.type);
			});

			$('#sendbutton').on('click', function() {
				var input = $('#myMessage').val();
				input = String(input);
				input = encodeURIComponent('<%=userName%>' + ' : ' + input);

				sock.send(input);
				$('#myMessage').val('');
			});
			

		})
	</script>
	<ul id="messages"></ul>
	<input type="text" id="myMessage">
	<button id="sendbutton" onkeypress="JavaScript:press(this.form)">입력</button>

</body>
</html>