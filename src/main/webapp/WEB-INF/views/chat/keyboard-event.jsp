<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="mirror"></div>
keypress : <input type="text" id="msg" onkeypress="changeDiv(this)"><br>
keydown : <input type="text" id="msg" onkeydown="changeDiv(this)"><br>
keyup : <input type="text" id="msg" onkeyup="changeDiv(this)"><br>
<script>
	/*
		onkeypress, onkeydown, onkeyup
	*/

	function changeDiv(obj){
		document.querySelector('#mirror').innerHTML = obj.value;
	}
</script>
</body>
</html>