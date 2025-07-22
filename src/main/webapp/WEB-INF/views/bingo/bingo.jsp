<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	display: flex;
	justify-content: center;
	text-align: center;
	padding-top: 50px;
}

.first, .second {
	display: inline-block;
	margin: 0 30px;
}

button {
	width: 45px;
	height: 45px;
	margin: 2px;
	border: 1px solid #aaa;
	background-color: #fafafa;
	cursor: pointer;
	font-weight: bold;
	font-size: 16px;
}

button:hover {
	background-color: grey;
}

table {
	margin: 0 auto;
	padding-top: 30px;
	border-collapse: collapse;
}

td {
	width: 45px;
	height: 45px;
	border: 1px solid black;
	font-size: 18px;
	text-align: center;
}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script src="/resources/jquery-3.7.1.js"></script>
</head>
<body>
	<div class="container">
		<div class="start">
			<div class="input-name">
				<input type="text" class="player" placeholder="플레이어 이름">
			</div>
			<button onclick="connect()">접속</button>
		</div>
		<div class="game" style="display: none">
			<div class="turn">
				<div class="first">선공: <span id="firstSpan"></span></div>
				<div class="second">후공: <span id="secondSpan"></span></div>
			</div>
			<div class="btns"></div>
			<table class="bingo-board"></table>
		</div>
	</div>

	<script>
	$(document).ready(function() {
		$('.game').hide();
	});

	var stomp = null;
	var sessionId = null;
	var bingoCnt = 4;
	function setNumber(obj){
		const tds = document.querySelectorAll('td');
		for(const idx of tds){
			const td = tds[idx];
			if(td.innerText === '0'){
				td.innerText = obj.innerText;
				obj.remove();
				if(idx== tds.length-1){
					alert('게임준비 완료');
				}
				return;
			}
		}
		
	}

	function start() {
		$('.start').hide();
		$('.game').show();

		// 버튼 생성
		var btnsHtml = '';
		for (var i = 1; i <= (bingoCnt * bingoCnt); i++) {
			btnsHtml += '<button onclick="setNumber(this)">' + i + '</button>';
		}
		$('.btns').html(btnsHtml);

		// 테이블 생성
		var tableHtml = '';
		for (var i = 1; i <= bingoCnt; i++) {
			tableHtml += '<tr>';
			for (var j = 1; j <= bingoCnt; j++) {
				tableHtml += '<td>0</td>';
			}
			tableHtml += '</tr>';
		}
		$('.bingo-board').html(tableHtml);

		// 메시지 구독
		stomp.subscribe('/topic/visit', function(data) {
			const body = JSON.parse(data.body);
			console.log(body);
		});
	}

	function connect() {
		if ($('input.player').val().trim().length < 2) {
			alert('플레이어 이름은 2글자 이상입니다.');
			$('input.player').val('');
			$('input.player').focus();
			return;
		}

		const socket = new SockJS('/ws');
		stomp = Stomp.over(socket);
		stomp.connect({}, function(frame) {
			var checkSub = stomp.subscribe('/topic/check/' + $('input.player').val(), function(data) {
				const body = JSON.parse(data.body);
				if (body.errorCode) {
					alert(body.errorMsg);
					stomp.disconnect();
					$('input.player').val('');
					$('input.player').focus();
					return;
				}
				sessionId = body.mySessionId;
				checkSub.unsubscribe();
				start();
			});
			stomp.send('/app/check/' + $('input.player').val(), {});
		});
	}
	</script>
</body>
</html>
