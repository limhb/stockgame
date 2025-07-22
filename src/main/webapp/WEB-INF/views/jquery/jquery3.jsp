<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/resources/jquery-3.7.1.js"></script>
</head>
<body>

<div id="d1" style="display:none">div1</div>
<div id="d2">div2</div>
<div id="d3">div3</div>
<div id="d4">div4</div>
<div id="d5">div5</div>

<script>
$('#d1').fadeIn(2000); //나타나기
$('#d2').fadeOut(); //사라지기
$('#d3').fafeToggle(2000); // 나타났다가 사라지기

</script>
</body>
</html>