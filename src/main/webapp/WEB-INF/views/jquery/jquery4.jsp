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
<div></div>
<div></div>
<div></div>
<div></div>
<div></div>

<script>
const divs = document.querySelectorAll('div');
for(const div of divs){
	div.innerHTML = 'ㅂㅏ뀜';
}

divs.forEach(function(div)){
	div.innerHTML = 'ㅂㅏ뀜';
}

$('div').each(function(idx, div){
	div.innerHTML = '바뀜';
	
})
</script>

</body>
</html>