<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
function test()1{
	alert(1);
	
}

test2();
var test2 = function(){
	alert(2);
}

function Person(){
	alert(window===this);
	this.username = '김철수';
	this.age = 33;
	
}
const person = new Person();
alert(person.username);

</script>
</body>
</html>