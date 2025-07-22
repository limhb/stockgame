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
<div id="d1">DIV1</div>
<div id="d2">DIV2</div>

<script>
const d1 = document.QuerySelector('#d1');
d1.style.transition = '1s';
setTimeout(function(){
	d1.style.opcity = 0;
},100);

const d2 = $('#d2');
d2.fadeOut(1100);
</script>
</body>
</html>