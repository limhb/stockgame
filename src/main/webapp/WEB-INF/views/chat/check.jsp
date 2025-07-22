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
<input type="text" id="name"><button onclick="check()">체크</button>

<script>

const name = document.querySelector('#name');
var stomp = null;

function check(){
	const socket = new SockJS('/ws');
	stomp = Stomp.over(socket);
	stomp.connect({},function(frame){
		var checkSub = stomp.subscribe('/topic/shck/' + name.value, function(data){
			const body = JSON.parse(data.body);
			if(body.errorCode){
				alert(body.errorMsg);
				stomp.disconnent();
				return;
			}
			checkSub.unsubscribe();
		})
		stomp.send('/app/check/' + name.value);
	});
	
}
</script>

</body>
</html>