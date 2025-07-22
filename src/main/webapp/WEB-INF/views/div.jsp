<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오른쪽에서 왼쪽 이동</title>
<style>
#move1, #move2 {
	margin-bottom: 5px;
	width: 100px;
	height: 50px;
	right: 0px; /* ✅ 처음에 오른쪽에 위치 */
	border: 2px solid #cccccc;
	background-color: #dddddd;
	border-radius: 10px;
	position: relative;
	display: flex;
	align-items: center;
	justify-content: center;
	transition: 1s;
}

.test {
	right: 50px !important;
	opacity: 0;
}
</style>
</head>
<body>

<div id="move1">Move1</div>
<div id="move2">Move2</div>

<button onclick="move()">오른쪽에서 왼쪽으로 움직여1</button>
<button onclick="move2(500, 10)">오른 왼 움직여2 </button> 

<script>
function move(){
	const moveDiv = document.getElementById('move1'); 
	if(moveDiv.classList.contains('test')){  
		moveDiv.classList.remove('test');
	}else{
		moveDiv.classList.add('test');  
	}
}

function move2(max, sec){
	const moveDiv = document.getElementById('move2'); 
	var left = max; 
	var opacity = 1;
	
	moveDiv.style.left = left + 'px'; 
	
	var leftMove = setInterval(function(){
		moveDiv.style.left = (left--) + 'px'; 
		if(left % 10 == 0){
			opacity -= 0.2;
			moveDiv.style.opacity = opacity;
		}
		if(left <= 0){ 
			clearInterval(leftMove);
		}
	}, sec);
}
</script>

</body>
</html>
