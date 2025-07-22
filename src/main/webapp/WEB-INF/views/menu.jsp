<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사이드 메뉴</title>
<style>
.menu {
	position: fixed;
	width: 300px;
	height: 100%;
	background-color: #333;
	color: white;
	top: 0;
	right: 0;
	padding: 10px;
	transform: translateX(100%);
	transition: 0.5s;
}
.open {
	transform: translateX(0);
}
.toggle {
	position: fixed;
	top: 20px;
	right: 20px;
	padding: 10px;
	background-color: #00cdef;
	border: none;
	color: white;
	cursor: pointer;
}
</style>
</head>
<body>

<!-- 버튼 추가 -->
<button class="toggle" onclick="toggleMenu()">Open</button>

<div class="menu" id="menu">
	<h2>메뉴</h2>
	<ul>
		<li>서브 메뉴1</li>
		<li>서브 메뉴2</li>
		<li>서브 메뉴3</li>
	</ul>
	<!-- 닫기 버튼 추가 -->
	
</div>

<script>
function toggleMenu() {
	const menu = document.getElementById("menu");
	menu.classList.toggle("open"); // ✅ 클릭할 때마다 open 클래스 추가/삭제
}
</script>

</body>
</html>
