<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.card{
	border: 1px solid black;
	width: 75px;
	height: 105px;
	border-radius: 5px;
	position: relative;
}
.dark{
	background-color:black;
	color: black!important;
}
.card-suit{
	position: absolute;
	top:50%;
	left:50%;
	transform: translate(-50%,-50%);
	font-size: 40px;
}
.card-value{
	left:5px;
	top: 3px;
	position: absolute;
	font-size: 25px;
}
.red-suit{
	color: red;
}
</style>
</head>
<body>
<div>맞춘 갯수 : <span id="point">0</span>개</div>
<div>진행 시간 : <span id="sec">0</span>초</div>
<table>
	<tbody id="tBody"></tbody>
</table>
<button onclick="init()">게임시작</button>
<script>
	var cardObjs = [];
	var cnt = 0;
	var sec = 0;
	var autoSec = null;
	function showCard(obj){
		if(!obj.classList.contains('dark')){
			return;
		}
		obj.classList.remove('dark');
		cardObjs.push(obj);
		if(cardObjs.length>2){
			for(var i=0;i<2;i++){
				cardObjs[i].classList.add('dark');
			}
			cardObjs.splice(0,2);
			return;
		}
		
		if(cardObjs.length==2){
			const preValue = cardObjs[0].querySelector('.card-value').innerHTML;
			const value = obj.querySelector('.card-value').innerHTML;
			
			if(preValue === value){
					document.querySelector('#point').innerText = (++cnt);
					cardObjs = [];
					if(cnt==26){
						alert('성공했습니다.');
						clearInterval(autoSec);
					}
				}
			}
		}
	
	const cardSuits = ['◆','♠','♥','♣'];
	const cardValues =  ['A','2','3','4','5','6','7','8','9','10','J','Q','K'];
	const cards = [];
	function init(){
		while(cards.length<52){
			const suitIdx = Math.floor(Math.random() * 4);
			const valueIdx = Math.floor(Math.random() * 13);
			const card = cardSuits[suitIdx] + ',' + cardValues[valueIdx];
			if(!cards.includes(card)){
				cards.push(card);
			}
		}
		var html = '';
		var idx = 0;
		for(var i=0;i<4;i++){
			html += '<tr>';
			for(var j=0;j<13;j++){
				const card = cards[idx++];
				const suit = card.split(',')[0];
				const value = card.split(',')[1];
				var redClass = '';
				if(suit === '◆' || suit === '♥'){
					redClass = ' red-suit';
				}
				html += '<td>';
				html += '<div class="card dark' + redClass + '" onclick="showCard(this)">';
				html += '<div class="card-value">' + value + '</div>';
				html += '<div class="card-suit">' + suit + '</div>';
				html += '</div>';
				html += '</td>';
			}
			html += '</tr>';
		}
		document.querySelector('#tBody').innerHTML = html;
		autoSec = setInterval(function(){
			document.querySelector('#sec').innerText = (++sec);
		},1000);
	}
</script>

</body>
</html>