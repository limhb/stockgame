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
function check(sec, text){
	const promise = new Promise(function(resolve, reject){
		setTimeout(function(){
			document.write(text + '<br>');
			resolve(true);
		},sec);
	});
	
	return promise;
}

check(3000,'1')
.then(function(){
	return check(2000,'2');
})
.then(function(){
	return check(1000,'3');
})
.then(function(){
	check(0,'완료');
})
</script>

</body>
</html>