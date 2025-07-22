<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
*{
	margin : 0;
	padding: 0;
}

body{
	display: flex;
	justify-content: center;
	text-align: center;
	padding-top:50px;
}
.first, .second {
	display: inline-flex;
	margin: 0 30px;
	padding-bottom:30px;
	align-items:center;
}

button{
	width: 45px;
	height: 45px;
	margin : 2px;
	border:1px solid #aaa;
	background-color:#fafafa;
	cursor: pointer;
	font-weight:bold;
	font-size:16px;
}
button:hover{
	background-color:#e2e2e2;
}
table{
	margin: 0 auto;
	padding-top:30px;
	border-collpase:collpase;
}
td{
	width: 60px;
	height:60px;
	border: 1px solid black;
	font-size:18px;
}
.my{
	background-color: #CCFF99;
}
.now{
	border: 1px solid red;
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
		<div class="game">
			<div class="turn">
				<div class="first">선공 : <span id="firstSpan"></span></div>
				<div class="second">후공 : <span id="secondSpan"></span></div>
			</div>
			<div id="btns">
			</div>
			<div id="table"></div>
		</div>
	</div>
<script>
$(document).ready(function(){
	$('.game').hide();
})
var stomp = null;
var sessionId = null;
var bingoCnt = 4;
var players = null;
function setNumber(obj){
	const tds = document.querySelectorAll('td');
	for(const idx in tds){
		const td = tds[idx];
		if(td.innerText === 'O'){
			td.innerText = obj.innerText;
			obj.remove();
			console.log(tds.length-1, idx);
			if(idx == tds.length-1){
				$('td').css('cursor','pointer');
				$('td').on('click',function(){
					alert($(this).text());
				})
				alert('게임준비 완료!');	
			}
			return;
		}
	}
}
function init(){
	var btnsHtml = '';
	for(var i=1;i<=(bingoCnt*bingoCnt);i++){
		btnsHtml += '<button onclick="setNumber(this)">' + i + '</button>';
	}
	$('#btns').html(btnsHtml);
	var tableHtml = '<table>';
	for(var i=1;i<=bingoCnt;i++){
		tableHtml += '<tr>';
		for(var j=1;j<=bingoCnt;j++){
			tableHtml += '<td>O</td>';
		}
		tableHtml += '</tr>';
	}
	tableHtml += '</table>';
	$('#table').html(tableHtml);
}
function start(){
	$('.start').hide();
	$('.game').show();
	
	stomp.subscribe('/topic/visite', function(data){
		const body = JSON.parse(data.body);
		if(body.type==='exit'){
			alert(players[body.sessionId] + '님이 나가셨습니다.');
			$('#secondSpan').html('');
		}else{
			const name = body[body.mySessionId];
			players[body.mySessionId] = name;
			alert(name + '님이 들어오셨습니다.');
			$('#secondSpan').html(name);
			init();
		}
	})
}
function connect(){
	if($('input.player').val().trim().length<2){
		alert('플레이어 이름은 2글자 이상입니다.');
		$('input.player').val('');
		$('input.player').focus();
		return;
	}
	const socket = new SockJS('/ws');
	stomp = Stomp.over(socket);
	stomp.connect({}, function(frame){
		var checkSub = stomp.subscribe('/topic/check/' + $('input.player').val(), function(data){
			const body = JSON.parse(data.body);
			players = body;
			if(body.errorCode){
				alert(body.errorMsg);
				stomp.disconnect();
				$('input.player').val('');
				$('input.player').focus();
				return;
			}
			sessionId = body.mySessionId;
			if(body.playerCnt == '1'){
				$('#firstSpan').html(body[sessionId]);
				$('#firstSpan').parent().addClass('my');
			}else{
				for(const key in body){
					if(key === sessionId){
						$('#secondSpan').html(body[sessionId]);
						$('#secondSpan').parent().addClass('my');
					}else if(key!=='playerCnt' && key!=='mySessionId'){
						$('#firstSpan').html(body[key]);
					}
				}
				init();
			}

			$('#firstSpan').parent().addClass('now');
			checkSub.unsubscribe();
			start();
		})
		stomp.send('/app/check/' + $('input.player').val(), function(data){
			
		})
	})
}
</script>
</body>
</html>