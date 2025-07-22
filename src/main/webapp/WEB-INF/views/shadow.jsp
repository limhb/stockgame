<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.main{
	display:flex;
	flex-wrap:wrap;
	padding:20px;
	background-color:#dddddd;
	

}
.sub{
	background-color:gery;
	width:100px;
	height:100px;
	padding:10px;
	margin : 5px;

}
.shadow1{
	box-shadow : 0 2px 5px;
}

.shadow2{
	box-shadow: 0 8px 20px;
}
</style>
</head>
<body>
<div class="main">
	<div class="sub shadow1">그림자1</div>
	<div class="sub shadow2">그림자1</div>

</div>

</body>
</html>