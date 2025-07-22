<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
div{
	width : 100px;
	height : 100px;
	background-color : grey;
	transition : 0.3s;
	
}

.circle{
	border-radius : 50%;
	background-color : pink;
}
</style>
</head>
<body>
<div onmouseover="this.classList.add('circle')" onmouseout="this.classList.remove('circle')"></div>
<button onclick='circle()'>클릭</button>
<!-- 클릭 버튼을 클릭했을때 div의 class에 circle을 추가하고 다시 클릭했을때는 원래 상태로 돌아가게 만드시오. -->
<script>
function circle() {
	const div = document.querySelector('div');
	div.classList.toggle('circle'); 
}

</script>
</body>
</html>