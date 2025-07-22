<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div onclick="show(this)">
	<div class="test">test1</div>
</div>
<div onclick="show(this)">
	<div class="test">test2</div>
</div>
<script>
function show(obj){
	const t1 = obj.querySelector('.test');
	alert(t1.innerHTML);
}

</script>
</body>
</html>