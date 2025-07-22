
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="game" style="display:none">
	<table border="1">
		<tbody id="tBody"></tbody>
	</table></div>
<div id="start">
	<button onclick="startGame()">게임시작</button>
</div>
<script>
const cardTypes = ['Spade', 'Diamond', 'Heart', 'Clover']
const cardValues  = ['A','2','3','4','5','6','7','8','9','10','J','Q','K'];

const cards = [];
function startGame(){
	while(cards.length<52){
	var fNum = Math.floor(Math.random() * 4);
	var lNum = Math.floor(Math.random() * 13);
	var card = cardTypes[fNum] + ' , ' + cardValues[lNum];
	if(!cards.includes(card)){
		cards.push(card);
		}
	}
	var html = '';
	var idx = 0;
	for(var i = 0;i<cardTypes.length;i++){
		html += '<tr>';
		for(var j=0;j<cardValues.length;j++){
			html += '<td>' + cards[idx++] + '</td>';
		}
		html += '</tr>';
	}
	document.querySelector('#tBody').innerHTML = html;
	document.querySelector('#game').style.display='block';
}
</script>
</body>
</html>