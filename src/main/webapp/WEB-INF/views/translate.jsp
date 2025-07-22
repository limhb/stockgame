<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.main{
	margin : 10px;
	overflow : hidden;
	positio : relative;

}

.sub{
	width:100px;
	height:100px;
	background-color: #aaaaaa;
	color: white;
	dsiplay:flex;
	align-items: center;
	jusify-content:center;
	margin:5px;
}

.t-200{
	transform:translateX(200px);

}
.minus-t-30{
	transform : translateX(-30px);

}

.percent-t-50{
	transform : translate(50%);

}
.ani{
	animation : moveX 3s infinite;
}

@keyframes moveX{
	from{transform:translateX(0)}
	to{transform:translateX(100px)}
}
</style>
</head>
<body>
<div class="main">
	<div class="sub t-200">200px만큼 이동</div>
</div>
<div class="main">
	<div class="sub minus-t-30">-30px만큼 이동</div>
</div>

<div class="main">
	<div class="sub percent-t-50">50%만큼 이동</div>
</div>

<div class="main">
	<div class="sub ani">100px만큼 자연스럽게 이동</div>
</div>
</body>
</html>