<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
</head>
<body>
<div id="init">
	<input type="text" id="name" placeholder="이름"><button onclick="start()">시작</button>
</div>
<div id="chat" style="display:none">
<textarea id="messages" style="width:300px;height:150px;resize:none"></textarea><br>
<input type="text" id="message" style="width:250px" onkeypress="send(event)"><button onclick="send()">전송</button>
</div>

<script>
const name = document.querySelector('#name');
const message = document.querySelector('#message');
const messages = document.querySelector('#messages');
var stomp = null;

function start(){
	if(name.value.trim().length<2){
		alert('대화명은 2글자 이상입니다.');
		name.value = '';
		name.focus();
		return;
	}
	name.value = name.value.trim();
	document.querySelector('#init').style.display='none';
	document.querySelector('#chat').style.display='block';
	const socket = new SockJS('/ws');
	stomp = Stomp.over(socket);
	stomp.connect({}, function(con){
		console.log('연결됨 : ' + con);
		stomp.subscribe('/topic/message', function(data){
			const message = JSON.parse(data.body);
			message.value += message.name + ' : ' + message.message + '\r\n';
			
			console.log(data);
			
		})
	})
}

function send(evt){
	if(evt){
		if(evt.keyCode !==13){
			return;
			
		}
	}
	if(message.value.trim().length<1){
		return;
	}
	const param = {
			name : name.value,
			message : message.value
			
	}
	const json = JSON.stringify(param);
	stomp.send('/app/message', {}, json);
	message.value = '';
}
</script>
</body>
</html>